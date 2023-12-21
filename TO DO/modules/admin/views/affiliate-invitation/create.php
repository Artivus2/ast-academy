<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\AffiliateInvitation */

$this->title = 'Create Affiliate Invitation';
$this->params['breadcrumbs'][] = ['label' => 'Affiliate Invitations', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="affiliate-invitation-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
