<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search\DealsSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="deals-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'app_id') ?>

    <?= $form->field($model, 'user_id') ?>

    <?= $form->field($model, 'chart_id') ?>

    <?= $form->field($model, 'minutes') ?>

    <?php // echo $form->field($model, 'amount') ?>

    <?php // echo $form->field($model, 'income') ?>

    <?php // echo $form->field($model, 'yield') ?>

    <?php // echo $form->field($model, 'wallet') ?>

    <?php // echo $form->field($model, 'spot') ?>

    <?php // echo $form->field($model, 'close_spot') ?>

    <?php // echo $form->field($model, 'type') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'notified') ?>

    <?php // echo $form->field($model, 'date') ?>

    <?php // echo $form->field($model, 'order_id') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
