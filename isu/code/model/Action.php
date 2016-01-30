<?php

class Action extends DataObject
{
    private static $db = array(
        'Published' => 'Boolean',
        'Title' => 'Varchar(1000)',
        'Description' => 'Text',
        'City' => 'Varchar',
        'Place' => 'Varchar(1000)',
        'Link' => 'Varchar(1000)',
        'Date' => 'Date',
        'TimeFrom' => 'Varchar(5)',
        'TimeTo' => 'Varchar(5)',
        'Sort' => 'Int',
    );

    private static $has_one = array(
        'Group' => 'ActionGroup'
    );

    private static $summary_fields = array(
        'Title' => 'Title',
        'City' => 'City',
        'Place' => 'Place',
        'Date' => 'Date',
        'TimeFrom' => 'TimeFrom',
        'Published' => 'Published',
    );

    private static $last_time = array();

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $date_field = DateField::create('Date', 'Date')->setConfig('showcalendar', true);
        $fields->addFieldToTab('Root.Main', $date_field, 'TimeFrom');

        return $fields;
    }

    public function onAfterDuplicate()
    {
        $this->Published = false;
        $this->write();
    }

    public function IsTimeChange()
    {
        $key = (empty($this->GroupID) ? '-' : $this->GroupID) . $this->Date;

        $result = empty(self::$last_time[$key]) || self::$last_time[$key] != $this->TimeFrom;
        self::$last_time[$key] = $this->TimeFrom;
        return $result;
    }
}