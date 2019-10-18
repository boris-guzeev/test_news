<?php

namespace Application\Model;


use Zend\Db\TableGateway\TableGatewayInterface;

class NewsTable
{
    private $tableGateway;

    public function __construct(TableGatewayInterface $tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function getThemesList()
    {
        $adapter = $this->tableGateway->getAdapter();
        $stmt = $adapter->query("SELECT th.theme_id, th.theme_title, COUNT(*) 'quantity'
                                 FROM themes th 
                                 JOIN news n ON n.theme_id = th.theme_id
                                 GROUP BY th.theme_id
                                 ");
        $result = $stmt->execute();

        $themesArray = [];
        foreach ($result as $row) {
            $themesArray[] = $row;
        }

        return $themesArray;
    }

    public function fetchOne($id) {
        $adapter = $this->tableGateway->getAdapter();
        $query = "SELECT n.title, n.date, th.theme_title, n.text
                  FROM news n 
                  JOIN themes th ON th.theme_id = n.theme_id
                  WHERE n.news_id = ?
                  ";
        $stmt = $adapter->query($query);
        $result = $stmt->execute([$id]);

        return $result->current();
    }

    public function fetchAll($param = null, $value = null, $pageParam = null)
    {
        $adapter = $this->tableGateway->getAdapter();

        if ($param == 'ym') {
            $where = "WHERE n.date LIKE '$value%'";
        } elseif($param == 'theme') {
            $value = intval($value);
            $where = "WHERE n.theme_id = $value";
        } else {
            $where = '';
        }

        $countSql = "SELECT n.news_id, n.date, n.theme_id, th.theme_title, n.text, n.title 
                                 FROM `news` n 
                                 JOIN themes th ON th.theme_id = n.theme_id
                                 $where
                                 ORDER BY n.DATE DESC";
        $stmt = $adapter->query($countSql);
        $result = $stmt->execute();

        $rowsCount = $result->count();
        $newsPerPage = 5;
        $pagesQuantity = ceil($rowsCount / $newsPerPage);
        $page = 1;

        if (!empty($pageParam)) {
            $page = intval($pageParam);
        }
        $startFrom = ($page - 1) * $newsPerPage;

        $querySql = "SELECT n.news_id, n.date, n.theme_id, th.theme_title, n.text, n.title 
                                 FROM `news` n 
                                 JOIN themes th ON th.theme_id = n.theme_id
                                 $where
                                 ORDER BY n.DATE DESC
                                 LIMIT $startFrom, $newsPerPage
                                 ";
        $stmt = $adapter->query($querySql);
        $result = $stmt->execute();

        $newsArray = [];
        foreach ($result as $row) {
            $newsArray[] = $row;
        }

        return [
            'news' => $newsArray,
            'pagination' => [
                'currentPage' => $page,
                'pagesQuantity' => $pagesQuantity,
                'rowsCount' => $rowsCount
            ]
        ];
    }

    public function fetchMonthYear()
    {
        $adapter = $this->tableGateway->getAdapter();
        $stmt = $adapter->query("SELECT CONCAT(YEAR(n.`date`),'-', DATE_FORMAT(n.`date`, '%m')) 'ym', MONTHNAME(n.`date`) 'month', YEAR(n.`date`) 'year', COUNT(*) 'quantity' 
                                  FROM news n GROUP BY MONTH(n.`date`), YEAR(n.`date`) 
                                  ORDER BY `year` DESC");
        $result = $stmt->execute();

        $newsArray = [];
        foreach ($result as $row) {
            $newsArray[$row['year']][] = $row;
        }

        return $newsArray;
    }
}