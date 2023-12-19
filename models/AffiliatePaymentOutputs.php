<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "affiliate_payment_outputs".
 *
 * @property int $id
 * @property int $app_id
 * @property int $affiliate_user_id
 * @property int|null $wallet_type_id
 * @property string $wallet_data
 * @property float $amount
 * @property string $comment
 * @property string $status
 * @property int $promocode_id
 * @property string $date
 * @property string $order_id
 */
class AffiliatePaymentOutputs extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'affiliate_payment_outputs';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['affiliate_user_id', 'wallet_data', 'amount', 'comment', 'status', 'order_id'], 'required'],
            [['app_id', 'affiliate_user_id', 'wallet_type_id', 'promocode_id'], 'integer'],
            [['amount'], 'number'],
            [['comment'], 'string'],
            [['date'], 'safe'],
            [['wallet_data', 'status', 'order_id'], 'string', 'max' => 255],
        ];
    }

    public function getAffiliateUser()
    {
        return $this->hasOne(AffiliateUsers::className(), ['id' => 'affiliate_user_id']);
    }

    public function getWalletTypes()
    {
        return $this->hasOne(AffiliateWalletTypes::className(), ['wallet_type_id' => 'id']);
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
            'wallet_type_id' => 'Способ вывода',
            'wallet_data' => 'Счет для вывода',
            'amount' => 'Сумма',
            'comment' => 'Комментарий',
            'status' => 'Статус',
            'promocode_id' => 'Промокод',
            'date' => 'Дата',
            'order_id' => 'Заказ',
        ];
    }
}
