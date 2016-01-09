<?php

class ArticlePage extends Page
{
    private static $db = array(
        'PublishDate' => 'Date'
    );

    private static $has_one = array(
        'File' => 'File'
    );

    private static $many_many = array(
        'RelatedArticles' => 'Page'
    );

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $date_field = DateField::create('PublishDate', 'Publish Date')->setConfig('showcalendar', true);
        $fields->addFieldToTab('Root.Main', $date_field, 'Content');
        $fields->addFieldToTab('Root.Main', new UploadField('File', 'File'));
        $fields->addFieldToTab('Root.Main', new TreeMultiselectField('RelatedArticles', 'Súvisiace články', 'ArticlePage'));

        return $fields;
    }

    public function getFileName()
    {
        $file = $this->File();

        if ($file instanceof File)
        {
            return strtoupper($file->getExtension());
        }
    }
}

class ArticlePage_Controller extends Page_Controller
{

}
