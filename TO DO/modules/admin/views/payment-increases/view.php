<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\PaymentIncreases */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'История пополнений', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="payment-increases-view">

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
            [
                'attribute'=> 'type',
                'format' => 'raw',
                'value' => function($data){
                    return Yii::$app->params["payment_increases_type"][$data->status];
                }
            ],
            'amount',
            'promocode_id',
            'full_amount',
            [
                'attribute'=> 'status',
                'format' => 'raw',
                'value' => function($data){
                    return Yii::$app->params["payment_status"][$data->status];
                }
            ],
            'affiliate_invitation_id',
            'affiliate_invitation_paid',
            'date',
            'order_id',
        ],
    ]) ?>

</div>
