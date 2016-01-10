<?php

class ArticlePage extends Page
{
    private static $db = array(
        'PublishDate' => 'Date'
    );

    private static $many_many = array(
        'RelatedArticles' => 'Page',
        'Files' => 'ArticleFile'
    );

    protected $cached_size = null;

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $date_field = DateField::create('PublishDate', 'Publish Date')->setConfig('showcalendar', true);
        $fields->addFieldToTab('Root.Main', $date_field, 'Content');
        $fields->addFieldToTab('Root.Main', new UploadField('Files', 'Files'));
        $fields->addFieldToTab('Root.Main', new TreeMultiselectField('RelatedArticles', 'Súvisiace články', 'ArticlePage'));

        return $fields;
    }

    public function getIconName()
    {
        $files = $this->Files();
        $files_count = $files->count();

        if ($files_count > 0)
        {
            if ($files_count > 1)
            {
                return 'multiple';
            }
            else
            {
                $file = $files->first();
                return strtolower($file->getExtension());
            }
        }
        else
        {
            return 'other';
        }
    }

    public function getFileSize()
    {
        if (is_null($this->cached_size))
        {
            $files = $this->Files();
            $files_count = $files->count();

            if ($files_count > 0)
            {
                if ($files_count > 1)
                {
                    $this->cached_size = 'viac súborov';
                }
                else
                {
                    $file = $files->first();
                    $this->cached_size = $file->getSize();
                }
            }
            else
            {
                $this->cached_size = '';
            }
        }

        return $this->cached_size;
    }
}

class ArticlePage_Controller extends Page_Controller
{

}
