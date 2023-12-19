<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "affiliate_users".
 *
 * @property int $id
 * @property string $uid
 * @property int $app_id
 * @property string $email
 * @property string|null $token
 * @property string|null $telegram
 * @property float $dollars
 * @property int|null $wallet_type_id
 * @property string|null $wallet_data
 * @property string|null $name
 * @property string|null $surname
 * @property string|null $country
 * @property string|null $city
 * @property string $password
 * @property int|null $is_admin
 * @property int $banned
 * @property int $deleted
 * @property int $affiliate_invitation_id
 * @property string|null $last_visit_time
 * @property string|null $create_date
 * @property string|null $confirm_email
 * @property string|null $confirm_email_token
 * @property string|null $confirm_reset_expire
 * @property string|null $confirm_reset_token
 * @property string|null $confirm_delete_expire
 * @property string|null $confirm_delete_token
 * @property string|null $delete_date
 */
class AffiliateUsers extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'affiliate_users';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['uid', 'email', 'password', 'affiliate_invitation_id'], 'required'],
            [['app_id', 'wallet_type_id', 'is_admin', 'banned', 'deleted', 'affiliate_invitation_id'], 'integer'],
            [['dollars'], 'number'],
            [['last_visit_time', 'create_date', 'confirm_email', 'confirm_reset_expire', 'confirm_delete_expire', 'delete_date'], 'safe'],
            [['uid', 'email', 'token', 'name', 'surname', 'country', 'city', 'password'], 'string', 'max' => 255],
            [['telegram'], 'string', 'max' => 100],
            [['wallet_data'], 'string', 'max' => 11],
            ['comment', 'string'],
            [['confirm_email_token', 'confirm_reset_token', 'confirm_delete_token'], 'string', 'max' => 36],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'uid' => 'UID',
            'app_id' => 'App ID',
            'email' => 'Почта',
            'token' => 'Токен',
            'verify' => 'Верификация',
            'telegram' => 'Телеграм',
            'name' => 'Имя',
            'surname' => 'Фамилия',
            'country' => 'Страна',
            'city' => 'Город',
            'password' => 'Пароль',
            'is_admin' => 'Is Admin',
            'affiliate_invitation_id' => 'Приглашение партнера',
            'deleted' => 'Удален',
            'banned' => 'Заблокирован',
            'last_visit_time' => 'Время последнего везита',
            'create_date' => 'Дата регистрации',
            'confirm_email' => 'Confirm Email',
            'confirm_email_token' => 'Confirm Email Token',
            'confirm_reset_expire' => 'Confirm Reset Expire',
            'confirm_reset_token' => 'Confirm Reset Token',
            'confirm_delete_expire' => 'Confirm Delete Expire',
            'confirm_delete_token' => 'Confirm Delete Token',
            'delete_date' => 'Дата удаления',
            'dollars' => 'Баланс',
            'wallet_type_id' => 'Тип для вывода',
            'wallet_data' => 'Счет для вывода',
            'comment' => 'Комментарий',
        ];
    }
}
