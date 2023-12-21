<?php

use Yii;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\PaymentIncreasesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'История пополнения';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="payment-increases-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Создать новое пополнение', ['create'], ['class' => 'btn btn-success']) ?>
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
                'content'=>function($data) {
                    return $data->type == 0 ? "Банковская карта" : "Криптавалюта";
                }
            ],
            'amount',
            //'promocode_id',
            //'full_amount',
            [
                'attribute'=> 'status',
                'filter' => Yii::$app->params["payment_status"],
                'content'=>function($data) {
                    return Yii::$app->params["payment_status"][$data->status];
                }
            ],
            //'affiliate_invitation_id',
            //'affiliate_invitation_paid',
            'date',
            //'order_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
