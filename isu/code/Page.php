<?php

class Page extends SiteTree
{

    private static $db = array();

    private static $has_one = array();
}

class Page_Controller extends ContentController
{
    private static $allowed_actions = array(
        'SchoolStrikeForm',
        'SendSchoolStrikeForm',
        'edit',
        'back'
    );

    /**
     * @var SchoolStrikeRegistration
     */
    protected $registration;

    public function init()
    {
        parent::init();

        if (!empty($this->urlParams['Action']) && $this->urlParams['Action'] == 'edit')
        {
            $update_hash = $this->request->getVar('h');

            if (!empty($update_hash))
            {
                $this->registration = SchoolStrikeRegistration::get()->filter(array('UpdateHash' => $update_hash))->last();

                if (!$this->registration instanceof SchoolStrikeRegistration)
                {
                    Session::set('FlashError',
                        $this->renderWith(array('FlashErrorRegistrationUpdateHashInvalid'))
                    );

                    $this->redirect($this->Link('edit'));
                }
            }
        }

        Requirements::javascript("//code.jquery.com/jquery-1.11.0.min.js");
        Requirements::javascript("//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js");
        Requirements::javascript("//cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js");
        Requirements::javascript("//cdn.leafletjs.com/leaflet/v0.7.7/leaflet.js");
        Requirements::javascript("https://maps.googleapis.com/maps/api/js?key=AIzaSyBGXPpTwHUFT1gbrHi7ppVqSjQHSXFMrOQ");
//        Requirements::javascript($this->ThemeDir() . "/js/leaflet-heat.js");
//        Requirements::javascript($this->ThemeDir() . "/js/map-slovakia.js");
        Requirements::javascript($this->ThemeDir() . "/js/school_strike_form.js");
        Requirements::javascript($this->ThemeDir() . "/js/university_strike_form.js");
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

    public function getPeopleCount()
    {
        return Supporter::get()->filter(array('Verified' => true))->count();
    }

    public function back()
    {
        $this->redirect(BASE_URL);
    }

    public function UniversityStrikeForm()
    {
        return new UniversityStrikeForm($this);
    }

    public function SchoolStrikeCreateRegistrationForm()
    {
        return new SchoolStrikeForm($this);
    }

    public function SchoolStrikeUpdateRegistrationForm()
    {
        return new SchoolStrikeForm($this, true, $this->registration);
    }

    public function getUpdateHash()
    {
        return $this->request->getVar('hash');
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
        return ArticleCategoryPage::get()->filter(array('ShowInMenus' => true));
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

    public function getUniversityListPage()
    {
        return UniversityListPage::get()->first();
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
        $counts = DB::query("
            SELECT
                COUNT(DISTINCT UniversityID) AS UniversitiesCount,
                COUNT(*) AS UniversityRegistrationsCount
            FROM
                UniversityStrikeRegistration
            WHERE
                Verified = 1")->record();

        return new ArrayData(array(
            'UniversitiesCount' => $counts['UniversitiesCount'],
            'UniversityRegistrationsCount' => $counts['UniversityRegistrationsCount'],
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


    public function getVideo($num = 5) {

        $apiKey = "AIzaSyBKJw43RbCaXEP4B4XRIkmVf3f3EHiK6KI";
        $channelId = "UCj0iPtfmb9gnDtTTeoaG3_w";

        $link = "https://www.googleapis.com/youtube/v3/search?channelId=".$channelId."&order=date&maxResults=".$num."&key=".$apiKey."&part=snippet,id";

        //$video = file_get_contents($link);

        //$video = json_decode($video, true);

        //return new ArrayList($video["items"]);

        return new ArrayList();

    }
}
