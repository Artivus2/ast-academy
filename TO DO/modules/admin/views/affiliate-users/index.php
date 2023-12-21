<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\AffiliateUsersSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Affiliate Users';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="affiliate-users-index">

    <h1><?= Html::encode($this->title) ?></h1>


    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],

            //'id',
            'uid',
            //'app_id',
            'email:email',
            //'token',
            //'telegram',
            'dollars',
            //'wallet_type_id',
            //'wallet_data',
            //'name',
            //'surname',
            //'country',
            //'city',
            //'password',
            //'is_admin',
            //'banned',
            //'deleted',
            //'affiliate_invitation_id',
            //'last_visit_time',
            'create_date',
            //'confirm_email:email',
            //'confirm_email_token:email',
            //'confirm_reset_expire',
            //'confirm_reset_token',
            //'confirm_delete_expire',
            //'confirm_delete_token',
            //'delete_date',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
