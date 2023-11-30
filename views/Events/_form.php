<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use app\models\Organizators;
use app\models\OrganizatorsSearch;
use app\models\Events;
use app\models\EventsSearch;
?>
<div class="events-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data', 'name' => 'events_form']]); ?>

    <?= $form->field($events, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($events, 'date')->textInput(['value' => date('Y-m-d')]) ?>

    <?= $form->field($events, 'description')->textarea(['rows' => 6]) ?>


    
    <?php

        // foreach ($organizators as $index => $organizator) {
        //     echo $form->field($organizator, "[$index]fio")->textInput(['maxlength' => true]);
        //     echo $form->field($organizator, "[$index]email")->textInput(['maxlength' => true]);
        //     echo $form->field($organizator, "[$index]phone")->textInput(['maxlength' => true]);
        // }
        $datalist = Organizators::find()->all();
        $data = ArrayHelper::map($datalist,'id','fio');
        echo $form->field($events, 'organizators')->widget(Select2::class, [
           // 'theme' => Select2::THEME_DEFAULT,
            'value'      => $events->organizators,
            'hideSearch' => true,
            'data' => $data,
            'options' => [
                'multiple' => true,
                
            ]
            
        ]);
    ?>

    <div class="form-group">
        <?= Html::button('Сохранить', ['class' => 'btn btn-success', 'onclick' => "$('[name=events_form]').attr('action','" . ($events->isNewRecord ? "/events/create" 
        : "/events/update?id=" . $events->id) . "');
        $('[name=events_form]').submit();"]) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
