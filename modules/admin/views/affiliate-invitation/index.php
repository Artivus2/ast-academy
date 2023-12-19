<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\AffiliateInvitationSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Affiliate Invitations';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="affiliate-invitation-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],

            'id',
            'affiliate_user_id',
            'code',
            'offer_id',
            'date',
            'percent',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
