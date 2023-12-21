<?php

namespace app\models;

use Yii;

/**
 * @SWG\Definition(required={"id", "inn", "ogrn", "name", "address"})
 *
 * @SWG\Property(property="id", type="integer")
 * @SWG\Property(property="inn", type="string")
 * @SWG\Property(property="ogrn", type="string")
 * @SWG\Property(property="name", type="string")
 * @SWG\Property(property="address", type="string")
 */
class Company extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'company';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'inn', 'ogrn', 'name', 'address'], 'required'],
            [['user_id'], 'integer'],
            [['inn'], 'string', 'min' => 10],
            [['ogrn'], 'string', 'min' => 13],
            [['name', 'address'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'inn' => 'Inn',
            'ogrn' => 'Ogrn',
            'name' => 'Name',
            'address' => 'Address',
        ];
    }
}
