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
                COUNT(t.ID) AS Joined,
                GROUP_CONCAT(DISTINCT t.FacultyName ORDER BY t.FacultyName SEPARATOR '---' ) AS FacultiesRaw
            FROM
                University AS u
            LEFT JOIN
                UniversityStrikeRegistration AS t
            ON
                u.ID = t.UniversityID
                    AND
                t.Verified = 1
            GROUP BY
                u.ID
            ORDER BY
                COUNT(t.ID) > 0 DESC, u.Name");

        $result = new ArrayList();

        foreach($universities as $university)
        {
            $university['Faculties'] = new ArrayList();

            foreach (explode('---', $university['FacultiesRaw']) as $faculty)
            {
                $university['Faculties']->add(new ArrayData(array(
                    'Name' => $faculty,
                )));
            }

            $result->add($university);
        }

        return $result;
    }
}

class UniversityListPage_Controller extends Page_Controller
{
}
