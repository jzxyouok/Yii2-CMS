<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use yii\web\JsExpression;
use xj\uploadify\Uploadify;

/* @var $this yii\web\View */
/* @var $model common\models\Article */
/* @var $form yii\widgets\ActiveForm */
?>

<style type="text/css">
    .form-control {border-radius: 5px;}
    .uploadify-button {border-radius: 0px;}
    .redactor-editor {min-height: 400px;}
</style>

<div class="article-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'sub_title')->textInput(['maxlength' => true]) ?>

    <div class="row">
        <div class="col-sm-6">
            <?= $form->field($model, 'category_id')->dropDownList(ArrayHelper::map($category, 'id', 'name')) ?>
        </div>
        <div class="col-sm-6">
            <?= $form->field($model, 'source')->textInput(['maxlength' => true]) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6">
            <div class="form-group field-article-image">
                <?php
                    echo Html::label($model->getAttributeLabel('image'), 'article-image', ['class' => 'control-label']);
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
                                            $('input[name="Article[image]"]').val(data.fileUrl);
    //                                        $('#image').append("<img src='" + data.webUrl + "' height=80 />");
                                        }
                                    }
EOF
                                ),
                            ]
                    ]);
                    echo Html::error($model, 'image');
                ?>
            </div>
        </div>
        <div class="col-sm-6">
            <?= $form->field($model, 'status')->dropDownList(['1' => '启用', '0' => '禁用']) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4">
            <?= $form->field($model, 'author')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-sm-4">
            <?= $form->field($model, 'hits')->textInput(['value' => 100]) ?>
        </div>
        <div class="col-sm-4">
            <?= $form->field($model, 'sort')->textInput(['value' => 1000]) ?>
        </div>
    </div>

    <?= $form->field($model, 'summary')->textarea(['rows' => 3]) ?>

    <?= $form->field($model, 'content')->widget(\yii\redactor\widgets\Redactor::className(), [
        'clientOptions' => [
            'lang' => 'zh_cn',
            'plugins' => ['fontfamily', 'fontsize', 'clips', 'table', 'fontcolor', 'imagemanager']
        ]
    ]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '创建' : '更新', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
