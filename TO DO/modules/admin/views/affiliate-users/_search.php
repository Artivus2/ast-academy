<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search\AffiliateUsersSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="affiliate-users-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'uid') ?>

    <?= $form->field($model, 'app_id') ?>

    <?= $form->field($model, 'email') ?>

    <?= $form->field($model, 'token') ?>

    <?php // echo $form->field($model, 'telegram') ?>

    <?php // echo $form->field($model, 'dollars') ?>

    <?php // echo $form->field($model, 'wallet_type_id') ?>

    <?php // echo $form->field($model, 'wallet_data') ?>

    <?php // echo $form->field($model, 'name') ?>

    <?php // echo $form->field($model, 'surname') ?>

    <?php // echo $form->field($model, 'country') ?>

    <?php // echo $form->field($model, 'city') ?>

    <?php // echo $form->field($model, 'password') ?>

    <?php // echo $form->field($model, 'is_admin') ?>

    <?php // echo $form->field($model, 'banned') ?>

    <?php // echo $form->field($model, 'deleted') ?>

    <?php // echo $form->field($model, 'affiliate_invitation_id') ?>

    <?php // echo $form->field($model, 'last_visit_time') ?>

    <?php // echo $form->field($model, 'create_date') ?>

    <?php // echo $form->field($model, 'confirm_email') ?>

    <?php // echo $form->field($model, 'confirm_email_token') ?>

    <?php // echo $form->field($model, 'confirm_reset_expire') ?>

    <?php // echo $form->field($model, 'confirm_reset_token') ?>

    <?php // echo $form->field($model, 'confirm_delete_expire') ?>

    <?php // echo $form->field($model, 'confirm_delete_token') ?>

    <?php // echo $form->field($model, 'delete_date') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
