<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "affiliate_offers".
 *
 * @property int $id
 * @property string $name
 * @property string $about
 */
class AffiliateOffers extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'affiliate_offers';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'about'], 'required'],
            [['name', 'about'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Название',
            'about' => 'Описание',
        ];
    }
}
