<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\AffiliatePaymentOutputs */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Affiliate Payment Outputs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="affiliate-payment-outputs-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'app_id',
            'affiliate_user_id',
            'wallet_type_id',
            'wallet_data',
            'amount',
            'comment:ntext',
            'status',
            'promocode_id',
            'date',
            'order_id',
        ],
    ]) ?>

</div>
