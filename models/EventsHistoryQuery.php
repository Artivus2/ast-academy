<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[EventsHistory]].
 *
 * @see EventsHistory
 */
class EventsHistoryQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * {@inheritdoc}
     * @return EventsHistory[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return EventsHistory|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
