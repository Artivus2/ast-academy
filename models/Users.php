<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "users".
 *
 * @property int $id
 * @property string $uid
 * @property int $app_id
 * @property string $email
 * @property string|null $token
 * @property int $verify
 * @property string|null $telegram
 * @property string|null $name
 * @property string|null $surname
 * @property string|null $country
 * @property string|null $city
 * @property string $password
 * @property int $is_admin
 * @property int $affiliate_invitation_id
 * @property int $deleted
 * @property int $banned
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
class Users extends \yii\db\ActiveRecord implements \yii\web\IdentityInterface
{

    public $image;

    public function behaviors()
    {
        return [
            'image' => [
                'class' => 'rico\yii2images\behaviors\ImageBehave',
            ]
        ];
    }

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'users';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['uid', 'app_id', 'email', 'password', 'affiliate_invitation_id'], 'required'],
            [['app_id', 'verify', 'is_admin', 'affiliate_invitation_id', 'deleted', 'banned'], 'integer'],
            [['last_visit_time', 'create_date', 'confirm_email', 'confirm_reset_expire', 'confirm_delete_expire', 'delete_date'], 'safe'],
            [['uid', 'email', 'token', 'name', 'surname', 'country', 'city', 'password'], 'string', 'max' => 255],
            [['telegram'], 'string', 'max' => 100],
            ['comment', 'string'],
            [['confirm_email_token', 'confirm_reset_token', 'confirm_delete_token'], 'string', 'max' => 36],
        ];
    }

    public function getWallet()
    {
        return $this->hasOne(Wallet::className(), ['user_id' => 'id']);
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
            'comment' => 'Комментарий',
        ];
    }
    
    
	public static function findIdentity($id)
    {
        return static::findOne($id);
    }

    public static function findIdentityByAccessToken($token, $type = null)
    {
		return static::findOne(['token' => $token]);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getAuthKey()
    {
        return $this->token;
    }

    public function validateAuthKey($authKey)
    {
        return $this->token === $authKey;
    }
	
    public function validatePassword($password)
    {
		if(!$this->password) return false;
        return Yii::$app->getSecurity()->validatePassword($password, $this->password);
    }

    public function upload(){
        $path = '/var/www/srv.optionhold.com/yii2images/' . $this->id. '.' . $this->image->extension;
        $this->image->saveAs($path);
        $this->attachImage($path, true);
        @unlink($path);
    }
}
