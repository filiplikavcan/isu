<?php

class MediaLink extends DataObject
{
    private static $db = array(
        'Link' => 'Varchar(1000)',
        'Title' => 'Varchar(1000)',
        'Medium' => 'Varchar(1000)',
        'Date' => 'Date'
    );

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $date_field = DateField::create('Date', 'Date')->setConfig('showcalendar', true);
        $fields->addFieldToTab('Root.Main', $date_field);

        return $fields;
    }
}