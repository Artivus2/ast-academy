<?php

namespace app\models;

/**
 * Модель для истории мероприятий
 *
 * @property int|null $events_id
 * @property int|null $organizators_id
 *
 * @property Events $events
 * @property Organizators $organizators
 */
class EventsHistory extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'events_history';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['events_id', 'organizators_id'], 'integer'],
            [['events_id'], 'exist', 'skipOnError' => true, 'targetClass' => Author::class, 'targetAttribute' => ['events_id' => 'id']],
            [['organizators_id'], 'exist', 'skipOnError' => true, 'targetClass' => Book::class, 'targetAttribute' => ['organizators_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'events_id' => 'ИД мероприятия',
            'author_id' => 'ИД Организатора',
        ];
    }

    /**
     * 
     *
     * @return \yii\db\ActiveQuery|AuthorQuery
     */
    public function getEvents()
    {
        return $this->hasOne(Events::class, ['id' => 'events_id']);
    }

    /**
     * 
     *
     * @return \yii\db\ActiveQuery|BookQuery
     */
    public function getOrganizators()
    {
        return $this->hasOne(Organizators::class, ['id' => 'organizators_id']);
    }

    /**
     * {@inheritdoc}
     * @return BookAuthorQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new EventsHistoryQuery(get_called_class());
    }
}
