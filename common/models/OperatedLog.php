<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "sys_operated_log".
 *
 * @property integer $id
 * @property string $route
 * @property string $description
 * @property integer $created_at
 * @property integer $user_id
 */
class OperatedLog extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sys_operated_log';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['description'], 'string'],
            [['created_at'], 'required'],
            [['created_at', 'user_id'], 'integer'],
            [['route'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'route' => 'Route',
            'description' => 'Description',
            'created_at' => 'Created At',
            'user_id' => 'User ID',
        ];
    }
}
