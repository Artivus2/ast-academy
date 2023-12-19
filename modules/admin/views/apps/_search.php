<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search\AppsSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="apps-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'name') ?>

    <?= $form->field($model, 'domain') ?>

    <?= $form->field($model, 'banned') ?>

    <?= $form->field($model, 'mail_name') ?>

    <?php // echo $form->field($model, 'mail_host') ?>

    <?php // echo $form->field($model, 'mail_username') ?>

    <?php // echo $form->field($model, 'mail_password') ?>

    <?php // echo $form->field($model, 'max_virtual_dollars') ?>

    <?php // echo $form->field($model, 'min_increase_amount') ?>

    <?php // echo $form->field($model, 'min_withdrawal_amount') ?>

    <?php // echo $form->field($model, 'min_order_amount') ?>

    <?php // echo $form->field($model, 'min_affiliate_order_amount') ?>

    <?php // echo $form->field($model, 'merchant_id') ?>

    <?php // echo $form->field($model, 'merchant_secret_word') ?>

    <?php // echo $form->field($model, 'merchant_secret_word_2') ?>

    <?php // echo $form->field($model, 'support_chat') ?>

    <?php // echo $form->field($model, 'exchange') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
