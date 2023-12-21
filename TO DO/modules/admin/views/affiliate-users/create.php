<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\AffiliateUsers */

$this->title = 'Create Affiliate Users';
$this->params['breadcrumbs'][] = ['label' => 'Affiliate Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="affiliate-users-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
