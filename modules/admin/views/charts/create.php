<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Charts */

$this->title = 'Create Charts';
$this->params['breadcrumbs'][] = ['label' => 'Charts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="charts-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
