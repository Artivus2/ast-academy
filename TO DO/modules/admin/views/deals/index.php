<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\DealsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Deals';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="deals-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],

            'id',
            //'app_id',
            'user_id',
            'chart_id',
            'minutes',
            //'amount',
            'income',
            //'yield',
            //'wallet',
            //'spot',
            //'close_spot',
            //'type',
            'status',
            //'notified',
            //'date',
            //'order_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
