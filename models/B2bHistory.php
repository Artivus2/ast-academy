<?php

namespace app\models;

use Yii;


/**
 * @SWG\Definition()
 *
 * @SWG\Property(property="b2b_ads_id", type="integer", description="ID ордера")
 */
class B2bHistory extends \yii\db\ActiveRecord
{
    public $image;

    public function behaviors()
    {
        return [
            'image' => [
                'class' => 'rico\yii2images\behaviors\ImageBehave',
            ]
        ];
    }
    
    /**
     * {@inheritdoc}
     */

    public static function tableName()
    {
        return 'b2b_history';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['b2b_ads_id', 'author_id','creator_id', 'start_date', 'end_date', 'price'], 'required'],
            [['b2b_ads_id', 'author_id', 'creator_id','payment_id', 'start_date', 'end_date', 'status'], 'integer'],
            [['image'], 'file', 'extensions' => 'png, jpg, pdf'],
            [['price'], 'number'],
        ];
    }
    public function getPaymentUser()
    {
        return $this->hasOne(PaymentUser::class, ['id' => 'payment_id']);
    }
    
    public function getAds()
    {
        return $this->hasOne(B2bAds::class, ['id' => 'b2b_ads_id']);
    }

    public function getAuthor()
    {
        return $this->hasOne(Company::class, ['id' => 'author_id']);
    }

    public function getStatusHistory()
    {
        return $this->hasOne(StatusType::class, ['status_id' => 'status']);
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'b2b_ads_id' => 'B2b Ads ID',
            'author_id' => 'Author ID',
            'creator_id' => 'Author ID',
            'payment_id' => 'Payment ID',
            'start_date' => 'Start Date',
            'end_date' => 'End Date',
            'price' => 'Price',
            'status' => 'Status',
            'image' => 'Документ',
        ];
    }

    public function upload(){
        $path = 'yii2images/payed/' . $this->image->baseName . '.' . $this->image->extension;
        $this->image->saveAs($path);
        $this->attachImage($path);
        @unlink($path);
    }
}
