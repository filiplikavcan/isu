<?php

class UniversityListPage extends Page
{
    private static $db = array();

    private static $has_one = array();

    public function getUniversities()
    {
        $universities = DB::query("
            SELECT
                u.Name,
                COUNT(t.ID) AS Joined
            FROM
                University AS u
            LEFT JOIN
                UniversityStrikeRegistration AS t
            ON
                u.ID = t.UniversityID
            GROUP BY
                u.ID
            ORDER BY
                COUNT(t.ID) > 0 DESC, u.Name");

        $result = new ArrayList();

        foreach($universities as $university)
        {
            $result->add($university);
        }

        return $result;
    }
}

class UniversityListPage_Controller extends Page_Controller
{
}
