<?php

namespace app\modules\api\controllers;

use Yii;
use app\models\Charts;


class TerminalController extends BaseController
{
    public function actionHistory()
    {
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

        $chart_id = $this->json->chart_id;
        $to = $this->json->to;
        $from = $this->json->from;
        $timespan = $this->json->timespan;
        $multiplier = $this->json->multiplier;

        $chart = Charts::findOne($chart_id);

    		$curl = curl_init();
    		curl_setopt_array($curl, array(
    		  CURLOPT_URL => "https://api.binance.com/api/v3/klines?symbol=" . $chart->symbol . "&interval=" . $multiplier . $timespan,
    		  CURLOPT_RETURNTRANSFER => true,
    		  CURLOPT_FOLLOWLOCATION => true,
    		  CURLOPT_CUSTOMREQUEST => 'GET',
    		  CURLOPT_USERAGENT => 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'
    		));

    		$res = json_decode(curl_exec($curl));

        if(count($res) > 1) {
          array_pop($res);
          array_pop($res);
        }

    		curl_close($curl);

    		return $res;
    }
    public function actionTest()
    {
      $text = "";
      $charts = Charts::find()->where(["category_id" => 6])->all();
      foreach ($charts as $chart) {
        $text .= "\"" . $chart->symbol . "@trade\",";
      }

      return $text . count($charts);

    }
}
