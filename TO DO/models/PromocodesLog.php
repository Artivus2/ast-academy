<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "promocodes_log".
 *
 * @property int $id
 * @property int $app_id
 * @property int $promocode_id
 * @property int $user_id
 * @property string $date
 * @property string $order_id
 */
class PromocodesLog extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'promocodes_log';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['app_id', 'promocode_id', 'user_id', 'order_id'], 'required'],
            [['app_id', 'promocode_id', 'user_id'], 'integer'],
            [['date'], 'safe'],
            [['order_id'], 'string', 'max' => 255],
        ];
    }

    public function getPromocode()
    {
        return $this->hasOne(Promocodes::className(), ['id' => 'promocode_id']);
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'app_id' => 'App ID',
            'promocode_id' => 'Промокод',
            'user_id' => 'Пользователь',
            'date' => 'Дата',
            'order_id' => 'Заказ',
        ];
    }
}
