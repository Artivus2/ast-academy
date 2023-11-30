<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var \app\models\Book $book */
/** @var \app\models\Author[] $authors */

$this->title = 'Создать мероприятие';
$this->params['breadcrumbs'][] = ['label' => 'Events', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="book-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'events' => $events,
        'organizators' => $organizators,
    ]) ?>

</div>
