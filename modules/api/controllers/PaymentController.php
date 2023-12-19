<?php

namespace app\modules\api\controllers;

use Yii;
use app\models\PaymentTypes;
use app\models\Apps;

/**
 * Default controller for the `api` module
 */
class PaymentController extends BaseController
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionTypes()
    {
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

        return PaymentTypes::find()->all();
    }
}
