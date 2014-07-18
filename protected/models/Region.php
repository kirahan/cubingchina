<?php

/**
 * This is the model class for table "region".
 *
 * The followings are the available columns in table 'region':
 * @property integer $id
 * @property string $name
 * @property string $name_zh
 * @property integer $pid
 */
class Region extends ActiveRecord {

	public static function getRegionById($id) {
		return self::model()->findByPk($id);
	}

	public static function getCountries() {
		$attr = 'name';
		if (Yii::app()->language{0} == 'z' && Yii::app()->language{1} == 'h') {
			$attr = 'name_zh';
		}
		$attribute = Yii::app()->controller->getAttributeName('name');
		return CHtml::listData(self::getRegionsByPid(0), 'id', $attribute);
	}

	public static function getProvinces() {
		$attribute = Yii::app()->controller->getAttributeName('name');
		return CHtml::listData(self::getRegionsByPid(1), 'id', $attribute);
	}

	public static function getAllCities() {
		$attribute = Yii::app()->controller->getAttributeName('name');
		$cities = Yii::app()->db
			->cache(86400)
			->createCommand()
			->select('*')
			->from('region')
			->where('pid>1')
			->order('id')
			->queryAll();
		$allCities = array();
		foreach ($cities as $city) {
			if (!isset($allCities[$city['pid']])) {
				$allCities[$city['pid']] = array();
			}
			$allCities[$city['pid']][$city['id']] = $city[$attribute];
		}
		// $allCities = Yii::app()->controller->translateTWInNeed($allCities);
		return $allCities;
	}

	public static function getRegionIdByName($name) {
		$region = self::model()->findByAttributes(array(
			'name'=>$name,
		));
		if ($region === null) {
			return 0;
		}
		return $region->id;
	}

	public static function getRegionsByPid($pid) {
		return self::model()->findAllByAttributes(array(
			'pid'=>$pid,
		));
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName() {
		return 'region';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules() {
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name', 'required'),
			array('pid', 'numerical', 'integerOnly'=>true),
			array('name', 'length', 'max'=>32),
			array('name_zh', 'length', 'max'=>128),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, name, name_zh, pid', 'safe', 'on'=>'search'),
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
			'id' => Yii::t('Region', 'ID'),
			'name' => Yii::t('Region', 'Name'),
			'name_zh' => Yii::t('Region', 'Name Zh'),
			'pid' => Yii::t('Region', 'Pid'),
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

		$criteria->compare('id',$this->id);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('name_zh',$this->name_zh,true);
		$criteria->compare('pid',$this->pid);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Region the static model class
	 */
	public static function model($className = __CLASS__) {
		return parent::model($className);
	}
}
