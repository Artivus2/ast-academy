<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search\AffiliatePaymentIncreasesSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="affiliate-payment-increases-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'app_id') ?>

    <?= $form->field($model, 'affiliate_user_id') ?>

    <?= $form->field($model, 'trader_user_id') ?>

    <?= $form->field($model, 'offer_id') ?>

    <?php // echo $form->field($model, 'amount') ?>

    <?php // echo $form->field($model, 'date') ?>

    <?php // echo $form->field($model, 'order_id') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
