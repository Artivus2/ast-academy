<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\grid\GridView;
use yii\grid\ActionColumn;
use yii\grid\DataColumn;

$this->title = 'Баланс финансового кошелька: ' . $model->email;
$this->params['breadcrumbs'][] = ['label' => 'Пользователи', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->email, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Баланс';
?>
<div class="users-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?php $form = ActiveForm::begin(); ?>
    
<?php
   echo GridView::widget([
       'dataProvider' => $wallet,
       'columns' => [
           
           [
            'label' => 'Тип баланса',
            'attribute' => 'title',
            'value' => function($data){return $data->walletType->title??null;} 
           ],
           [
            'label' => 'Криптовалюта',
            'attribute' => 'symbol',
            'value' => function($data){return $data->chart->symbol;}
            ],
           [
            'label' => 'Баланс',
            'attribute' => 'balance',
            'value' => function($data){return $data->balance;}
           ],
           [
            'class' => 'yii\grid\ActionColumn',
            'template' => '{view} {update} {delete}',
            'buttons' => [
                'view' => function ($url,$wallet) {
                    return Html::a(
                    '<span class="glyphicon glyphicon-cog">view</span>', 
                    ['/admin/users/viewbalance', 'id' => $wallet->id]);
                },
                'update' => function ($url,$wallet) {
                    return Html::a(
                    '<span class="glyphicon glyphicon-cog">edit</span>', 
                    ['/admin/users/editbalance', 'id' => $wallet->id]);
                },
                'delete' => function ($url,$wallet) {
                    return Html::a(
                    '<span class="glyphicon glyphicon-cog">delete</span>', 
                    ['/admin/users/deletebalance', 'id' => $wallet->id]);
                },
                
            ],
        ],
       ]
   ])
?>
    
    <div class="form-group">
        <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success']) ?>
    </div>
    <p>
        <?= Html::a('Добавить кошелек', ['createbalance'], ['class' => 'btn btn-success', 'style' => Yii::$app->user->isGuest ? 'display:none' : 'display:inline-block']) ?>
    </p>
    <?php ActiveForm::end(); ?>

</div>
