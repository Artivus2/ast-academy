<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\AppsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Настройки';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="apps-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],

            'id',
            'name',
            //'domain',
            //'banned',
            //'mail_name',
            //'mail_host',
            //'mail_username',
            //'mail_password',
            //'max_virtual_dollars',
            //'min_increase_amount',
            //'min_withdrawal_amount',
            //'min_order_amount',
            //'min_affiliate_order_amount',
            //'merchant_id',
            //'merchant_secret_word',
            //'merchant_secret_word_2',
            //'support_chat',
            //'exchange',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
