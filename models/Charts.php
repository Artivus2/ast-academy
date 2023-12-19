<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "charts".
 *
 * @property int $id
 * @property int $app_id
 * @property string|null $exchange
 * @property string|null $symbol
 * @property string|null $name
 * @property int|null $yield
 * @property float $course
 * @property int|null $category_id
 * @property int|null $priority
 * @property int $hidden
 */
class Charts extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'charts';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['hidden'], 'required'],
            [['app_id', 'yield', 'category_id', 'priority', 'hidden'], 'integer'],
            [['course'], 'number'],
            [['exchange', 'symbol', 'name'], 'string', 'max' => 255],
        ];
    }

    public function getCategory()
    {
        return $this->hasOne(ChartsCategories::className(), ['id' => 'category_id']);
    }


    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'app_id' => 'App ID',
            'exchange' => 'Поставщик',
            'symbol' => 'Псевдоним',
            'name' => 'Название',
            'yield' => 'Процент',
            'course' => 'Текущий курс',
            'category_id' => 'Категория',
            'priority' => 'Приоритет',
            'hidden' => 'Скрыт',
        ];
    }
}
