<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\AffiliateInvitation */

$this->title = 'Update Affiliate Invitation: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Affiliate Invitations', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="affiliate-invitation-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
