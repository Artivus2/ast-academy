<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\ChartsCategoriesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Charts Categories';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="charts-categories-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Charts Categories', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],

            'id',
            'name',
            'priority',
            'hidden',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
