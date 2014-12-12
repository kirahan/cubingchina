<?php

class RecordsSet extends Statistics {

	public static function build($statistic) {
		$command = Yii::app()->wcaDb->createCommand()
		->from('Results r')
		->where('regionalSingleRecord!="" OR regionalAverageRecord!=""')
		->group($statistic['group'])
		->order('score DESC, WR DESC, AsR DESC, NR DESC')
		->limit(10);
		$select = array();
		$score = array();
		$columns = array();
		foreach (array('WR'=>10, 'AsR'=>5, 'NR'=>1) as $record=>$weight) {
			$temp = sprintf('sum(CASE WHEN regionalSingleRecord="%s" THEN 1 ELSE 0 END) + sum(CASE WHEN regionalAverageRecord="%s" THEN 1 ELSE 0 END)', $record, $record, $record);
			$select[] = sprintf('%s AS %s', $temp, $record);
			$score[] = sprintf('(%s) * %d', $temp, $weight);
			$columns[] = array(
				'header'=>Yii::t('common', $record),
				'name'=>$record,
			);
		}
		$score = implode(' + ', $score) . ' AS score';
		$select[] = $score;
		array_unshift($columns, array(
			'header'=>CHtml::tag('span', array(
				'title'=>"WR: 10\nAsR: 5\nNR: 1",
			), Yii::t('statistics', 'Score') . Html::fontAwesome('question-circle')),
			'value'=>'CHtml::tag("b", array(), $data["score"])',
			'type'=>'raw',
		));
		switch ($statistic['group']) {
			case 'personId':
				$select = array_merge($select, array(
					'personId',
					'personName',
				));
				$command->andWhere('personCountryId="China"');
				array_unshift($columns, array(
					'header'=>Yii::t('statistics', 'Person'),
					'value'=>'Persons::getLinkByNameNId($data["personName"], $data["personId"])',
					'type'=>'raw',
				));
				break;
			case 'competitionId':
				$select = array_merge($select, array(
					'competitionId',
					'c.cellName',
				));
				$command->leftJoin('Competitions c', 'r.competitionId=c.id');
				$command->andWhere('c.countryId="China"');
				array_unshift($columns, array(
					'header'=>Yii::t('common', 'Competitions'),
					'value'=>'CHtml::link(ActiveRecord::getModelAttributeValue($data, "name"), $data["url"])',
					'type'=>'raw',
				));
				break;
		}
		$rows = $command->select($select)->queryAll();
		if ($statistic['group'] === 'competitionId') {
			$rows = array_map(function($row) {
				return self::getCompetition($row);
			}, $rows);
		}
		return self::makeStatisticsData($statistic, $columns, $rows);
	}
}
