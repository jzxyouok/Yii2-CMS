<?php
/**
 * Created by PhpStorm.
 * User: King <wangxin.king.314@gmail.com>
 * Date: 2016/5/12
 * Time: 11:36
 */

namespace backend\components;


class Tree
{
    /**
     * 生成分类
     * @param array $data
     * @param int $parent_id
     * @param int $level
     * @param string $html
     * @return array
     */
    public static function getLists(&$data = [], $parent_id = 0, $level = 0, $html = '|---')
    {
        $lists = [];
        foreach ($data as $value){
            if ($value['parent_id'] == $parent_id) {
                $value['name'] = str_repeat('&nbsp;&nbsp;', $level) . $value['name'];
                $lists[] = $value;
                $lists = array_merge($lists, self::getLists($data, $value['id'], $level + 1, $html));
            }
        }
        return $lists;
    }
}