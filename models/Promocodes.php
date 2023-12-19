<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "promocodes".
 *
 * @property int $id
 * @property int $app_id
 * @property int $creator_id
 * @property string $name
 * @property int $payment_bonus
 * @property int $from_admin_panel
 * @property string $date
 */
class Promocodes extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'promocodes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['app_id', 'creator_id', 'name', 'payment_bonus', 'from_admin_panel'], 'required'],
            [['app_id', 'creator_id', 'payment_bonus', 'from_admin_panel'], 'integer'],
            [['date'], 'safe'],
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
            'creator_id' => 'Создатель',
            'name' => 'Название',
            'payment_bonus' => 'Сумма бонуса',
            'from_admin_panel' => 'From Admin Panel',
            'date' => 'Дата',
        ];
    }
}
