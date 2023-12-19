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
 * @property string|null $created_at
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

    private static $users = [
        '100' => [
            'id' => '100',
            'username' => 'admin',
            'password' => 'admin',
            'authKey' => 'test100key',
            'accessToken' => '100-token',
        ],
        '101' => [
            'id' => '101',
            'username' => 'demo',
            'password' => 'demo',
            'authKey' => 'test101key',
            'accessToken' => '101-token',
        ],
        '102' => [
            'id' => '102',
            'username' => 'user',
            'password' => 'user',
            'authKey' => 'test102key',
            'accessToken' => '102-token',
        ],
    ];

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
        return 'user';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['uid', 'app_id', 'email', 'password'], 'required'],
            [['app_id', 'verify_status', 'is_admin', 'affiliate_invitation_id', 'deleted', 'banned'], 'integer'],
            [['last_visit_time', 'created_at', 'confirm_email', 'confirm_reset_expire', 'confirm_delete_expire', 'delete_date'], 'safe'],
            [['uid', 'email', 'token', 'first_name', 'last_name', 'country', 'city', 'password'], 'string', 'max' => 255],
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
            'id' => 'ID', //+
            'uid' => 'UID', //add
            'app_id' => 'App ID', //add
            'email' => 'Почта', //+
            'token' => 'Токен', //+
            'verify_status' => 'Верификация', //change
            'telegram' => 'Телеграм', //+
            'first_name' => 'Имя', //change
            'last_name' => 'Фамилия', //change
            'country' => 'Страна', //add
            'city' => 'Город', //add
            'password' => 'Пароль', //+
            'is_admin' => 'Is Admin', //add
            'affiliate_invitation_id' => 'Приглашение партнера', //add
            'deleted' => 'Удален', //add
            'banned' => 'Заблокирован', //add
            'last_visit_time' => 'Время последнего везита', //add
            'created_at' => 'Дата регистрации', //change
            'confirm_email' => 'Confirm Email', //add
            'confirm_email_token' => 'Confirm Email Token', //add
            'confirm_reset_expire' => 'Confirm Reset Expire', //add
            'confirm_reset_token' => 'Confirm Reset Token', //add
            'confirm_delete_expire' => 'Confirm Delete Expire', //add
            'confirm_delete_token' => 'Confirm Delete Token', //add
            'delete_date' => 'Дата удаления', //add
            'comment' => 'Комментарий', //add
        ];

        // 'id' => 'ID',
        // 'phone' => 'Номер телефона',
        // 'email' => 'Электронная почта',
        // 'password' => 'Пароль',
        // 'image' => 'Аватар',
        // 'login' => 'Логин',
        // 'telegram' => 'Телеграм',
        // 'chart_id' => 'Криптовалюта',
        // 'currency_id' => 'Валюта',
        // 'verify_status' => 'Верификация',
        // 'token' => 'Token',
        // 'created_at' => 'Дата создания',
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
        $path = '/yii2images/' . $this->id. '.' . $this->image->extension;
        $this->image->saveAs($path);
        $this->attachImage($path, true);
        @unlink($path);
    }

    public static function findByUsername($username)
    {
        foreach (self::$users as $user) {
            if (strcasecmp($user['username'], (string)$username) === 0) {
                return new static($user);
            }
        }

        return null;
    }
}
