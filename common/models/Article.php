<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%article}}".
 *
 * @property integer $id
 * @property string $title
 * @property string $sub_title
 * @property string $author
 * @property string $source
 * @property integer $category_id
 * @property integer $created_at
 * @property string $image
 * @property string $summary
 * @property string $content
 * @property integer $hits
 * @property integer $sort
 * @property integer $status
 */
class Article extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%article}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'author', 'category_id', 'image', 'content'], 'required'],
            [['category_id', 'created_at', 'hits', 'sort', 'status'], 'integer'],
            [['content'], 'string'],
            ['created_at', 'default', 'value' => time()],
            [['title', 'source', 'image'], 'string', 'max' => 128],
            [['sub_title'], 'string', 'max' => 100],
            [['author'], 'string', 'max' => 32],
            [['summary'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => '文章标题',
            'sub_title' => '文章副标题',
            'author' => '作者',
            'source' => '来源',
            'category_id' => '分类',
            'created_at' => '添加时间',
            'image' => '缩略图',
            'summary' => '文章简介',
            'content' => '文章内容',
            'hits' => '点击量',
            'sort' => '排序',
            'status' => '状态',
        ];
    }

    /**
     * 关联Category表
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(Category::className(), ['id' => 'category_id']);
    }
}
