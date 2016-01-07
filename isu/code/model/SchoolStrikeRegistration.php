<?php

class SchoolStrikeRegistration extends DataObject
{
    private static $db = array(
        'EmployeesCount' => 'Varchar',
        'JoinedEmployeesCount' => 'Varchar',
        'ContactName' => 'Varchar',
        'ContactSurname' => 'Varchar',
        'ContactPosition' => 'Varchar',
        'ContactEmail' => 'Varchar',
        'ContactPhone' => 'Varchar',
        'Note' => 'Text',
    );

    private static $has_one = array(
        'School' => 'School',
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