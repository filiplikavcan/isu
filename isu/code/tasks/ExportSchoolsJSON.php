<?php

class ExportSchoolsJSON extends BuildTask
{
    protected $enabled = true;

    protected $title = 'Export Schools JSON';

    protected $description = 'Export JSON structure to a file';

    protected $region_codes = array();

    public function run($request)
    {
        $f = fopen(BASE_PATH . '/assets/schoolsByCity.json', 'w');

        $result = array();

        foreach (School::get()->sort('Name ASC') as $school)
        {
            if (empty($result[$school->CityID]))
            {
                $result[$school->CityID] = array();
            }

            $result[$school->CityID][] = array(
                'id' => $school->ID,
                'name' => $school->Name,
                'street' => $school->Street,
            );
        }

        fwrite($f, json_encode($result));
        fclose($f);

        echo 'Done.';
    }
}