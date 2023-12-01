<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use kartik\datetime\DateTimePicker;
use yii\helpers\ArrayHelper;
use app\models\Organizators;
use app\models\OrganizatorsSearch;
use app\models\Events;
use app\models\EventsSearch;
use yii\web\JsExpression;
?>
<div class="events-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data', 'name' => 'events_form']]); ?>


    <?= $form->field($events, 'id')->textInput(['readonly' => true]) ?>


    <?= $form->field($events, 'title')->textInput(['maxlength' => true]) ?>

    <?php
    echo DateTimePicker::widget([
    'model' => $events,
    'attribute' => 'date',
    'options' => ['placeholder' => 'Введите дату и время..'],
    'pluginOptions' => [
        'autoclose' => true,
        'locale' => [
            'format' => 'Y-m-d H:i',
        ],

    ]
]);

?>


    <?= $form->field($events, 'description')->textarea(['rows' => 6]) ?>


    
    <?php

        
        echo $form->field($events, 'organizators')->widget(Select2::class, [
           // 'theme' => Select2::THEME_DEFAULT,
        //'model' => $organizators,
        
        'attribute' => 'organizators',
        'hideSearch' => true,
        'data' => ArrayHelper::map(Organizators::find()->all(),'id','fio'),
        'options' => [
        'multiple' => true,
                
        ],
        
            
        ]);
    ?>

    <div class="form-group">
        <?= Html::button('Сохранить', ['class' => 'btn btn-success', 'onclick' => "$('[name=events_form]').attr('action','" . ($events->isNewRecord ? "/events/create" 
        : "/events/update?id=" . $events->id) . "');
        $('[name=events_form]').submit();"]) ?>
    </div>

    <?php ActiveForm::end(); ?>
    

</div>
