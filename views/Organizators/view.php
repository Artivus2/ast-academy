<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var \app\models\organizators $model */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'organizators', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="organizators-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], [
            'class' => 'btn btn-primary',
            'style' => \Yii::$app->user->isGuest ? 'display:none' : 'display:inline-block',
        ]) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
            'style' => \Yii::$app->user->isGuest ? 'display:none' : 'display:inline-block',
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'fio',
            'email',
            'phone',
        ],
    ]) ?>

</div>
