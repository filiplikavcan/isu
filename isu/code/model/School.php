<?php

class School extends DataObject
{
    private static $db = array(
        'Name' => 'Varchar(1000)',
        'Street' => 'Varchar(1000)',
        'EmployeesCount' => 'Decimal(5,1)',
        'Verified' => 'Boolean',
    );

    private static $has_one = array(
        'City' => 'City',
        'SchoolType' => 'SchoolType',
    );

    private static $summary_fields = array(
        'Name' => 'Name',
        'Street' => 'Street',
        'CityName' => 'City',
    );

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Main', new DropdownField('CityID', 'City', City::get()->map()));

        return $fields;
    }

    protected function getCityName()
    {
        return $this->City()->Name;
    }
}