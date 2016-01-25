<?php

class SupportPage extends ArticlePage
{
    private static $db = array(
        'SideBarInfo' => 'HTMLText',
    );

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Main', new HtmlEditorField('SideBarInfo', 'SideBarInfo'), 'Content');

        return $fields;
    }
}

class SupportPage_Controller extends ArticlePage_Controller
{

}
