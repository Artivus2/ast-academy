<?php

namespace app\modules\api\controllers;

use Yii;
use yii\web\Controller;
use app\models\Users;

class BaseController extends Controller
{
    public $json = [];
    public $user = null;
    public $cabinet_table_limit = 10;

    public function beforeAction($action)
    {
        $this->enableCsrfValidation = false;

        Yii::$app->response->headers->set('Access-Control-Allow-Origin', '*');

        $this->json = json_decode(file_get_contents('php://input'));

        if (isset($this->json->token)) {
          $this->user = Users::findOne($this->json->token);
        }

        return parent::beforeAction($action);
    }

    protected function tableOffset($active_page) {
        return $active_page > 1 ? $active_page * $this->cabinet_table_limit - $this->cabinet_table_limit : 0;
    }

    protected function return_success($description = '', $addons = []) {
		$out = array("success" => true);
		$out["title"] = 'Успех';
		$out["description"] = $description;
		$out = array_merge($out, $addons);

		return $out;
	}

    protected function return_error($description = '', $addons = [])
    {
        if (is_array($description)) {
            $out = $description;
        } else {
            $out = array("error" => true);
            $out["title"] = 'Ошибка';
            $out["description"] = $description;
            $out = array_merge($out, $addons);
        }

        return $out;
    }

}
