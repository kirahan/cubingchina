<?php

/**
 * This is the model class for table "Results".
 *
 * The followings are the available columns in table 'Results':
 * @property string $id
 * @property string $competitionId
 * @property string $eventId
 * @property string $roundId
 * @property integer $pos
 * @property integer $best
 * @property integer $average
 * @property string $personName
 * @property string $personId
 * @property string $countryCountryId
 * @property string $formatId
 * @property integer $value1
 * @property integer $value2
 * @property integer $value3
 * @property integer $value4
 * @property integer $value5
 * @property string $regionalSingleRecord
 * @property string $regionalAverageRecord
 */
class Results extends ActiveRecord {

	public static function getRankings($type = 'single', $event = '333', $gender = 'all', $page = 1) {
		$cache = Yii::app()->cache;
		$cacheKey = "results_rankings_{$type}_{$event}_{$gender}_{$page}";
		$expire = 86400 * 7;
		$field = $type === 'single' ? 'best' : 'average';
		if (($data = $cache->get($cacheKey)) === false) {
			$command = Yii::app()->wcaDb->createCommand()
			->select(array(
				'rs.eventId',
				sprintf('MIN(rs.%s) AS best', $field),
				'rs.personId',
			))
			->from('Results rs')
			->leftJoin('Persons p', 'rs.personId=p.id AND p.subid=1')
			->where(sprintf('rs.%s>0', $field))
			->andWhere('rs.eventId=:eventId', array(
				':eventId'=>$event,
			))
			->andWhere('rs.personCountryId="China"');
			switch ($gender) {
				case 'female':
					$command->andWhere('p.gender="f"');
					break;
				case 'male':
					$command->andWhere('p.gender="m"');
					break;
			}
			$cmd1 = clone $command;
			$cmd2 = clone $command;
			$count = $cmd1->select('COUNT(DISTINCT rs.personId) AS count')
			->queryScalar();
			if ($page > ceil($count / 100)) {
				$page = ceil($count / 100);
			}
			$rows = array();
			$command->group('rs.personId')
			->order(sprintf('best ASC, p.name ASC', $field))
			->limit(100, ($page - 1) * 100);
			$eventBestPerson = array_map(function($row) {
				return sprintf('("%s", %d, "%s")', $row['eventId'], $row['best'], $row['personId']);
			}, $command->queryAll());
			if ($eventBestPerson !== array()) {
				$command = Yii::app()->wcaDb->createCommand()
				->select(array(
					'rs.eventId',
					sprintf('rs.%s AS best', $field),
					'rs.personId',
					'rs.personName',
					'rs.personCountryId',
					'rs.competitionId',
					'rs.value1',
					'rs.value2',
					'rs.value3',
					'rs.value4',
					'rs.value5',
					'c.cellName',
					'c.year',
					'c.month',
					'c.day',
				))
				->from('Results rs')
				->leftJoin('Persons p', 'rs.personId=p.id AND p.subid=1')
				->leftJoin('Competitions c', 'rs.competitionId=c.id')
				->where(sprintf('(rs.eventId, rs.%s, rs.personId) IN (%s)',
					$field,
					implode(',', $eventBestPerson)
				))
				->order(sprintf('rs.%s ASC, p.name ASC', $field));
				foreach ($command->queryAll() as $row) {
					$row['type'] = $type;
					$row = Statistics::getCompetition($row);
					$rows[$row['personId']] = $row;
				}
				$rows = array_values($rows);
			}
			$rank = isset($rows[0]) ? $cmd2->select('COUNT(DISTINCT rs.personId) AS count')
			->andWhere(sprintf('rs.%s<' . $rows[0]['best'], $field))
			->queryScalar() : 0;
			$data = array(
				'count'=>$count,
				'rows'=>$rows,
				'rank'=>$rank,
			);
			$cache->set($cacheKey, $data, $expire);
		}
		return $data;
	}

	public static function getRecords($type = 'current', $region = 'China', $event = '333') {
		$cache = Yii::app()->cache;
		$cacheKey = "results_records_{$type}_{$region}_{$event}";
		$expire = 86400 * 7;
		if (($data = $cache->get($cacheKey)) === false) {
			switch ($type) {
				case 'history':
					$data = self::getHistoryRecords($region, $event);
					break;
				default:
					$data = self::getCurrentRecords($region);
					break;
			}
			$cache->set($cacheKey, $data, $expire);
		}
		return $data;
	}

