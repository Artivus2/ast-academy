<?php

namespace app\models;

/**
 * Модель для Мероприятий
 *
 * @property int $id
 * @property string $title
 * @property string $description
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
            [['description'], 'string', 'max' => 255],
            
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
            'description' => 'Описание'
        ];
    }

  
    public function getOrganizators()
    {
        return $this->hasMany(Organizators::class, ['id' => 'organizators_id'])
            ->viaTable('events_history', ['events_id' => 'id']);
    }
    
    public static function find()
    {
        return new EventsQuery(get_called_class());
    }

  
}
