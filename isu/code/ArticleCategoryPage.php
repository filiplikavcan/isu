<?php

class ArticleCategoryPage extends Page
{
    private static $db = array(
        'IsBlack' => 'Boolean',
    );

    private static $has_one = array(
        'Image' => 'Image'
    );

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Main', new CheckboxField('IsBlack', 'IsBlack'), 'Content');
        $fields->addFieldToTab('Root.Main', new UploadField('Image', 'Image'));

        return $fields;
    }

    public function getHolderClass()
    {
        return $this->IsBlack ? 'black' : '';
    }
}

class ArticleCategoryPage_Controller extends Page_Controller
{

}
