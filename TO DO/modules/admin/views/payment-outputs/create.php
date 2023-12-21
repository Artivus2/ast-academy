<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\PaymentOutputs */

$this->title = 'Создать запрос на вывод средств';
$this->params['breadcrumbs'][] = ['label' => 'Запросы на вывод средств', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="payment-outputs-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
