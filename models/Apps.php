<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "apps".
 *
 * @property int $id
 * @property string $name
 * @property string $domain
 * @property int $banned
 * @property string $mail_name
 * @property string $mail_host
 * @property string $mail_username
 * @property string $mail_password
 * @property int $max_virtual_dollars
 * @property int $min_increase_amount
 * @property int $min_withdrawal_amount
 * @property int $min_order_amount
 * @property int $min_affiliate_order_amount
 * @property string $merchant_id
 * @property string $merchant_secret_word
 * @property string $merchant_secret_word_2
 * @property int $support_chat
 * @property float $exchange
 */
class Apps extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'apps';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'domain', 'banned', 'mail_name', 'mail_host', 'mail_username', 'mail_password', 'max_virtual_dollars', 'min_increase_amount', 'min_withdrawal_amount', 'min_order_amount', 'min_affiliate_order_amount', 'merchant_id', 'merchant_secret_word', 'merchant_secret_word_2', 'support_chat', 'exchange'], 'required'],
            [['banned', 'max_virtual_dollars', 'min_increase_amount', 'min_withdrawal_amount', 'min_order_amount', 'min_affiliate_order_amount', 'support_chat'], 'integer'],
            [['exchange'], 'number'],
            [['name', 'domain', 'mail_name', 'mail_host', 'mail_username', 'mail_password', 'merchant_id', 'merchant_secret_word', 'merchant_secret_word_2'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'domain' => 'Domain',
            'banned' => 'Banned',
            'mail_name' => 'Mail Name',
            'mail_host' => 'Mail Host',
            'mail_username' => 'Mail Username',
            'mail_password' => 'Mail Password',
            'max_virtual_dollars' => 'Max Virtual Dollars',
            'min_increase_amount' => 'Min Increase Amount',
            'min_withdrawal_amount' => 'Min Withdrawal Amount',
            'min_order_amount' => 'Min Order Amount',
            'min_affiliate_order_amount' => 'Min Affiliate Order Amount',
            'merchant_id' => 'Merchant ID',
            'merchant_secret_word' => 'Merchant Secret Word',
            'merchant_secret_word_2' => 'Merchant Secret Word 2',
            'support_chat' => 'Support Chat',
            'exchange' => 'Exchange',
        ];
    }
}
