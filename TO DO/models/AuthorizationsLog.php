<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "authorizations_log".
 *
 * @property int $id
 * @property int $app_id
 * @property int $user_id
 * @property string $user_ip
 * @property string $log_type
 * @property string $location_action
 * @property string $date
 */
class AuthorizationsLog extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'authorizations_log';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'user_ip', 'log_type', 'location_action'], 'required'],
            [['app_id', 'user_id'], 'integer'],
            [['date'], 'safe'],
            [['user_ip', 'log_type', 'location_action'], 'string', 'max' => 255],
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
            'user_ip' => 'IP адрес',
            'log_type' => 'Тип',
            'location_action' => 'Событие',
            'date' => 'Дата',
        ];
    }
}
