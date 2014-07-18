<?php

/**
 * This is the model class for table "Events".
 *
 * The followings are the available columns in table 'Events':
 * @property string $id
 * @property string $name
 * @property integer $rank
 * @property string $format
 * @property string $cellName
 */
class Events extends ActiveRecord {
	private static $_allEvents;
	private static $_specialEventNames = array(
		'pyram'=>'pyra',
		'minx'=>'mega',
		'333oh'=>'3oh',
		'333bf'=>'3bld',
		'333mbf'=>'3multi',
		'333ft'=>'3feet',
		'444bf'=>'4bld',
		'555bf'=>'5bld',
	);
	private static $_defaultExportFormats = array(
		'333'=>'average5s',
		'444'=>'average5m',
		'555'=>'average5m',
		'222'=>'average5s',
		'333bf'=>'best3m',
		'333oh'=>'average5s',
		'333fm'=>'best1n',
		'333ft'=>'mean3m',
		'minx'=>'average5m',
		'pyram'=>'average5s',
		'sq1'=>'average5s',
		'clock'=>'average5s',
		'skewb'=>'average5s',
		'666'=>'mean3m',
		'777'=>'mean3m',
		'444bf'=>'best1m',
		'555bf'=>'best1m',
		'333mbf'=>'multibf1',
		'default'=>'average5s',
	);

	public static function getAllExportFormats() {
		$formats = array(
			'average5s',
			'average5m',
			'mean3s',
			'mean3m',
			'mean3n',
			'best1m',
			'best2m',
			'best3m',
			'best1n',
			'best2n',
			'multibf1',
			'multibf2',
			'best1s',
			'best2s',
			'best3s',
		);
		return array_combine($formats, $formats);
	}

	public static function getDefaultExportFormat($event) {
		return isset(self::$_defaultExportFormats[$event]) ? self::$_defaultExportFormats[$event] : self::$_defaultExportFormats['default'];
	}

	public static function getColumnName($event) {
		if (isset(self::$_specialEventNames[$event])) {
			$event = self::$_specialEventNames[$event];
		}
		return ucfirst($event);
	}

	public static function getFullEventName($event) {
		if (self::$_allEvents === null) {
			self::$_allEvents = self::getScheduleEvents();
		}
		return isset(self::$_allEvents[$event]) ? self::$_allEvents[$event] : $event;
	}

	public static function getScheduleEvents() {
		return self::getOnlyScheduleEvents() + self::getAllEvents();
	}

	public static function getOnlyScheduleEvents() {
		return array(
			'registration'=>'Registration',
			'intro'=>'Opening Intro',
			'lunch'=>'Lunch',
			'break'=>'Break',
			'lucky'=>'Lucky Draw',
			'ceremony'=>'Award Ceremony',
		);
	}

	public static function getAllEvents() {
		return self::getNormalEvents() + self::getOtherEvents();
	}

	public static function getOtherEvents() {
		return array(
			'magic'=>'Rubik\'s Magic',
			'mmagic'=>'Master Magic',
			'stack'=>'Sport Stacking',
		);
	}

	public static function getNormalEvents() {
		$events = self::model()->cache(86500 * 7)->findAll(array(
			'condition'=>'rank<900',
			'order'=>'rank',
		));
		$events = CHtml::listData($events, 'id', 'cellName');
		return $events;
	}
	/**
	 * @return string the associated database table name
	 */
	public function tableName() {
		return 'Events';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules() {
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('rank', 'numerical', 'integerOnly'=>true),
			array('id', 'length', 'max'=>6),
			array('name', 'length', 'max'=>54),
			array('format', 'length', 'max'=>10),
			array('cellName', 'length', 'max'=>45),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, name, rank, format, cellName', 'safe', 'on'=>'search'),
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
			'id' => Yii::t('Events', 'ID'),
			'name' => Yii::t('Events', 'Name'),
			'rank' => Yii::t('Events', 'Rank'),
			'format' => Yii::t('Events', 'Format'),
			'cellName' => Yii::t('Events', 'Cell Name'),
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
		$criteria->compare('name',$this->name,true);
		$criteria->compare('rank',$this->rank);
		$criteria->compare('format',$this->format,true);
		$criteria->compare('cellName',$this->cellName,true);

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
	 * @return Events the static model class
	 */
	public static function model($className = __CLASS__) {
		return parent::model($className);
	}
}
