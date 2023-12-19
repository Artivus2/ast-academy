<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "deals".
 *
 * @property int $id
 * @property int $app_id
 * @property int $user_id
 * @property int $chart_id
 * @property int $minutes
 * @property float $amount
 * @property float $income
 * @property int $yield
 * @property string $wallet
 * @property float $spot
 * @property float|null $close_spot
 * @property string $type
 * @property string $status
 * @property int|null $notified
 * @property string|null $date
 * @property string $order_id
 */
class Deals extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'deals';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['app_id', 'user_id', 'chart_id', 'minutes', 'amount', 'income', 'yield', 'wallet', 'spot', 'type', 'status', 'order_id'], 'required'],
            [['app_id', 'user_id', 'chart_id', 'minutes', 'yield', 'notified'], 'integer'],
            [['amount', 'income', 'spot', 'close_spot'], 'number'],
            [['date'], 'safe'],
            [['wallet', 'type', 'status', 'order_id'], 'string', 'max' => 255],
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
            'user_id' => 'Пользователь',
            'chart_id' => 'Актив',
            'minutes' => 'Кол. минут',
            'amount' => 'Сумма',
            'income' => 'Доход',
            'yield' => 'Процент',
            'wallet' => 'Тип счета',
            'spot' => 'Цена актива',
            'close_spot' => 'Цена актива при закрытие',
            'type' => 'Тип',
            'status' => 'Статус',
            'notified' => 'Уведомление',
            'date' => 'Дата',
            'order_id' => 'Заказ',
        ];
    }
}
