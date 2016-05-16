<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Carousel */

$this->title = '创建轮播图';
$this->params['breadcrumbs'][] = ['label' => '轮播图管理', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="carousel-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
