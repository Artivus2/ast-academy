<?php

namespace app\modules\api\controllers;

use Yii;
use app\models\Charts;
use app\models\Apps;

/**
 * Default controller for the `api` module
 */
class DefaultController extends BaseController
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionInvestments()
    {
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

        return Charts::find()->select(["charts.name", "charts.yield"])->JoinWith("category")->where(["charts.hidden" => 0, "charts_categories.hidden" => 0])->all();
    }

    public function actionInfo() {

        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

        $apps = Apps::findOne(2);

        return array(
            'name' => $apps->name,
            'domain' => $apps->domain,
            'mail' => $apps->mail_name,
            'support_chat' => $apps->support_chat
        );
    }
}
