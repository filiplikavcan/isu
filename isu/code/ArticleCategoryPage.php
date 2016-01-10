<?php

class ArticleCategoryPage extends Page
{
    private static $db = array();

    private static $has_one = array(
        'Image' => 'Image'
    );

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Main', new UploadField('Image', 'Image'));

        return $fields;
    }
}

class ArticleCategoryPage_Controller extends Page_Controller
{

}
