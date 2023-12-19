<?php

namespace app\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\AffiliateUsers;

/**
 * AffiliateUsersSearch represents the model behind the search form of `app\models\AffiliateUsers`.
 */
class AffiliateUsersSearch extends AffiliateUsers
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'app_id', 'wallet_type_id', 'is_admin', 'banned', 'deleted', 'affiliate_invitation_id'], 'integer'],
            [['uid', 'email', 'token', 'telegram', 'wallet_data', 'name', 'surname', 'country', 'city', 'password', 'last_visit_time', 'create_date', 'confirm_email', 'confirm_email_token', 'confirm_reset_expire', 'confirm_reset_token', 'confirm_delete_expire', 'confirm_delete_token', 'delete_date'], 'safe'],
            [['dollars'], 'number'],
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
        $query = AffiliateUsers::find();

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
            'dollars' => $this->dollars,
            'wallet_type_id' => $this->wallet_type_id,
            'is_admin' => $this->is_admin,
            'banned' => $this->banned,
            'deleted' => $this->deleted,
            'affiliate_invitation_id' => $this->affiliate_invitation_id,
            'last_visit_time' => $this->last_visit_time,
            'create_date' => $this->create_date,
            'confirm_email' => $this->confirm_email,
            'confirm_reset_expire' => $this->confirm_reset_expire,
            'confirm_delete_expire' => $this->confirm_delete_expire,
            'delete_date' => $this->delete_date,
        ]);

        $query->andFilterWhere(['like', 'uid', $this->uid])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'token', $this->token])
            ->andFilterWhere(['like', 'telegram', $this->telegram])
            ->andFilterWhere(['like', 'wallet_data', $this->wallet_data])
            ->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'surname', $this->surname])
            ->andFilterWhere(['like', 'country', $this->country])
            ->andFilterWhere(['like', 'city', $this->city])
            ->andFilterWhere(['like', 'password', $this->password])
            ->andFilterWhere(['like', 'confirm_email_token', $this->confirm_email_token])
            ->andFilterWhere(['like', 'confirm_reset_token', $this->confirm_reset_token])
            ->andFilterWhere(['like', 'confirm_delete_token', $this->confirm_delete_token]);

        return $dataProvider;
    }
}
