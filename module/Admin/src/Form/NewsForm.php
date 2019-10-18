<?php
/**
 * Created by PhpStorm.
 * User: Boris Guzeev
 * Date: 17.10.2019
 * Time: 0:13
 */

namespace Admin\Form;


use Admin\Model\ThemeTable;
use Zend\Form\Form;

class NewsForm extends Form
{
    public function __construct($name = null)
    {
        parent::__construct('news');

        $this->add([
            'name' => 'news_id',
            'type' => 'hidden'
        ]);
        $this->add([
            'name' => 'date',
            'type' => 'text',
            'options' => [
                'label' => 'Дата'
            ]
        ]);
        $this->add([
            'name' => 'text',
            'type' => 'Zend\Form\Element\Textarea',
            'options' => [
                'label' => 'Текст'
            ]
        ]);
        $this->add([
            'name' => 'title',
            'type' => 'text',
            'options' => [
                'label' => 'Название'
            ]
        ]);
        $this->add([
            'name' => 'theme_id',
            'type' => 'Zend\Form\Element\Select',
            'options' => [
                'label' => 'Тема',
                'value_options' => [
                    '1' => 'Наука',
                    '2' => 'Спорт',
                    '3' => 'Интернет',
                    '4' => 'Авто',
                    '5' => 'Глямур',
                    '6' => 'Искусство',
                ]
            ]
        ]);
        $this->add([
            'name' => 'submit',
            'type' => 'submit',
            'attributes' => [
                'id' => 'submitButton'
            ]
        ]);
    }
}