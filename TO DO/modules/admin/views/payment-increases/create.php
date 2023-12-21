<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\PaymentIncreases */

$this->title = 'Создать новое пополнение';
$this->params['breadcrumbs'][] = ['label' => 'История пополнений', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="payment-increases-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
