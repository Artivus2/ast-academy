<?php

namespace app\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\PaymentIncreases;

/**
 * PaymentIncreasesSearch represents the model behind the search form of `app\models\PaymentIncreases`.
 */
class PaymentIncreasesSearch extends PaymentIncreases
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'app_id', 'type', 'promocode_id', 'affiliate_invitation_id', 'affiliate_invitation_paid'], 'integer'],
            [['user_id', 'status', 'date', 'order_id'], 'safe'],
            [['amount', 'full_amount'], 'number'],
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
        $query = PaymentIncreases::find()->JoinWith("user");

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
            'type' => $this->type,
            'amount' => $this->amount,
            'promocode_id' => $this->promocode_id,
            'full_amount' => $this->full_amount,
            'affiliate_invitation_id' => $this->affiliate_invitation_id,
            'affiliate_invitation_paid' => $this->affiliate_invitation_paid,
            'date' => $this->date,
        ]);

        $query->andFilterWhere(['like', 'user_id', $this->user_id])
            ->andFilterWhere(['like', 'status', $this->status])
            ->andFilterWhere(['like', 'order_id', $this->order_id]);

        return $dataProvider;
    }
}
