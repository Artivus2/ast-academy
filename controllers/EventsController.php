<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\Events;
use app\models\EventsHistory;
use app\models\EventsSearch;
use app\models\Organizators;
use app\models\OrganizatorsSearch;
use yii\data\ActiveDataProvider;
use yii\helpers\ArrayHelper;

class EventsController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            // 'access' => [
            //     'class' => AccessControl::class,
            //     'only' => ['index'],
            //     'rules' => [
            //         [
            //             'actions' => ['index'],
            //             'allow' => true,
            //             'roles' => ['@'],
            //         ],
            //     ],
            // ],
            // 'verbs' => [
            //     'class' => VerbFilter::class,
            //     'actions' => [
            //         'index' => ['post'],
            //     ],
            // ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
       
    }

   
    public function actionIndex()
    {
        if (Yii::$app->user->isGuest) {
            return $this->render('error');
        }
        $searchModel = new EventsSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }


    public function actionView($id)
    {
        return $this->render('view', [
            'events' => $this->findModel($id),
        ]);
    }



    public function actionCreate()
    {
        $events = $this->getValidatedEventsFromPost();
        $organizators = $this->getValidatedOrganizatorsFromPost();

        if (!$this->request->isPost) {
            return $this->render('create', [
                'events' => $events,
                'organizators' => $organizators,
            ]);
        }

        if ($events && $organizators) {
            if ($events->save(false)) {
                foreach ($organizators as $organizator) {
                    $isNewRecord = $organizator->isNewRecord;
                    $organizator->save(false);
                    if ($isNewRecord) {
                        $events->link('organizators', $organizator);
                    }
                }
            }
        }

        return $this->redirect(['view', 'id' => $events->id]);
    }

    private function getValidatedEventsFromPost(int $id = null): Events
    {
        $events = $id ? $this->findModel($id) : new Events();

        if ($this->request->isPost) {
            if ($events->load($this->request->post()) && $events->validate($this->request->post())) {
                
                
                if (!$events->isNewRecord) {
                    return $events;    
                }
                
            }
        } else {
            $events->loadDefaultValues();
        }

        return $events;
    }


    private function getValidatedOrganizatorsFromPost(Events $events = null): array
    {
        $organizators = [];

        if ($events) {
            $organizators = $events->organizators;
            
        }

        if (!count($organizators)) {
            $organizators = [new Organizators()];
        }

        if ($this->request->isPost) {
            $countFromPost = count(\Yii::$app->request->post('organizators', []));
            $countFromTable = count($organizators);
            for ($i = $countFromTable; $i<$countFromPost; $i++) {
                $organizators[] = new Organizators();
            }
            if (Organizators::loadMultiple($organizators, \Yii::$app->request->post())
                && Organizators::validateMultiple($organizators)
            ) {
                return $organizators;
            }
        } else {
            $organizators[0]->loadDefaultValues();
        }

        return $organizators;
    }
   


    public function actionAddOrganizators(int $id = null)
    {
        $events = $this->getValidatedEventsFromPost($id);
        $organizators = $this->getValidatedOrganizatorsFromPost($events);

        if ($events && $organizators) {
            $organizators[] = new Organizators();

            $view = $events->isNewRecord ? 'create' : 'update';

            return $this->render($view, [
                'events' => $events,
                'organizators' => $organizators,
            ]);
        }

        return $this->render('view', [
            'events' => $events,
            'organizators' => $organizators,
        ]);
    }



    public function actionUpdate(int $id)
    {
        $events = $this->getValidatedEventsFromPost($id);
        $organizators = $this->getValidatedOrganizatorsFromPost($events);


        if (!$this->request->isPost) {
            return $this->render('update', [
                'events' => $events,
                'organizators' => $organizators,
            ]);
        }
            // else {
        //     $organizators =Yii::$app->request->post('organizators');
        //     EventsHistory::deleteAll(['events_id' => $id]);
            // foreach ($organizators as $organizator) {
                   
            //         $events_history = new EventsHistory();
            //         $events_history->events_id = $events->id;
            //         $events_history->organizators_id = organizator->id;
            //         $events_history->save(false);
            //     }    
        



       
            
            // $events_history = EventsHistory::find()->where(['events_id' => $id])->all();
                    
            // if ($events_history) {
                
            // }
            
                
            
            //foreach ($organizators as $organizator) {

                //$isNewRecord = $organizator->isNewRecord;
                //$organizator->save(false);
                //if ($isNewRecord) {
                //$events->link('organizators', $organizator);
                //$events->$organizators->;
                //}
            //}


            if ($events->save(false)) {
                foreach ($organizators as $orgs) {
                    $isNewRecord = $orgs->isNewRecord;
                    $orgs->save(false);
                    if ($isNewRecord) {
                        $events->link('organizators', $orgs);
                    }
                }
            }
        

        return $this->redirect(['view', 'id' => $events->id]);
        
    }


    public function actionDelete($id)
    {
        $events = $this->findModel($id);
        foreach ($events->organizators as $organizator) {
            $organizator->delete();
        }
        $events->delete();

        return $this->redirect(['index']);
    }


    protected function findModel($id)
    {
        if (($model = Events::findOne(['id' => $id])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

        

    
}
