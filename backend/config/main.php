<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-backend',
    'name' => '后台管理系统',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'bootstrap' => ['log'],
    'timeZone' => 'Asia/Shanghai',      //time zone affect the formatter datetime format
    'language' => 'zh-CN',
    'modules' => [],
    'components' => [
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => true,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'urlManager' => [
            'enablePrettyUrl' => true,
            'enableStrictParsing' => false,
            'showScriptName' => false,
            'suffix' => '',
            'rules' => [
                '<controller:\w+>/<id:\d+>'=>'<controller>/view',  
                '<controller:\w+>/<action:\w+>'=>'<controller>/<action>'
            ],
        ],
        'authManager' => [
            'class' => 'yii\rbac\DbManager',
            'defaultRoles' => ['guest'],
        ],
        'setting' => [
            'class' => 'funson86\setting\Setting',
        ],
    ],
    'as access' => [
        'class' => 'mdm\admin\components\AccessControl',
        'allowActions' =>[]
    ],
    'modules' => [
        'rbac' => [
            'class' => 'mdm\admin\Module',
        ],
        'redactor' => [
            'class' => 'backend\components\RedactorModule',
            'uploadDir' => '@webroot/upload/images',
            'uploadUrl' => '@web/upload/images',
            'imageAllowExtensions'=>['jpg','png','gif'],
        ],
        'setting' => [
            'class' => 'funson86\setting\Module',
            'controllerNamespace' => 'funson86\setting\controllers'
        ],
    ],
    'aliases' => [
        '@mdm/admin' => '@vendor/mdmsoft/yii2-admin',
    ],
//    'on beforeRequest' => function($event){
//        yii\base\Event::on(yii\db\BaseActiveRecord::className(), yii\db\BaseActiveRecord::EVENT_AFTER_UPDATE, ['backend\components\OperatedLog', 'write']);
//    },
    'params' => $params,
];
