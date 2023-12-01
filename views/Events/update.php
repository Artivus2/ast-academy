<?php

use yii\helpers\Html;


$this->title = 'Обновить мероприятие: ' . $events->title;
$this->params['breadcrumbs'][] = ['label' => 'Мероприятия', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $events->title, 'url' => ['index', 'id' => $events->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="book-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'events' => $events,
        'organizators' => $organizators,
    ]) ?>

</div>
