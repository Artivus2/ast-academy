<?php

namespace app\modules\api\controllers;

use Yii;
use app\models\Promocodes;
use app\models\PromocodesLog;

/**
 * Default controller for the `api` module
 */
class PromocodeController extends BaseController
{
    public function actionCheck()
    {
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

        if(!$this->user) return $this->return_error('Не пройдена авторизация.');

        $promocode_name = $this->json->promocode_name;
        if(!$promocode_name) return $this->return_error('Введите промо-код');

        $promocode = Promocodes::find()->select(["id", "creator_id", "payment_bonus"])->where(["name" => $promocode_name])->one();
        if(!$promocode) return $this->return_error('Промо-код не действителен');
        if($promocode->creator_id == $this->user->id) return $this->return_error('Нельзя использовать свои промокоды');

        return $this->return_success('Промо-код может быть использован', $promocode->toArray());
    }

    public function actionHistory()
    {
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

        $active_page = $this->json->active_page;
        $offset = $this->tableOffset($active_page);
        $date_to = $this->json->date_to;
        $date_from = $this->json->date_from;

        //if(!$this->user) return $this->return_error('Не пройдена авторизация.');

        $where = ["and", ["user_id" => $this->user->id]];
        $where = ["and", ["user_id" => 67]];


        if($date_to) {
            //array_push($where, [">=", "date", strtotime($date_from)]);
        }

        if($date_from) {
            //array_push($where, ["<=", "date", strtotime($date_to)]);
        }

        $history_query = PromocodesLog::find()->JoinWith("promocode")->where($where)->limit($this->cabinet_table_limit)->offset($offset)->orderBy("promocodes_log.id DESC")->all();
        $history = array();

        foreach ($history_query as $item) {
            array_push($history, [
                "name" => $item->promocode->name,
                "payment_bonus" => $item->promocode->payment_bonus,
                "date" => strtotime($item->promocode->date)
            ]);
        }

        return [
            "count" => PromocodesLog::find()->where($where)->count(),
            "list" => $history
        ];
    }

}
