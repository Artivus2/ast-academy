<?php

namespace app\modules\api\controllers;

use Yii;
use app\models\Users;

/**
 * Default controller for the `api` module
 */
class AuthController extends BaseController
{
    public function actionCheck()
    {
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

        if(!$this->user) return $this->return_error('Не пройдена авторизация.');

        return [];
    }

    protected function generateUID() {
        $newId = rand(100000, 999999);

        while (true) {
            $resultCheck = Users::findOne(["uid" => $newId]);

            if($resultCheck) {
                $newId = rand(100000, 999999);
            } else {
                break;
            }
        }

        return $newId;
    }

}
