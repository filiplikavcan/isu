<?php

class ImportSchools extends BuildTask
{
    protected $enabled = true;

    protected $title = 'Import Schools';

    protected $description = 'Imports Schools, School Types and Cities.';

    protected $region_codes = array();

    public function run($request)
    {
        $f = fopen(BASE_PATH . '/isu/data/schools.csv', 'r');

        DB::query("TRUNCATE TABLE School");

        while (($row = fgetcsv($f)) !== false)
        {
            $school = new School;

            $school->SchoolTypeID = $this->findOrCreateSchoolType($row[0])->ID;
            $school->CityID = $this->findOrCreateCity($row[2], $row[1])->ID;
            $school->Name = $row[3];
            $school->Street = $row[4];
            $school->EmployeesCount = $row[5];
            $school->Verified = true;

            $school->write();
        }

        echo 'Done.';
    }

    protected function findOrCreateSchoolType($name)
    {
        $school_type = SchoolType::get()->where(array('Name' => $name))->first();

        if (!($school_type instanceof SchoolType))
        {
            $school_type = new SchoolType;
            $school_type->Name = $name;
            $school_type->write();
        }

        return $school_type;
    }

    protected function findOrCreateCity($city_name, $region_name)
    {
        if ($this->regionExists($region_name))
        {
            $city = City::get()->where(array('Name' => $city_name))->first();

            if (!($city instanceof City))
            {
                $city = new City;
                $city->Name = $city_name;
                $city->Region = $this->getRegionCode($region_name);
                $city->Verified = true;
                $city->write();
            }
        }
        else
        {
            throw new Exception("Unknow region '$region_name' for city '$city_name");
        }

        return $city;
    }

    protected function getRegionCode($name)
    {
        $key = ucfirst($name);

        if (empty($this->region_codes[$key]))
        {
            $this->region_codes = array_flip(City::$regions);
        }

        return $this->region_codes[$key];
    }

    protected function regionExists($name)
    {
        return in_array(ucfirst($name), City::$regions);
    }
}