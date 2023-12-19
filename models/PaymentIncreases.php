<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "payment_increases".
 *
 * @property int $id
 * @property int $app_id
 * @property string $user_id
 * @property int $type
 * @property float $amount
 * @property int $promocode_id
 * @property float $full_amount
 * @property string $status
 * @property int $affiliate_invitation_id
 * @property int $affiliate_invitation_paid
 * @property string $date
 * @property string $order_id
 */
class PaymentIncreases extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'payment_increases';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'amount', 'promocode_id', 'status', 'affiliate_invitation_id', 'order_id'], 'required'],
            [['app_id', 'type', 'promocode_id', 'affiliate_invitation_id', 'affiliate_invitation_paid'], 'integer'],
            [['amount', 'full_amount'], 'number'],
            [['date'], 'safe'],
            [['user_id', 'status', 'order_id'], 'string', 'max' => 255],
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
            'type' => 'Тип пополнения',
            'amount' => 'Сумма',
            'promocode_id' => 'Промокод',
            'full_amount' => 'Финальная сумма',
            'status' => 'Статус',
            'affiliate_invitation_id' => 'Пригласил партнер',
            'affiliate_invitation_paid' => 'Партнеру выплачено',
            'date' => 'Дата',
            'order_id' => 'Заказ',
        ];
    }
}
