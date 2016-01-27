<?php

class AjaxController extends Controller
{
    private static $allowed_actions = array (
        'schoolsByCity',
        'submit',
        'requestUpdate',
        'addToNewsletter',
    );

    public function renderSupporterForm()
    {

    }

    public function schoolsByCity(SS_HTTPRequest $request)
    {
        $result = array(
            'city_id' => $request->getVar('city_id'),
            'schools' => array(),
        );

        if (Director::is_ajax())
        {
            foreach (School::get()->filter(array('CityID' => $result['city_id'], 'Verified' => true))->sort('Name ASC') as $school)
            {
                $result['schools'][] = array(
                    'id' => $school->ID,
                    'name' => $school->Name,
                    'street' => $school->Street,
                );
            }
        }

        return json_encode($result);
    }

    public function submit(SS_HTTPRequest $request)
    {
        if (Director::is_ajax())
        {
            return json_encode(array(
                'success' => SchoolStrikeRegistration::store($request->postVar('data')),
            ));
        }
    }

    public function requestUpdate(SS_HTTPRequest $request)
    {
        if (Director::is_ajax())
        {
            SchoolStrikeRegistration::requestUpdate($request->postVar('email'));

            return json_encode(array(
                'success' => true,
            ));
        }
    }

    public function addToNewsletter(SS_HTTPRequest $request)
    {
        $mailin = new Sendinblue\Mailin("https://api.sendinblue.com/v2.0", SENDINBLUE_API_KEY);

        $email = $request->getVar('email');

        $data = array(
            'email' => $email,
            'listid' => array(2),
        );

        $response = $mailin->create_update_user($data);

        if ($response['code'] == 'success')
        {
            (new IsuEmail())->sendEmail(
                array($email),
                'www.isu.sk: Zasielanie noviniek',
                $this->renderWith(array('IsuNewsletterSignin'), array('Email' => $email))
            );

            Session::set('FlashMessage',
                $this->renderWith(array('FlashMessageNewsletterRegistration'), array('Email' => $email))
            );
        }

        return json_encode($response);
    }
}