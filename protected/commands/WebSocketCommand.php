<?php
use Ratchet\Session\SessionProvider;
use Symfony\Component\HttpFoundation\Session\Storage\Handler\PdoSessionHandler;
use Ratchet\Server\IoServer;
use Ratchet\Http\HttpServer;
use Ratchet\Wamp\WampServer;
use Ratchet\WebSocket\WsServer;
use React\EventLoop\StreamSelectLoop;
use React\Socket\Server as Reactor;

Yii::import('application.websocket.*');

class WebSocketCommand extends CConsoleCommand {
	const ADDRESS = '127.0.0.1';

	public function actionIndex() {
		$db = Yii::app()->db;
		$pdo = $db->getPdoInstance();
		$cache = Yii::app()->cache;

		$loop = new StreamSelectLoop();
		$liveServer = new LiveServer();
		$client = new Predis\Async\Client([
			'host'=>$cache->hostname,
			'port'=>$cache->port,
		], $loop);
		$client->connect([$liveServer, 'initSubscriber']);

		$session = new SessionProvider(
			$liveServer,
			new PdoSessionHandler($pdo, array(
				'lock_mode'=>PdoSessionHandler::LOCK_NONE,
			)),
			array(
				'name'=>'CUBINGCHINA_SID'
			)
		);
		Yii::getLogger()->autoDump = true;
		Yii::getLogger()->autoFlush = 1;
		$app = new HttpServer(new WsServer($session));
		$socket = new Reactor($loop);
		$socket->listen(DEV ? 8081 : 8080, self::ADDRESS);
		$server = new IoServer($app, $socket, $loop);
		$server->run();
	}

	public function actionRecordComputer() {
		$cache = Yii::app()->cache;
		$loop = new StreamSelectLoop();
		$publisher = new Predis\Async\Client([
			'host'=>$cache->hostname,
			'port'=>$cache->port,
		], $loop);
		$loop->addPeriodicTimer(0.2, function() use ($cache, $publisher) {
			$redis = $cache->redis;
			$data = [];
			while (($message = $redis->lPop('record.compute')) !== false) {
				$message = json_decode($message);
				$data[$message->competitionId][] = $message->event;
			}
			foreach ($data as $competitionId=>$events) {
				$competition = Competition::model()->findByPk($competitionId);
				if ($competition == null) {
					continue;
				}
				$results = [];
				foreach ($events as $event) {
					foreach (['best', 'average'] as $type) {
						foreach ($competition->computedRecords($event, $type) as $records) {
							foreach ($records as $record) {
								$results[] = $record->getShowAttributes();
							}
						}
					}
				}
				if ($results != []) {
					$publisher->publish('record.computed', json_encode([
						'competitionId'=>$competition->id,
						'results'=>$results,
					]));
				}
			}
		});
		$loop->run();
	}
}
