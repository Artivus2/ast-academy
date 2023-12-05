<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;

/**
 * EventsSearch represents the model behind the search form of `app\models\Events`.
 */
class EventsSearch extends Events
{
    public $orgsName;

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'date'], 'integer'],
            [['title', 'orgsName'], 'safe'],
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
        $query = Events::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $query->joinWith(['organizators' => function($query) { 
            $query->from(['organizators' => Organizators::tableName()]); 
        }]);

        $this->load($params);

        // if (!$this->validate()) {
        //     // uncomment the following line if you do not want to return any records when validation fails
        //     // $query->where('0=1');
        //     return $dataProvider;
        // }

        $dataProvider->setSort([
            'attributes' => [
                'id',
                'title',
                'date',
                'description',
                'Организаторы' => [
                    'asc' => ['fio' => SORT_ASC],
                    'desc' => ['fio' => SORT_DESC],
                    'label' => 'ФИО',
                    'default' => SORT_ASC
                ],
            ]
        ]);

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'title' => $this->title,
            'description' => $this->description,
            
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
        ->andFilterWhere(['like', 'description', $this->description])
        ->andFilterWhere(['like', 'organizators.fio', $this->orgsName])
        ;

        return $dataProvider;
    }
}