	public static function getHistoryRecords($region = 'China', $event = '333') {
		$command = Yii::app()->wcaDb->createCommand()
		->select(array(
			'rs.eventId',
			'rs.best',
			'rs.average',
			'rs.personId',
			'rs.personName',
			'rs.personCountryId',
			'rs.competitionId',
			'rs.value1',
			'rs.value2',
			'rs.value3',
			'rs.value4',
			'rs.value5',
			'rs.regionalSingleRecord',
			'rs.regionalAverageRecord',
			'c.cellName',
			'c.year',
			'c.month',
			'c.day',
		))
		->from('Results rs')
		->leftJoin('Competitions c', 'rs.competitionId=c.id')
		->leftJoin('Rounds round', 'rs.roundId=round.id')
		->where('rs.eventId=:eventId', array(
			':eventId'=>$event,
		))
		->order('c.year DESC, c.month DESC, c.day DESC, round.rank DESC, rs.personName ASC');
		switch ($region) {
			case 'World':
				break;
			case 'Africa':
			case 'Asia':
			case 'Oceania':
			case 'Europe':
			case 'North America':
			case 'South America':
				$command->leftJoin('Countries country', 'rs.personCountryId=country.id');
				$command->andWhere('country.continentId=:region', array(
					':region'=>'_' . $region,
				));
				break;
			default:
				$command->andWhere('rs.personCountryId=:region', array(
					':region'=>$region,
				));
				break;
		}
		$rows = array();
		foreach (array('single', 'average') as $type) {
			$cmd = clone $command;
			switch ($region) {
				case 'World':
					$cmd->andWhere(sprintf('rs.regional%sRecord="WR"', ucfirst($type)));
					break;
				case 'Africa':
				case 'Asia':
				case 'Oceania':
				case 'Europe':
				case 'North America':
				case 'South America':
					$cmd->leftJoin('Continents continent', 'country.continentId=continent.id');
					$cmd->andWhere(sprintf('rs.regional%sRecord IN (continent.recordName, "WR")', ucfirst($type)));
					break;
				default:
					$cmd->andWhere(sprintf('rs.regional%sRecord!=""', ucfirst($type)));
					break;
			}
			$rows[$type] = array();
			foreach ($cmd->queryAll() as $row) {
				$row['type'] = $type;
				$row = Statistics::getCompetition($row);
				$rows[$type][] = $row;
			}
		}
		return call_user_func_array('array_merge', $rows);

	}

	public static function getCurrentRecords($region = 'China') {
		$command = Yii::app()->wcaDb->createCommand()
		->select(array(
			'r.*',
			'r.best AS average',
			'rs.personName',
			'rs.personCountryId',
			'rs.competitionId',
			'rs.value1',
			'rs.value2',
			'rs.value3',
			'rs.value4',
			'rs.value5',
			'c.cellName',
			'c.year',
			'c.month',
			'c.day',
		))
		->leftJoin('Events e', 'r.eventId=e.id')
		->leftJoin('Persons p', 'r.personId=p.id AND p.subid=1')
		->order('e.rank ASC');
		switch ($region) {
			case 'World':
				$command->where('r.worldRank=1');
				break;
			case 'Africa':
			case 'Asia':
			case 'Oceania':
			case 'Europe':
			case 'North America':
			case 'South America':
				$command->leftJoin('Countries country', 'p.countryId=country.id');
				$command->where('r.continentRank=1 AND country.continentId=:region', array(
					':region'=>'_' . $region,
				));
				break;
			default:
				$command->where('r.countryRank=1 AND rs.personCountryId=:region', array(
					':region'=>$region,
				));
				break;
		}
		$rows = array(
			'333'=>array(),
		);
		foreach (array('single', 'average') as $type) {
			$cmd = clone $command;
			$cmd->from(sprintf('Ranks%s r', ucfirst($type)))
			->leftJoin('Results rs', sprintf('r.best=rs.%s AND r.personId=rs.personId AND r.eventId=rs.eventId', $type == 'single' ? 'best' : $type))
			->leftJoin('Competitions c', 'rs.competitionId=c.id');
			foreach ($cmd->queryAll() as $row) {
				$row['type'] = $type;
				$row = Statistics::getCompetition($row);
				$rows[$row['eventId']][] = $row;
			}
		}
		return call_user_func_array('array_merge', $rows);
	}

