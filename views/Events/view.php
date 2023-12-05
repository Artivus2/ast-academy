<?php

use yii\helpers\Html;
use yii\widgets\DetailView;


$this->title = $events->title;
$this->params['breadcrumbs'][] = ['label' => 'Events', 'url' => ['view']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="book-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $events->id], [
                'class' => 'btn btn-primary',
                'style' => \Yii::$app->user->isGuest ? 'display:none' : 'display:inline-block'
        ]) ?>
        <?= Html::a('Delete', ['delete', 'id' => $events->id], [
            'class' => 'btn btn-danger',
            'style' => \Yii::$app->user->isGuest ? 'display:none' : 'display:inline-block',
            'data' => [
                'confirm' => 'Уверены что хотите удалить?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?php
    $organizators = '';
    for($i = 0; $i<count($events->organizators); $i++) {
        $organizators .= $events->organizators[$i]->fio;
        if ($i < count($events->organizators) - 1) {
            $organizators .= ', ';
        }
    }
    ?>

    <?= DetailView::widget([
        'model' => $events,
        'attributes' => [
            'id',
            'title',
            'date',
            'description',
            [
                'class' => DataColumn::class,
                'attribute' => 'Организаторы',
                'value' => function($data) {
                    if (count($data->organizators)) {
                        return implode(',',array_map(function($item){
                            return $item->fio;
                        }, $data->organizators));
                    }
                    return '';
                }
        ],
        ],
    ]) ?>

</div>
