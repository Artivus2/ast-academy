<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use kartik\select2\Select2;
use app\models\Events;
use app\models\Organizators;
use app\models\OrganizatorsSearch;
use app\models\EventsHistory;
use yii\grid\DataColumn;
use yii\widgets\Pjax;


/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Мероприятия';
$this->params['breadcrumbs'][] = $this->title;
?>
<div>

    <h1><?= Html::encode($this->title) ?></h1>

    <?php Pjax::begin(); ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            'title',
            'date',
            
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
    ]); 
    
    
    ?>
<?php Pjax::end(); ?>

</div>
