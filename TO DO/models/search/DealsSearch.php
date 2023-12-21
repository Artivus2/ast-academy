<?php

namespace app\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Deals;

/**
 * DealsSearch represents the model behind the search form of `app\models\Deals`.
 */
class DealsSearch extends Deals
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'app_id', 'user_id', 'chart_id', 'minutes', 'yield', 'notified'], 'integer'],
            [['amount', 'income', 'spot', 'close_spot'], 'number'],
            [['wallet', 'type', 'status', 'date', 'order_id'], 'safe'],
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
        $query = Deals::find();

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
            'user_id' => $this->user_id,
            'chart_id' => $this->chart_id,
            'minutes' => $this->minutes,
            'amount' => $this->amount,
            'income' => $this->income,
            'yield' => $this->yield,
            'spot' => $this->spot,
            'close_spot' => $this->close_spot,
            'notified' => $this->notified,
            'date' => $this->date,
        ]);

        $query->andFilterWhere(['like', 'wallet', $this->wallet])
            ->andFilterWhere(['like', 'type', $this->type])
            ->andFilterWhere(['like', 'status', $this->status])
            ->andFilterWhere(['like', 'order_id', $this->order_id]);

        return $dataProvider;
    }
}
