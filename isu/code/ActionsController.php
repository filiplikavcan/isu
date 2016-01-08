<?php

class ActionsController extends ContentController
{
    private static $allowed_actions = array(
        'verifyRegistration',
    );

    private static $url_handlers = array(
        '$Hash' => 'verifyRegistration',
    );

    public function verifyRegistration()
    {
        $registration = SchoolStrikeRegistration::get()->filter(array('VerificationHash' => $this->urlParams['Hash']))->last();

        if ($registration instanceof SchoolStrikeRegistration)
        {
            $registration->verify();

            Session::set('FlashMessage',
                $this->renderWith(array('FlashMessageRegistrationVerified'), array('Registration' => $registration))
            );
        }
        else
        {
            Session::set('FlashError',
                $this->renderWith(array('FlashErrorRegistrationNotVerified'))
            );
        }

        $this->redirect(BASE_URL);
    }
}