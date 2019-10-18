<?php
/**
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2016 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application\Controller;

use Application\Model\NewsTable;
use Zend\Mvc\Controller\AbstractActionController;

class IndexController extends AbstractActionController
{
    private $table;

    public function __construct(NewsTable $table)
    {
        $this->table = $table;
    }

    public function indexAction()
    {
        // находим год и месяц
        $monthYear = $this->table->fetchMonthYear();

        $paginationUrl = [];
        if (!empty($this->params()->fromQuery('theme')))
        {
            $value = $this->params()->fromQuery('theme');
            $data = $this->table->fetchAll(
                'theme',
                $value,
                $this->params()->fromQuery('page')
            );
            $paginationUrl['theme'] = $value;

        } elseif (!empty($this->params()->fromQuery('ym')))
        {
            $value = $this->params()->fromQuery('ym');
            $data = $this->table->fetchAll(
                'ym',
                $value,
                $this->params()->fromQuery('page')
            );
            $paginationUrl['ym'] = $value;

        } else {
            $data = $this->table->fetchAll(
                null,
                null,
                $this->params()->fromQuery('page')
            );
        }

        $themes = $this->table->getThemesList();
        foreach ($data['news'] as &$one) {
            $length = strlen($one['text']);
            if ($length >= 255) {
                $one['text'] = mb_substr($one['text'], 0, 255) . '...';
            }
        }
        return [
            'monthYear' => $monthYear,
            'news' => $data['news'],
            'pagination' => $data['pagination'],
            'paginationUrl' => $paginationUrl,
            'themes' => $themes
        ];
    }

    public function showAction()
    {
        $id = (int) $this->params()->fromRoute('id', 0);
        $news = $this->table->fetchOne($id);

        return [
            'news' => $news
        ];
    }
}
