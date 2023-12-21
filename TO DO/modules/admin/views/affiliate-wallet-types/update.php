<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\AffiliateWalletTypes */

$this->title = 'Update Affiliate Wallet Types: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Affiliate Wallet Types', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="affiliate-wallet-types-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
