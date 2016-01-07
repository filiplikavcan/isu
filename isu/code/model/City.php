<?php

class City extends DataObject
{
    private static $db = array(
        'Name' => 'Varchar',
        'Region' => 'Varchar(2)',
    );

    private static $has_many = array(
        'Schools' => 'School',
    );

    private static $summary_fields = array(
        'Name' => 'Name',
        'RegionName' => 'Region'
    );

    public static $regions = array(
        'bl' => 'Bratislavský',
        'ta' => 'Trnavský',
        'tc' => 'Trenčiansky',
        'ni' => 'Nitriansky',
        'zi' => 'Žilinský',
        'bc' => 'Banskobystrický',
        'pv' => 'Prešovský',
        'ki' => 'Košický',
    );

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Main', new DropdownField('Region', 'CiRegionty', self::regions()));

        return $fields;
    }

    public static function regions()
    {
        return self::$regions;
    }

    public static function all()
    {
        return self::get()->sort('Name ASC');
    }

    protected function getRegionName()
    {
        return self::regions()[$this->Region];
    }
}