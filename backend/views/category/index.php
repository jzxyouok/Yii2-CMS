<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\Category */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '分类管理';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row">
    <div class="col-xs-12">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title"><?= Html::a('创建分类', ['create'], ['class' => 'btn btn-success']) ?></h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>分类名称</th>
                        <th>分类描述</th>
                        <th>排序</th>
                        <th>状态</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($lists as $v): ?>
                        <tr>
                            <td><?= $v['name'] ?></td>
                            <td><?= $v['remark'] ?></td>
                            <td><?= $v['sort'] ?></td>
                            <td><?= $v['status'] ?></td>
                            <td><?= date('Y-m-d H:i:s', $v['created_at']) ?></td>
                            <td>
                                <?= Html::a(
                                    '<span class="glyphicon glyphicon-eye-open"></span>',
                                    ['view', 'id' => $v['id']],
                                    ['title' => '查看', 'aria-label' => '查看', 'data-pjax' => 0]
                                ) ?>
                                <?= Html::a(
                                    '<span class="glyphicon glyphicon-pencil"></span>',
                                    ['update', 'id' => $v['id']],
                                    ['title' => '更新', 'aria-label' => '更新', 'data-pjax' => 0]
                                ) ?>
                                <?= Html::a(
                                    '<span class="glyphicon glyphicon-trash"></span>',
                                    ['view', 'id' => $v['id']],
                                    ['title' => '删除', 'aria-label' => '删除', 'data-pjax' => 0, 'data-confirm' => '您确定要删除此项吗？', 'data-method' =>'post']
                                ) ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>