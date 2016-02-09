<?php

class UniversityActionsController extends ContentController
{
    private static $allowed_actions = array(
        'verifyRegistration',
    );

    private static $url_handlers = array(
        '$Hash' => 'verifyRegistration',
    );

    public function verifyRegistration()
    {
        $registration = UniversityStrikeRegistration::get()->filter(array('VerificationHash' => $this->urlParams['Hash']))->last();

        if ($registration instanceof UniversityStrikeRegistration)
        {
            $registration->verify();
        }

        Session::set('FlashMessage',
            $this->renderWith(array('FlashMessageUniversityRegistrationVerified'), array('Registration' => $registration))
        );

        $this->redirect(BASE_URL . '/home/message');
    }
}