<?php
/**
 * Created by PhpStorm.
 * User: Boris Guzeev
 * Date: 16.10.2019
 * Time: 1:38
 */

namespace Admin;

use Admin\Model\NewsTable;
use Zend\Db\TableGateway\TableGateway;
use Zend\Db\Adapter\AdapterInterface;
use Zend\Db\ResultSet\ResultSet;

class Module
{
    public function getConfig()
    {
        return include __DIR__ . '/../config/module.config.php';
    }

    public function getServiceConfig() {
        return [
            'factories' => [
                NewsTable::class => function ($container) {
                    $tableGateway = $container->get(TableGateway::class);
                    $table = new Model\NewsTable($tableGateway);
                    return $table;
                },
                TableGateway::class => function ($container) {
                    $dbAdapter = $container->get(AdapterInterface::class);
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Model\News);
                    return new TableGateway('news', $dbAdapter, null, $resultSetPrototype);
                }
            ],
        ];
    }
}