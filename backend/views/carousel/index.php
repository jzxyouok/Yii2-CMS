<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\Carousel */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '轮播图管理';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="carousel-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('添加轮播图', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'name',
            [
                'attribute' => 'image',
                'value' => function($model) {
                    return '<img src="' . $model->image . '" height=25 />';
                },
                'format' => 'raw'
            ],
            'url:url',
            'sort',
            [
                'attribute' => 'status',
                'value' => function($model) {
                    return $model->status == 0 ? '下架' : '显示';
                },
                'filter' => [
                    0 => '下架',
                    1 => '显示'
                ]
            ],
            'created_at:date',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
