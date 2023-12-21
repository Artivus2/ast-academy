<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\AffiliateWalletTypes */

$this->title = 'Create Affiliate Wallet Types';
$this->params['breadcrumbs'][] = ['label' => 'Affiliate Wallet Types', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="affiliate-wallet-types-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
