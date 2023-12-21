<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\grid\GridView;
use yii\grid\ActionColumn;
use yii\grid\DataColumn;


/* @var $this yii\web\View */
/* @var $model app\models\Users */

$this->title = 'Ордер : ' . $model->uuid;
$this->params['breadcrumbs'][] = ['label' => 'B2B Обмен', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->uuid, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Изменить';
?>
<div class="b2b-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model
        
    ]) ?>

<h2>История ордеров для ордера: <?= $model->uuid ?></h2>
<?php
   echo GridView::widget([
       'dataProvider' => $history,
       'columns' => [
           
           [
            'label' => 'ID предложения',
            'attribute' => 'p2p_ads_id',
            'value' => function($data){return $data->id;} 
           ],
           [
            'label' => 'Криптовалюта',
            'attribute' => 'symbol',
            'value' => function($data){return $data->ads->chart->symbol;}
            ],
            [
            'label' => 'Компания',
            'attribute' => 'author_id',
            'value' => function($data){return $data->author_id.' ('.$data->author->name.')' ?? null;}
            ],
            [
            'label' => 'Обьем ордера',
            'attribute' => 'price',
            'value' => function($data){return $data->price;}
           ],
           [
            'label' => 'Статус',
            'attribute' => 'status',
            'value' => function($data){return $data->status;}
           ],
           
       
           
            [
            'label' => 'Начало срока',
            'attribute' => 'status',
            'value' => function($data){return date("Y-m-d H:i:s", $data->start_date);}
           ],
           [
            'label' => 'Окончание срока',
            'attribute' => 'status',
            'value' => function($data){return date("Y-m-d H:i:s", $data->end_date);}
           ],
           [
            'class' => 'yii\grid\ActionColumn',
            'header' => 'Действия',
            'template' => '{update} {delete}',
            'buttons' => [
                // 'view' => function ($url,$history) {
                //     return Html::a(
                //     '<span class="glyphicon glyphicon-cog">view</span>', 
                //     ['/admin/p2p/viewhistory', 'id' => $history->id]);
                // },
                'update' => function ($url,$history) {
                    return Html::a(
                    '<span class="glyphicon glyphicon-cog">Изменить</span>', 
                    ['/admin/p2p/updatehistory', 'id' => $history->id]);
                },
                'delete' => function ($url,$history) {
                    return Html::a(
                    '<span class="glyphicon glyphicon-cog">Удалить</span>', 
                    ['/admin/p2p/deletehistory', 'id' => $history->id]);
                },
                
            ],
        ],
       ]
   ])
?>

</div>
