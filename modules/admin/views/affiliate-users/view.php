<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\AffiliateUsers */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Affiliate Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="affiliate-users-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'uid',
            'email:email',
            'telegram',
            'dollars',
            'wallet_type_id',
            'wallet_data',
            'name',
            'surname',
            'country',
            'city',
            'is_admin',
            'banned',
            'deleted',
            'affiliate_invitation_id',
            'last_visit_time',
            'create_date',
            'confirm_email:email',
            'confirm_email_token:email',
            'confirm_reset_expire',
            'confirm_reset_token',
            'confirm_delete_expire',
            'confirm_delete_token',
            'delete_date',
            'comment',
        ],
    ]) ?>

</div>
