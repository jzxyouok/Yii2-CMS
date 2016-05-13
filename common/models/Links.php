<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%links}}".
 *
 * @property integer $id
 * @property string $name
 * @property string $image
 * @property string $url
 * @property integer $sort
 * @property integer $status
 * @property integer $created_at
 */
class Links extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%links}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['url'], 'required'],
            [['sort', 'status', 'created_at'], 'integer'],
            [['name'], 'string', 'max' => 32],
            [['image'], 'string'],
            [['url'], 'url'],
            [['created_at'], 'default', 'value' => time()],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => '名称',
            'image' => 'Logo',
            'url' => '链接地址',
            'sort' => '排序',
            'status' => '状态',
            'created_at' => '创建时间',
        ];
    }
}
