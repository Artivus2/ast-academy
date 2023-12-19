<?php

use Yii;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\PaymentOutputsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Запросы на вывод средств';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="payment-outputs-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Создать запрос на вывод средств', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],

            'id',
            [
                'attribute'=> 'user_id',
                'content'=>function($data){
                    return isset($data->user) ? Html::a($data->user->email, ['/admin/users/view', 'id' => $data->user->id]) : "-";
                }
            ],
             [
                'attribute'=> 'type',
                'filter' => Yii::$app->params["payment_outputs_type"]
            ],
            //'card_number',
            //'card_holder',
            'amount',
            //'promocode_id',
            [
                'attribute'=> 'status',
                'filter' => Yii::$app->params["payment_status"],
                'content'=>function($data) {
                    return Yii::$app->params["payment_status"][$data->status];
                }
            ],
            'date',
            //'order_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
