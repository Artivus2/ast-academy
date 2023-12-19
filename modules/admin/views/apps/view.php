<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Apps */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Настройки', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="apps-view">

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
            'name',
            'domain',
            'banned',
            'mail_name',
            'mail_host',
            'mail_username',
            'mail_password',
            'max_virtual_dollars',
            'min_increase_amount',
            'min_withdrawal_amount',
            'min_order_amount',
            'min_affiliate_order_amount',
            'merchant_id',
            'merchant_secret_word',
            'merchant_secret_word_2',
            'support_chat',
            'exchange',
        ],
    ]) ?>

</div>
