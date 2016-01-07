<?php

class AjaxController extends Controller
{
    private static $allowed_actions = array (
        'schoolsByCity',
        'submit',
    );

    public function schoolsByCity(SS_HTTPRequest $request)
    {
        $result = array(
            'city_id' => $request->getVar('city_id'),
            'schools' => array(),
        );

        foreach (School::get()->filter(array('CityID' => $result['city_id']))->sort('Name ASC') as $school)
        {
            $result['schools'][] = array(
                'id' => $school->ID,
                'name' => $school->Name,
                'street' => $school->Street,
            );
        }

        return json_encode($result);
    }

    public function submit(SS_HTTPRequest $request)
    {
        $data = $request->postVar('data');

        print_r($data);
    }
}