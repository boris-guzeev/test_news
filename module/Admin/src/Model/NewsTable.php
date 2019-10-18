<?php
/**
 * Created by PhpStorm.
 * User: Boris Guzeev
 * Date: 16.10.2019
 * Time: 14:30
 */

namespace Admin\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\Adapter\Driver\Pdo\Pdo;
use Zend\Db\Adapter\Driver\Pdo\Statement;
use Zend\Db\Adapter\Driver\Pdo\Result;
use Zend\Db\Sql\Sql;
use RuntimeException;
use Zend\Db\TableGateway\TableGatewayInterface;

class NewsTable
{
    private $tableGateway;

    public function __construct(TableGatewayInterface $tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function getNews($id)
    {
        $id = (int) $id;

        $rowset = $this->tableGateway->select(['news_id' => $id]);

        $row = $rowset->current();
        if (!$row) {
            throw new RuntimeException(sprintf(
                'Не найдена Новость с id: %d',
                $id
            ));
        }

        return $row;
    }

    public function saveNews(News $news)
    {
        $date = (new \DateTime($news->date))->format('Y-m-d');

        $data = [
            'date' => $date,
            'text' => $news->text,
            'title' => $news->title,
            'theme_id' => $news->theme_id
        ];

        $news_id = (int) $news->news_id;

        if ($news_id === 0) {
            $this->tableGateway->insert($data);
            return;
        }

        try {
            $this->getNews($news_id);
        } catch (RuntimeException $e) {
            throw new RuntimeException(sprintf(
                'Невозможно отредактировать Новость № %d; она не существует',
                $news_id
            ));
        }

        $this->tableGateway->update($data, ['news_id' => $news_id]);
    }

    public function deleteNews($id)
    {
        $this->tableGateway->delete(['news_id' => (int) $id]);
    }

    public function fetchAll()
    {
        $adapter = $this->tableGateway->getAdapter();
        $stmt = $adapter->query("SELECT n.news_id, n.date, n.theme_id, th.theme_title, n.text, n.title 
                                  FROM `news` n JOIN themes th ON th.theme_id = n.theme_id ORDER BY n.DATE DESC");
        $result = $stmt->execute();

        $newsArray = [];
        foreach ($result as $row) {
            $newsArray[] = $row;
        }

        return $newsArray;
    }
}