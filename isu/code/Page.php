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
        Requirements::javascript("//cdn.leafletjs.com/leaflet/v0.7.7/leaflet.js");
        Requirements::javascript("https://maps.googleapis.com/maps/api/js?key=AIzaSyBGXPpTwHUFT1gbrHi7ppVqSjQHSXFMrOQ");
//        Requirements::javascript($this->ThemeDir() . "/js/leaflet-heat.js");
//        Requirements::javascript($this->ThemeDir() . "/js/map-slovakia.js");
        Requirements::javascript($this->ThemeDir() . "/js/main.js");

        Requirements::css("//cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css");
//        Requirements::css("//cdn.leafletjs.com/leaflet/v0.7.7/leaflet.css");

        if (false && Director::isDev())
        {
            Requirements::css($this->ThemeDir() . "/css/main.less");
        }
        else
        {
            Requirements::css($this->ThemeDir() . '/css/main.css');
        }
    }

    public function objectsToUpdate($context)
    {
        return Page::get();
    }

    public function objectsToDelete($context)
    {
        return Page::get();
    }

    public function getArticleCategories()
    {
        return ArticleCategoryPage::get();
    }

    public function getMediaLinks()
    {
        return MediaLink::get();
    }

    public function getFeaturedButtonTitle()
    {
        return Homepage::get()->first()->FeaturedButtonTitle;
    }

    public function getRegions()
    {
        return Region::get();
    }

    public function getStrikeMapPage()
    {
        return StrikeMapPage::get()->first();
    }

    public function getFeaturedPage()
    {
        $homepage = Homepage::get()->first();
        $featured_page = $homepage->FeaturedPage();

        if ($featured_page instanceof Page)
        {
            return $featured_page;
        }
        else
        {
            return null;
        }
    }

    public function getStrikeCounter()
    {
        $counts = DB::query('SELECT SUM(JoinedEmployeesCount) AS PeopleCount, COUNT(*) AS SchoolsCount FROM SchoolStrikeRegistration')->record();

        return new ArrayData(array(
            'PeopleCount' => $counts['PeopleCount'],
            'SchoolsCount' => $counts['SchoolsCount'],
        ));
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
