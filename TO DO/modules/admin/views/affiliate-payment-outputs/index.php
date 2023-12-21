<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\AffiliatePaymentOutputsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Affiliate Payment Outputs';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="affiliate-payment-outputs-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Affiliate Payment Outputs', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'app_id',
            'affiliate_user_id',
            'wallet_type_id',
            'wallet_data',
            //'amount',
            //'comment:ntext',
            //'status',
            //'promocode_id',
            //'date',
            //'order_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
