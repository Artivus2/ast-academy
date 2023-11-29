<?php

namespace app\models;

/**
 * Модель для Мероприятий
 *
 * @property int $id
 * @property string $title
 * @property string $date
 *
 * @property Events_History[] $Events_History
 */
class Events extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'events';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title'], 'required'],
            [['date'], 'safe'],
            
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Название',
            'date' => 'Дата',
        ];
    }

    /**
     * Запрос к истории событий.
     *
     * @return \yii\db\ActiveQuery|BookAuthorQuery
     */
    public function getEvents()
    {
        return $this->hasMany(EventsHistory::class, ['events_id' => 'id']);
    }

  
}
