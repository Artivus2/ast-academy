<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\AffiliatePaymentIncreases */

$this->title = 'Create Affiliate Payment Increases';
$this->params['breadcrumbs'][] = ['label' => 'Affiliate Payment Increases', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="affiliate-payment-increases-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
