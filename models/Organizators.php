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
            [['email'], 'email', 'max' => 60],
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

    /**
     * Запрос к истории событий.
     *
     * @return \yii\db\ActiveQuery|BookAuthorQuery
     */
    public function getOrganizators()
    {
        return $this->hasMany(EventsHistory::class, ['organizators_id' => 'id']);
    }

   
}
