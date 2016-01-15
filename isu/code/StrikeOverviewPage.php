<?php

class StrikeOverviewPage extends Page
{
    public function getStatsByCity()
    {
        $cities = DB::query('
            SELECT
                c.Name AS CityName,
                c.Region AS RegionCode,
                SUM(r.JoinedEmployeesCount) AS JoinedEmployeesCount,
                COUNT(*) AS SchoolsCount
            FROM
                SchoolStrikeRegistration AS r
            LEFT JOIN
                School AS s
            ON
                r.SchoolID = s.ID
            INNER JOIN
                City AS c
            ON
                s.CityID = c.ID
            GROUP BY
            	c.Region, c.ID
            ORDER BY
                c.Region, c.Name');

        $result = array();

        foreach ($cities as $city)
        {
            if (empty($result[$city['RegionCode']]))
            {
                $result[$city['RegionCode']] = array(
                    'RegionName' => City::$regions[$city['RegionCode']],
                    'Cities' => new ArrayList(),
                );
            }

            $result[$city['RegionCode']]['Cities']->add(new ArrayData($city));
        }

        return new ArrayList($result);
    }
}

class StrikeOverviewPage_Controller extends Page_Controller
{

}
