<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Apps */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="apps-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'domain')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'banned')->textInput() ?>

    <?= $form->field($model, 'mail_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'mail_host')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'mail_username')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'mail_password')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'max_virtual_dollars')->textInput() ?>

    <?= $form->field($model, 'min_increase_amount')->textInput() ?>

    <?= $form->field($model, 'min_withdrawal_amount')->textInput() ?>

    <?= $form->field($model, 'min_order_amount')->textInput() ?>

    <?= $form->field($model, 'min_affiliate_order_amount')->textInput() ?>

    <?= $form->field($model, 'merchant_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'merchant_secret_word')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'merchant_secret_word_2')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'support_chat')->textInput() ?>

    <?= $form->field($model, 'exchange')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
