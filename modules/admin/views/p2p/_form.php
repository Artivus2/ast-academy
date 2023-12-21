<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use app\models\StatusType;
/* @var $this yii\web\View */
/* @var $model app\models\Users */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="p2p-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'uuid')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'status')->widget(Select2::classname(), [
    'data' => ArrayHelper::map(StatusType::find()->asArray()->all(), 'status_id', 'title'),
    'options' => ['placeholder' => 'Статус...'],
    'toggleAllSettings' => [
        'selectLabel' => '<i class="fas fa-check-circle">1</i> Tag All',
        'unselectLabel' => '<i class="fas fa-times-circle">2</i> Untag All',
        'selectOptions' => ['class' => 'btn-success'],
        'unselectOptions' => ['class' => 'text-danger'],
    ],
    'pluginOptions' => [
        'allowClear' => false
    ],
]); ?>

    <?= $form->field($model, 'amount')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
