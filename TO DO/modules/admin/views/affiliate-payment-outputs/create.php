<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\AffiliatePaymentOutputs */

$this->title = 'Create Affiliate Payment Outputs';
$this->params['breadcrumbs'][] = ['label' => 'Affiliate Payment Outputs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="affiliate-payment-outputs-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
