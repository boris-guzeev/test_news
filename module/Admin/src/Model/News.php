<?php
namespace Admin\Model;

use Zend\Filter\StringTrim;
use Zend\Filter\StripTags;
use Zend\InputFilter\InputFilter;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;
use Zend\Validator\StringLength;

class News implements InputFilterAwareInterface
{
    public $news_id;
    public $date;
    public $text;
    public $title;
    public $theme_id;

    private $inputFilter;

    public function exchangeArray($data) {
        $this->news_id = (!empty($data['news_id'])) ? $data['news_id'] : null;
        $this->date = (!empty($data['date'])) ? $data['date'] : null;
        $this->text = (!empty($data['text'])) ? $data['text'] : null;
        $this->title = (!empty($data['title'])) ? $data['title'] : null;
        $this->theme_id = (!empty($data['theme_id'])) ? $data['theme_id'] : null;
    }

    public function getArrayCopy()
    {
        return [
            'news_id'   => $this->news_id,
            'date'      => date("d.m.Y", strtotime($this->date)),
            'text'      => $this->text,
            'title'     => $this->title,
            'theme_id'  => $this->theme_id
        ];
    }

    public function setInputFilter(InputFilterInterface $inputFilter)
    {
        throw new \DomainException(sprintf(
            '%s не позволяет добавлять другого фильтра',
            __CLASS__
        ));
    }
    public function getInputFilter()
    {
        if ($this->inputFilter) {
            return $this->inputFilter;
        }

        $inputFilter = new InputFilter();

        $inputFilter->add([
            'name' => 'text',
            'required' => true,
            'filters' => [
                ['name' => StripTags::class],
                ['name' => StringTrim::class],
            ]
        ]);
        $inputFilter->add([
            'name' => 'date',
            'required' => true,
            'filters' => [
                ['name' => StripTags::class],
                ['name' => StringTrim::class],
            ]
        ]);
        $inputFilter->add([
            'name' => 'title',
            'required' => true,
            'filters' => [
                ['name' => StripTags::class],
                ['name' => StringTrim::class],
            ],
            'validators' => [
                [
                    'name' => StringLength::class,
                    'options' => [
                        'encoding' => 'UTF-8',
                        'min' => 1,
                        'max' => 255,
                    ],
                ],
            ],
        ]);

        $this->inputFilter = $inputFilter;
        return $this->inputFilter;
    }
}