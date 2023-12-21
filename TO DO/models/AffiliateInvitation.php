<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "affiliate_invitation".
 *
 * @property int $id
 * @property int $app_id
 * @property int $affiliate_user_id
 * @property string $code
 * @property int $offer_id
 * @property string $date
 * @property int $percent
 */
class AffiliateInvitation extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'affiliate_invitation';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['affiliate_user_id', 'code', 'offer_id'], 'required'],
            [['app_id', 'affiliate_user_id', 'offer_id', 'percent'], 'integer'],
            [['date'], 'safe'],
            [['code'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'app_id' => 'App ID',
            'affiliate_user_id' => 'Affiliate User ID',
            'code' => 'Code',
            'offer_id' => 'Offer ID',
            'date' => 'Date',
            'percent' => 'Percent',
        ];
    }
}
