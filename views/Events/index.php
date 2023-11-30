<?php

use app\models\Organizators;
use app\models\OrganizatorsSearch;
use app\models\Events;
use app\models\EventsSearch;
use yii\grid\ActionColumn;
use yii\grid\DataColumn;
use yii\grid\GridView;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\Pjax;

use yii\helpers\ArrayHelper;



$this->title = 'Мероприятия - админка';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="book-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Создать мероприятие', ['create'], ['class' => 'btn btn-success', 'style' => Yii::$app->user->isGuest ? 'display:none' : 'display:inline-block']) ?>
    </p>

    <?php Pjax::begin(); ?>
    

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],
            'title',
            'date',
            'description',
            
            [
                'class' => DataColumn::class,
                'attribute' => 'Organizators',
                'value' => function($data) {
                    if (count($data->organizators)) {
                        return implode(',',array_map(function($item){
                            return $item->fio;
                        }, $data->organizators));
                    }
                    return '';
                }
            ],
            
                
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, Events $events, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $events->id]);
                 },
                'visibleButtons' => [
                    'update' => !Yii::$app->user->isGuest,
                    'delete' => !Yii::$app->user->isGuest,
                ],
            ],
        ],
    ]); ?>

    <?php Pjax::end(); ?>

</div>
