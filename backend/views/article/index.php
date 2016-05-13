<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\Article */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '文章管理';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="article-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('添加文章', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'title',
            'category_id',
//            'sub_title',
            'author',
            'source',
            // 'image',
            // 'summary',
//             'content:ntext',
            'hits',
            'sort',
            'created_at:date',
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

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
