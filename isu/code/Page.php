<?php

class Page extends SiteTree
{

    private static $db = array();

    private static $has_one = array();
}

class Page_Controller extends ContentController
{
    public function init()
    {
        parent::init();

        Requirements::javascript("//code.jquery.com/jquery-1.11.0.min.js");
        Requirements::javascript("//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js");
        Requirements::javascript("//cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js");
        //Requirements::javascript("//cdn.leafletjs.com/leaflet/v0.7.7/leaflet.js");
        //Requirements::javascript("//maps.google.com/maps/api/js?v=3.2&sensor=false&language=sk&region=sk");
        //Requirements::javascript($this->ThemeDir() . "/js/map-slovakia.js");
        Requirements::javascript($this->ThemeDir() . "/js/main.js");

        Requirements::css("//cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css");
        //Requirements::css("//cdn.leafletjs.com/leaflet/v0.7.7/leaflet.css");

        if (Director::isDev())
        {
            Requirements::css($this->ThemeDir() . "/css/main.less");
        }
        else
        {
            Requirements::css($this->ThemeDir() . '/css/main.css');
        }
    }

    public function getArticleCategories()
    {
        return ArticleCategoryPage::get();
    }

    public function IsFlashError()
    {
        return Session::get('FlashError');
    }

    public function IsFlashMessage()
    {
        return Session::get('FlashMessage');
    }

    public function getFlashError()
    {
        $error = Session::get('FlashError');
        Session::clear('FlashError');

        return $error;
    }

    public function getFlashMessage()
    {
        $message = Session::get('FlashMessage');
        Session::clear('FlashMessage');

        return $message;
    }
}
