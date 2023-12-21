<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\UsersSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Список ордеров B2B';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="b2b-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'tableOptions' => [
            
            'class'=>'table table-striped'
            ],
        'columns' => [
            'id',
            'uuid',
            [
                'label' => 'Компания',
                'attribute' => 'company',
                'value' => function($data){return $data->company_id.' ('.$data->company->name??null . ')';} 
            ],
            [
                'attribute' => 'chart_id',
                'value' => function($data){return $data->chart->symbol??null;} 
               ],
               [
                'attribute' => 'currency_id',
                'value' => function($data){return $data->currency->name??null;} 
               ],
            'start_amount',
            'amount',
            [   'attribute'=>'duration',
                'content'=>function($data) {
                    return $data->duration == 900 ? '<span>3 дня</span>' : '<span>3 дня</span>';
                }
            ],
            [   'attribute'=>'type',
                'content'=>function($data) {
                    return $data->type == 1 ? '<span>Покупка</span>' : '<span>Продажа</span>';
                }
            ],

            [
                'attribute'=>'date',
                'content'=>function($data) {
                    return date("Y-m-d H:i:s", $data->date);
                }
                
            ],
            [
                'attribute' => 'status',
                'value' => function($data){return $data->statusType->title??null;} 
               ],
            
			[
				'class' => 'yii\grid\ActionColumn',
				'template' => '{view} {update} {delete}',
                'header' => 'Действия',
                'contentOptions' => ['style' => 'display: flex;'],
				'buttons' => [
					'view' => function ($url,$model) {
						return Html::a(
						'<span class="view-icon"></span>', 
						['/admin/b2b/view', 'id' => $model->id]);
					},
                    'update' => function ($url,$model) {
                        return Html::a(
                            '<span class="edit-icon"></span>', 
                            ['/admin/b2b/update', 'id' => $model->id]);
                    }
                   
                    
					
				],
			],
        ],
    ]); ?>


</div>