	public static function formatTime($result, $eventId, $encode = true) {
		if ($result == -1) {
			return 'DNF';
		}
		if ($result == -2) {
			return 'DNS';
		}
		if ($result == 0) {
			return '';
		}
		if($eventId == '333fm') {
			if ($result > 1000) {
				$time = sprintf('%.2f', $result / 100);
			} else {
				$time = $result;
			}
		} elseif($eventId == '333mbf' || ($eventId == '333mbo' && strlen($result) == 9)) {
			$difference = 99 - substr($result, 0, 2);
			$missed = intval(substr($result, -2));
			$time = self::formatGMTime(substr($result, 3, -2), true);
			$solved = $difference + $missed;
			$attempted = $solved + $missed;
			$time = $solved . '/' . $attempted . ' ' . $time;
		} elseif($eventId == '333mbo') {
			$solved = 99 - substr($result, 1, 2);
			$attempted = intval(substr($result, 3, 2));
			$time = self::formatGMTime(substr($result, -5), true);
			$time = $solved . '/' . $attempted . ' ' . $time;
		} else {
			$msecond = substr($result, -2);
			$second = substr($result, 0, -2);
			$time = self::formatGMTime(intval($second)) . '.' . $msecond;
		}
		if ($encode) {
			$time = CHtml::encode($time);
		}
		return $time;
	}
	
	/**
	 * 
	 * @param int $time 要被格式化的时间
	 * @param boolean $multi 是否是多盲
	 */
	private static function formatGMTime($time, $multi = false) {
		if ($multi && $time == '99999') {
			return 'unknown';
		} else if ($time == 0) {
			return '0';
		}
		return ltrim(gmdate('G:i:s', $time), '0:');
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName() {
		return 'Results';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules() {
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('pos, best, average, value1, value2, value3, value4, value5', 'numerical', 'integerOnly'=>true),
			array('competitionId', 'length', 'max'=>32),
			array('eventId', 'length', 'max'=>6),
			array('roundId, formatId', 'length', 'max'=>1),
			array('personName', 'length', 'max'=>80),
			array('personId', 'length', 'max'=>10),
			array('countryCountryId', 'length', 'max'=>50),
			array('regionalSingleRecord, regionalAverageRecord', 'length', 'max'=>3),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, competitionId, eventId, roundId, pos, best, average, personName, personId, countryCountryId, formatId, value1, value2, value3, value4, value5, regionalSingleRecord, regionalAverageRecord', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations() {
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels() {
		return array(
			'id' => Yii::t('Results', 'ID'),
			'competitionId' => Yii::t('Results', 'Competition'),
			'eventId' => Yii::t('Results', 'Event'),
			'roundId' => Yii::t('Results', 'Round'),
			'pos' => Yii::t('Results', 'Pos'),
			'best' => Yii::t('Results', 'Best'),
			'average' => Yii::t('Results', 'Average'),
			'personName' => Yii::t('Results', 'Person Name'),
			'personId' => Yii::t('Results', 'Person'),
			'countryCountryId' => Yii::t('Results', 'Country'),
			'formatId' => Yii::t('Results', 'Format'),
			'value1' => Yii::t('Results', 'Value1'),
			'value2' => Yii::t('Results', 'Value2'),
			'value3' => Yii::t('Results', 'Value3'),
			'value4' => Yii::t('Results', 'Value4'),
			'value5' => Yii::t('Results', 'Value5'),
			'regionalSingleRecord' => Yii::t('Results', 'Regional Single Record'),
			'regionalAverageRecord' => Yii::t('Results', 'Regional Average Record'),
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search() {
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria = new CDbCriteria;

		$criteria->compare('id',$this->id,true);
		$criteria->compare('competitionId',$this->competitionId,true);
		$criteria->compare('eventId',$this->eventId,true);
		$criteria->compare('roundId',$this->roundId,true);
		$criteria->compare('pos',$this->pos);
		$criteria->compare('best',$this->best);
		$criteria->compare('average',$this->average);
		$criteria->compare('personName',$this->personName,true);
		$criteria->compare('personId',$this->personId,true);
		$criteria->compare('countryCountryId',$this->countryCountryId,true);
		$criteria->compare('formatId',$this->formatId,true);
		$criteria->compare('value1',$this->value1);
		$criteria->compare('value2',$this->value2);
		$criteria->compare('value3',$this->value3);
		$criteria->compare('value4',$this->value4);
		$criteria->compare('value5',$this->value5);
		$criteria->compare('regionalSingleRecord',$this->regionalSingleRecord,true);
		$criteria->compare('regionalAverageRecord',$this->regionalAverageRecord,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * @return CDbConnection the database connection used for this class
	 */
	public function getDbConnection() {
		return Yii::app()->wcaDb;
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Results the static model class
	 */
	public static function model($className = __CLASS__) {
		return parent::model($className);
	}
}
