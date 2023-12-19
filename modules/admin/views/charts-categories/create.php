<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\ChartsCategories */

$this->title = 'Create Charts Categories';
$this->params['breadcrumbs'][] = ['label' => 'Charts Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="charts-categories-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
