<?php
/**
 * Created by PhpStorm.
 * User: King <wangxin.king.314@gmail.com>
 * Date: 2016/5/9
 * Time: 16:31
 */
namespace backend\components;

use yii\helpers\Url;

class OperatedLog{
    public static function write($event){
        if (!empty($event->changeAttributes)){
            $desc = '';
            foreach ($event->changeAttributes as $name => $value){
                $desc .= $name . ' : ' . $value . '=>' . $event->sender->getAttribute($name) . ',';
            }
            $desc = substr($desc, 0, -1);
            $description = \Yii::$app->user->identity->username . '修改了' . $event->sender->className() . 'id:' . $event->sender->id . '的' . $desc;
            $route = Url::to();
            $userId = \Yii::$app->user->id;
            $data = [
                'route' => $route,
                'description' => $description,
                'user_id' => $userId
            ];
            $model = new \common\models\OperatedLog();
            $model->setAttributes($data);
            $model->save();
        }
    }
}