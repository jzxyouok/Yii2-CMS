<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\Links */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '友情链接';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="links-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('添加友链', ['create'], ['class' => 'btn btn-success']) ?>
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
//            'image:image',    //等同与上面的写法
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
