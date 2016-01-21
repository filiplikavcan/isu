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
    public function getAddressesWithoutGPS()
    {
        if (Member::currentUserID())
        {
            $addresses = DB::query("
                SELECT
                    r.ID,
                    CONCAT(r.SchoolStreet, ', ', c.Name, ', Slovensko') AS Address
                    FROM
                    SchoolStrikeRegistration AS r
                    INNER JOIN School AS s ON r.SchoolID = s.ID
                    INNER JOIN City AS c ON s.CityID = c.ID
                    WHERE
                        r.Lat IS NULL OR r.Lng IS NULL OR r.Lat = '' OR r.Lng = ''");

            $result = new ArrayList();

            foreach ($addresses as $address)
            {
                $result->add(new ArrayData(array(
                    'ID' => $address['ID'],
                    'Address' => $address['Address'],
                )));
            }

            return $result;
        }
        else
        {
            return null;
        }
    }
}