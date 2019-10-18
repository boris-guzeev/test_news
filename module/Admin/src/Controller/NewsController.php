<?php
/**
 * Created by PhpStorm.
 * User: Boris Guzeev
 * Date: 16.10.2019
 * Time: 2:20
 */

namespace Admin\Controller;

use Admin\Form\NewsForm;
use Admin\Model\News;
use Admin\Model\NewsTable;
use Zend\Hydrator\ObjectProperty;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class NewsController extends AbstractActionController
{
    private $table;

    public function __construct(NewsTable $table)
    {
        $this->table = $table;
    }

    public function indexAction()
    {
        $news = $this->table->fetchAll();

        foreach ($news as &$one) {
            $length = strlen($one['text']);
            if ($length >= 255) {
                $one['text'] = mb_substr($one['text'], 0, 255) . '...';
            }
        }
        return new ViewModel(['news' => $news]);
    }

    public function addAction()
    {
        $form = new NewsForm();
        $form->get('submit')->setValue('Add');

        $request = $this->getRequest();

        if (!$request->isPost()) {
            return ['form' => $form];
        }

        $news = new News;
        $form->setInputFilter($news->getInputFilter());
        $form->setData($request->getPost());

        if (!$form->isValid()) {
            return ['form' => $form];
        }

        $news->exchangeArray($form->getData());
        $this->table->saveNews($news);
        return $this->redirect()->toRoute('admin_news');
    }

    public function editAction()
    {
        $id = (int) $this->params()->fromRoute('id', 0);

        if (0 === $id) {
            return $this->redirect()->toRoute('admin_news', ['action' => 'add']);
        }
        try {
            $news = $this->table->getNews($id);
        } catch (\Exception $e) {
            return $this->redirect()->toRoute('admin_news', ['action' => 'index']);
        }

        $form = new NewsForm;
        $form->setHydrator(new ObjectProperty());
        $form->bind($news);
        $form->get('submit')->setAttribute('value', 'Редактировать');
        $request = $this->getRequest();
        $viewData = ['id' => $id, 'form' => $form];

        if (!$request->isPost()) {
            return $viewData;
        }

        $form->setInputFilter($news->getInputFilter());
        $form->setData($request->getPost());

        if (!$form->isValid()) {
            return $viewData;
        }

        $this->table->saveNews($news);
        return $this->redirect()->toRoute('admin_news', ['action' => 'index']);
    }

    public function deleteAction()
    {
        $id = (int) $this->params()->fromRoute('id', 0);
        if (!$id) {
            return $this->redirect()->toRoute('admin_news');
        }

        $request = $this->getRequest();
        if ($request->isPost()) {
            $del = $request->getPost('del', 'No');

            if ($del == 'Да') {
                $id = (int) $request->getPost('id');
                $this->table->deleteNews($id);
            }

            return $this->redirect()->toRoute('admin_news');
        }

        return [
            'id'    => $id,
            'news' => $this->table->getNews($id),
        ];
    }
}