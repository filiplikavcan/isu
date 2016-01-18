<?php

class StrikeMapPage extends Page
{
    private static $db = array();

    private static $has_one = array();

    public function getSchoolMarkersJSON()
    {
        $result = array();

        foreach (SchoolStrikeRegistration::get() as $registration)
        {
            $result[] = array(
                'address' => $registration->SchoolStreet . ', ' . $registration->getCityName(),
                'name' => $registration->getSchoolName(),
                'lat' => $registration->Lat,
                'lng' => $registration->Lng
            );
        }

        return json_encode($result);
    }

    public function getLastRegistrationDate()
    {
        return SchoolStrikeRegistration::get()->sort('LastEdited')->last()->LastEdited;
    }
}

class StrikeMapPage_Controller extends Page_Controller
{

}
