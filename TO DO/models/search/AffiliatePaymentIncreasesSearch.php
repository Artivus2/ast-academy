<?php

namespace app\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\AffiliatePaymentIncreases;

/**
 * AffiliatePaymentIncreasesSearch represents the model behind the search form of `app\models\AffiliatePaymentIncreases`.
 */
class AffiliatePaymentIncreasesSearch extends AffiliatePaymentIncreases
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'app_id', 'affiliate_user_id', 'trader_user_id', 'offer_id'], 'integer'],
            [['amount'], 'number'],
            [['date', 'order_id'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = AffiliatePaymentIncreases::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'app_id' => $this->app_id,
            'affiliate_user_id' => $this->affiliate_user_id,
            'trader_user_id' => $this->trader_user_id,
            'offer_id' => $this->offer_id,
            'amount' => $this->amount,
            'date' => $this->date,
        ]);

        $query->andFilterWhere(['like', 'order_id', $this->order_id]);

        return $dataProvider;
    }
}
