<?php

namespace app\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Apps;

/**
 * AppsSearch represents the model behind the search form of `app\models\Apps`.
 */
class AppsSearch extends Apps
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'banned', 'max_virtual_dollars', 'min_increase_amount', 'min_withdrawal_amount', 'min_order_amount', 'min_affiliate_order_amount', 'support_chat'], 'integer'],
            [['name', 'domain', 'mail_name', 'mail_host', 'mail_username', 'mail_password', 'merchant_id', 'merchant_secret_word', 'merchant_secret_word_2'], 'safe'],
            [['exchange'], 'number'],
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
        $query = Apps::find();

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
            'banned' => $this->banned,
            'max_virtual_dollars' => $this->max_virtual_dollars,
            'min_increase_amount' => $this->min_increase_amount,
            'min_withdrawal_amount' => $this->min_withdrawal_amount,
            'min_order_amount' => $this->min_order_amount,
            'min_affiliate_order_amount' => $this->min_affiliate_order_amount,
            'support_chat' => $this->support_chat,
            'exchange' => $this->exchange,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'domain', $this->domain])
            ->andFilterWhere(['like', 'mail_name', $this->mail_name])
            ->andFilterWhere(['like', 'mail_host', $this->mail_host])
            ->andFilterWhere(['like', 'mail_username', $this->mail_username])
            ->andFilterWhere(['like', 'mail_password', $this->mail_password])
            ->andFilterWhere(['like', 'merchant_id', $this->merchant_id])
            ->andFilterWhere(['like', 'merchant_secret_word', $this->merchant_secret_word])
            ->andFilterWhere(['like', 'merchant_secret_word_2', $this->merchant_secret_word_2]);

        return $dataProvider;
    }
}
