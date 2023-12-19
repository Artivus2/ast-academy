<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\UsersSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Пользователи';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="users-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            'id',
            'uid',
            //'app_id',
            'email:email',
            //'token',
            [
                'attribute'=> 'verify_status',
                'filter' => [ "0"=> "Нет", "1"=>"Да"],
                'content'=>function($data) {
                    return $data->verify_status ? '<span class="glyphicon glyphicon-ok"></span>' : '<span class="glyphicon glyphicon-remove"></span>';
                }
            ],
            //'telegram',
            'first_name',
            'last_name',
            'country',
            // [
            //     'attribute'=>'dollars',
            //     'label' => 'Счет',
            //     'content'=>function($data){
            //         return $data->wallet->dollars;
            //     }
            // ],
            // [
            //     'attribute'=>'virtual_dollars',
            //     'label' => 'Демо-счет',
            //     'content'=>function($data){
            //         return $data->wallet->virtual_dollars;
            //     }
            // ],
            //'city',
            //'password',
            //'is_admin',
            //'affiliate_invitation_id',
            //'deleted',
            //'banned',
            //'last_visit_time',
            [
                'attribute'=>'created_at',
                'filter' => \janisto\timepicker\TimePicker::widget([
                    'model'=>$searchModel,
                    'attribute'  => 'created_at',
                    'mode' => 'date',
                ]),
            ],
            //'confirm_email:email',
            //'confirm_email_token:email',
            //'confirm_reset_expire',
            //'confirm_reset_token',
            //'confirm_delete_expire',
            //'confirm_delete_token',
            //'delete_date',
            
			[
				'class' => 'yii\grid\ActionColumn',
				'template' => '{view} {password} {access} {wallet} {update} {delete} ',
				'buttons' => [
					'access' => function ($url,$model) {
						return Html::a(
						'<span class="glyphicon glyphicon-cog"></span>', 
						['/rbac/assignment/view', 'id' => $model->id]);
					},
                    'wallet' => function ($url,$model) {
                        return Html::a(
                            '<span class="glyphicon glyphicon-piggy-bank"></span>',
                            $url);
                    },
					'password' => function ($url,$model,$key) {
						return Html::a(
						'<span class="glyphicon glyphicon-lock"></span>', 
						$url);
					},
				],
			],
        ],
    ]); ?>


</div>
