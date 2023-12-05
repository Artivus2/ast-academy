<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[Organizators]].
 *
 * @see Organizators
 */
class OrganizatorsQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * {@inheritdoc}
     * @return Organizators[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return Organizators|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
