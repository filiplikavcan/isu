<?php

class SchoolStrikeCityField extends DropdownField
{
    /**
     * @var DataList
     */
    protected $cities = null;

    public function setCities(DataList $cities) {
        $this->setSource($cities->map());
        $this->cities = $cities;

        return $this;
    }

    public function customise($data)
    {
        $city_regions = $this->cities->map('ID', 'Region');

        foreach ($data['Options'] as $option)
        {
            $city_id = $option->getField('Value');

            if (!empty($city_id))
            {
                $option->setField('Region', $city_regions[$city_id]);
            }
        }

        return parent::customise($data);
    }
}