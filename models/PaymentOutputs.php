<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "payment_outputs".
 *
 * @property int $id
 * @property int $app_id
 * @property int $user_id
 * @property string $type
 * @property string $card_number
 * @property string $card_holder
 * @property float $amount
 * @property int $promocode_id
 * @property string $status
 * @property string $date
 * @property string $order_id
 */
class PaymentOutputs extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'payment_outputs';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'type', 'card_number', 'card_holder', 'amount', 'status', 'order_id'], 'required'],
            [['app_id', 'user_id', 'promocode_id'], 'integer'],
            [['amount'], 'number'],
            [['date'], 'safe'],
            [['type'], 'string', 'max' => 100],
            [['card_number', 'card_holder', 'status', 'order_id'], 'string', 'max' => 255],
        ];
    }

    public function getUser()
    {
        return $this->hasOne(Users::className(), ['id' => 'user_id']);
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'app_id' => 'App ID',
            'user_id' => 'Пользователь',
            'type' => 'Платежная система',
            'card_number' => 'Номер счета',
            'card_holder' => 'Card Holder',
            'amount' => 'Сумма',
            'promocode_id' => 'Промокод',
            'status' => 'Статус',
            'date' => 'Дата',
            'order_id' => 'Заказ',
        ];
    }
}
