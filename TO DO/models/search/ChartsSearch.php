<?php

namespace app\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Charts;

/**
 * ChartsSearch represents the model behind the search form of `app\models\Charts`.
 */
class ChartsSearch extends Charts
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'app_id', 'yield', 'category_id', 'priority', 'hidden'], 'integer'],
            [['exchange', 'symbol', 'name'], 'safe'],
            [['course'], 'number'],
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
        $query = Charts::find();

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
            'yield' => $this->yield,
            'course' => $this->course,
            'category_id' => $this->category_id,
            'priority' => $this->priority,
            'hidden' => $this->hidden,
        ]);

        $query->andFilterWhere(['like', 'exchange', $this->exchange])
            ->andFilterWhere(['like', 'symbol', $this->symbol])
            ->andFilterWhere(['like', 'name', $this->name]);

        return $dataProvider;
    }
}
