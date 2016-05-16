<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\web\JsExpression;
use xj\uploadify\Uploadify;

/* @var $this yii\web\View */
/* @var $model common\models\Carousel */
/* @var $form yii\widgets\ActiveForm */
?>

<style type="text/css">
    .form-control {border-radius: 5px;}
    .uploadify-button {border-radius: 0px;}
</style>

<div class="carousel-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="row">
        <div class="col-sm-6">

            <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

            <?php
            echo Html::label($model->getAttributeLabel('image'), 'carousel-image', ['class' => 'control-label']);
            echo Html::activeInput('hidden', $model, 'image');
            echo Html::fileInput('image', '', ['id' => 'image']);
            echo Uploadify::widget([
                'url' => yii\helpers\Url::to(['s-upload']),
                'id' => 'image',
                'csrf' => true,
                'renderTag' => false,
                'jsOptions' => [
                    'width' => 150,
                    'height' => 34,
                    'onUploadError' => new JsExpression(<<<EOF
                                        function(file, errorCode, errorMsg, errorString) {
                                            console.log('The file ' + file.name + ' could not be uploaded: ' + errorString + errorCode + errorMsg);
                                        }
EOF
                    ),
                    'onUploadSuccess' => new JsExpression(<<<EOF
                                        function(file, data, response) {
                                            data = JSON.parse(data);
                                            if (data.error) {
                                                console.log(data.msg);
                                            } else {
                                                console.log(data.fileUrl);
                                                $('input[name="Carousel[image]"]').val(data.fileUrl);
        //                                        $('#image').append("<img src='" + data.webUrl + "' height=80 />");
                                            }
                                        }
EOF
                    ),
                ]
            ]);
            echo Html::error($model, 'image');
            ?>

            <?= $form->field($model, 'url')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'sort')->textInput(['value' => 100]) ?>

            <?= $form->field($model, 'status')->dropDownList(['1' => '启用', '0' => '禁用']) ?>

        </div>
    </div>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '创建' : '更新', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
