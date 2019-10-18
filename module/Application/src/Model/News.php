<?php
namespace Application\Model;

class News
{
    public $news_id;
    public $date;
    public $text;
    public $title;
    public $theme_id;

    public function exchangeArray($data) {
        $this->news_id = (!empty($data['news_id'])) ? $data['news_id'] : null;
        $this->date = (!empty($data['date'])) ? $data['date'] : null;
        $this->text = (!empty($data['text'])) ? $data['text'] : null;
        $this->title = (!empty($data['title'])) ? $data['title'] : null;
        $this->theme_id = (!empty($data['theme_id'])) ? $data['theme_id'] : null;
    }
}