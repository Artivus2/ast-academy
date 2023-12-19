<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "charts_categories".
 *
 * @property int $id
 * @property int $app_id
 * @property string|null $name
 * @property int|null $priority
 * @property int $hidden
 */
class ChartsCategories extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'charts_categories';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['hidden'], 'required'],
            [['app_id', 'priority', 'hidden'], 'integer'],
            [['name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'app_id' => 'App ID',
            'name' => 'Название',
            'priority' => 'Приоритет',
            'hidden' => 'Скрыт',
        ];
    }
}
