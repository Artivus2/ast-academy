<?php

namespace app\models;

use Yii;
/**
 * @SWG\Definition()
 *
 * @SWG\Property(property="b2b_ads_id", type="integer", description="ID ордера")
 * @SWG\Property(property="uuid", type="string", description="uuid ордера")
 * @SWG\Property(property="Type", type="integer", description="Покупка (2) / продажа (1)")
 * @SWG\Property(property="user_id", type="integer", description="ID пользователя")
 * @SWG\Property(property="user", type="string", description="Логин пользователя")
 * @SWG\Property(property="verify_status", type="integer", description="Статус верификации")
 * @SWG\Property(property="b_status", type="integer", description="Статус предприятия")
 * @SWG\Property(property="chart_id", type="integer", description="Идентификатор используемой криптовалюты")
 * @SWG\Property(property="currency_id", type="integer", description="Идентификатор используемой валюты")
 * @SWG\Property(property="course", type="number", description="Курс")
 * @SWG\Property(property="start_amount", type="number", description="Общая сумма ордера")
 * @SWG\Property(property="amount", type="number", description="Оставшаяся сумма ордера")
 * @SWG\Property(property="min_limit", type="number", description="MIN лимит")
 * @SWG\Property(property="max_limit", type="number", description="MAX лимит")
 * @SWG\Property(property="duration", type="integer", description="Период оплаты")
 * @SWG\Property(property="payments", type="string", description="Способ(ы) оплаты")
 * @SWG\Property(property="history", type="string", description="История сделок")
 * @SWG\Property(property="countPaymentsOrderType", type="integer", description="Количество способов оплаты в ордере")
 * @SWG\Property(property="userOrdersCount", type="integer", description="Количество исполненных ордеров пользователя на бирже")
 * @SWG\Property(property="date", type="string", description="Дата размещения на бирже")
 * @SWG\Property(property="status", type="integer", description="Статус ордера")
 * @SWG\Property(property="canDelete", type="integer", description="Возможность удаления ордера")
 * @SWG\Property(property="image", type="string", description="Платежный документ (при наличии оплаты)")
 */

class B2bAds extends \yii\db\ActiveRecord
{
    public $file;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'b2b_ads';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['company_id', 'chart_id', 'wallet_id', 'min_limit', 'max_limit', 'amount', 'start_amount', 'course', 'date','duration'], 'required'],
            [['company_id', 'chart_id', 'wallet_id', 'type', 'date', 'status', 'currency_id'], 'integer'],
            [['min_limit', 'amount','start_amount','course', 'max_limit'], 'number'],
        ];
    }

    public function getUser()
    {
        return $this->hasOne(User::class, ['id' => 'company_id']);
    }

    public function getCompany()
    {
        return $this->hasOne(Company::class, ['user_id' => 'company_id']);
    }

    public function getCurrency()
    {
        return $this->hasOne(Currency::class, ['id' => 'currency_id']);
    }

    public function getChart()
    {
        return $this->hasOne(Chart::class, ['id' => 'chart_id']);
    }

    public function getWallet()
    {
        return $this->hasOne(Wallet::class, ['id' => 'wallet_id']);
    }

    public function getPayments()
    {
        return $this->hasMany(B2bPayment::class, ['b2b_ads_id' => 'id']);
    }
    public function getStatusType()
    {
        return $this->hasOne(StatusType::class, ['status_id' => 'status']);
    }

    

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'company_id' => 'Company ID',
            'chart_id' => 'Chart ID',
            'currency_id' => 'Currency ID',
            'wallet_id' => 'Wallet ID',
            'type' => 'Type',
            'min_limit' => 'Min limit',
            'max_limit' => 'Max limit',
            'amount' => 'amount',
            'start_amount' => 'Start amount',
            'course' => 'Course',
            'date' => 'Date',
            'duration' => 'Duration',
            'status' => 'Status',
            'uuid' => 'uuid'
        ];
    }

}
