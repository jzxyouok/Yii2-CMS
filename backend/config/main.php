<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-backend',
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
    ],
    'modules' => [
        'admin' => [
            'class' => 'mdm\admin\Module',
        ],
        'redactor' => [
            'class' => 'yii\redactor\RedactorModule',
            'uploadDir' => '@webroot/upload/images/' . date('Y') . '/' . date('m') .'/' . date('d'),
            'uploadUrl' => '@web/upload/images/' . date('Y') . '/' . date('m') .'/' . date('d'),
            'imageAllowExtensions'=>['jpg','png','gif'],
        ],
    ],
    'aliases' => [
        '@mdm/admin' => '@vendor/mdmsoft/yii2-admin',
    ],
    'on beforeRequest' => function($event){
        yii\base\Event::on(yii\db\BaseActiveRecord::className(), yii\db\BaseActiveRecord::EVENT_AFTER_UPDATE, ['backend\components\OperatedLog', 'write']);
    },
    'params' => $params,
];
