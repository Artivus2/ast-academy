<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "affiliate_payment_increases".
 *
 * @property int $id
 * @property int $app_id
 * @property int $affiliate_user_id
 * @property int $trader_user_id
 * @property int $offer_id
 * @property float $amount
 * @property string $date
 * @property string $order_id
 */
class AffiliatePaymentIncreases extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'affiliate_payment_increases';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['affiliate_user_id', 'trader_user_id', 'offer_id', 'amount', 'order_id'], 'required'],
            [['app_id', 'affiliate_user_id', 'trader_user_id', 'offer_id'], 'integer'],
            [['amount'], 'number'],
            [['date'], 'safe'],
            [['order_id'], 'string', 'max' => 255],
        ];
    }

    public function getAffiliateUser()
    {
        return $this->hasOne(AffiliateUsers::className(), ['id' => 'affiliate_user_id']);
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'app_id' => 'App ID',
            'affiliate_user_id' => 'Партнер',
            'trader_user_id' => 'Клиент',
            'offer_id' => 'Тип партнерской программы',
            'amount' => 'Сумма',
            'date' => 'Дата',
            'order_id' => 'Заказ',
        ];
    }
}
