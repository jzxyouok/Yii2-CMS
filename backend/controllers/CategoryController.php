<?php

namespace backend\controllers;

use Yii;
use common\models\Category;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * CategoryController implements the CRUD actions for Category model.
 */
class CategoryController extends Controller
{
    public $category;
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Category models.
     * @return mixed
     */
    public function actionIndex()
    {
        $data = Category::find()->orderBy(['sort' => 'desc'])->asArray()->all();
        $lists = self::getLists($data);
        return $this->render('index', [
            'lists' => $lists
        ]);
    }

    /**
     * 生成分类
     * @param array $data
     * @param int $parent_id
     * @param int $level
     * @param string $html
     * @return array
     */
    public function getLists(&$data = [], $parent_id = 0, $level = 0, $html = '|---')
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

    /**
     * Displays a single Category model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    public function beforeAction($action)
    {
        if (Yii::$app->request->isGet && $action->id == 'create' || $action->id == 'update'){
            $data = Category::find()->orderBy(['sort' => 'desc'])->asArray()->all();
            $category = self::getLists($data);
            $category[] = ['id' => 0, 'name' => '顶级分类'];
            $this->category = $category;
        }
        return true;
    }

    /**
     * Creates a new Category model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Category();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
                'category' => $this->category
            ]);
        }
    }

    /**
     * Updates an existing Category model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
                'category' => $this->category
            ]);
        }
    }

    /**
     * Deletes an existing Category model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Category model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Category the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Category::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
