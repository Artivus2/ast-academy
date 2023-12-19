<?php

namespace app\modules\api\controllers;

use Yii;

/**
 * Default controller for the `api` module
 */
class AffiliateController extends BaseController
{
    public function actionCheck()
    {
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

        if(!$this->user) return $this->return_error('Не пройдена авторизация.');

        return [];
    }



}
