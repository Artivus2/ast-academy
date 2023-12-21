<?php

use Yii;
use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\PaymentOutputs */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Запросы на вывод средств', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="payment-outputs-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Изменить', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Удалить', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Вы уверены, что хотите удалить этот элемент?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            [
                'attribute'=> 'user_id',
                'value'=> isset($model->user) ? Html::a($model->user->email, ['/admin/users/view', 'id' => $model->user->id]) : "-",
                'format' => 'html'
            ],
            'type',
            'card_number',
            'card_holder',
            'amount',
            'promocode_id',
            [
                'attribute'=> 'status',
                'format' => 'raw',
                'value' => function($data){
                    return Yii::$app->params["payment_status"][$data->status];
                }
            ],
            'date',
            'order_id',
        ],
    ]) ?>

</div>
