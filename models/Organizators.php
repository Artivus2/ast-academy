<?php

namespace app\models;

/**
 * Модель для Организаторов
 *
 * @property int $id
 * @property string $fio
 * @property string $email
 * @property string $phone
 *
 * @property Events_History[] $Events_History
 */
class Organizators extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'organizators';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['fio', 'email'], 'required'],
            [['fio'], 'string', 'max' => 255],
            [['email'], 'email'],
            [['phone'], 'string', 'max' => 10],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'fio' => 'ФИО',
            'email' => 'E-MAIL',
            'phone' => 'телефон',
        ];
    }

    public function getEvents()
    {
        return $this->hasMany(Events::class, ['id' => 'events_id'])
            ->viaTable('events_history', ['organizators_id' => 'id']);;
    }

    public static function find()
    {
        return new OrganizatorsQuery(get_called_class());
    }

   
}
