<?php

class SchoolStrikeRegistration extends DataObject
{
    private static $db = array(
        'SchoolStreet' => 'Varchar',
        'EmployeesCount' => 'Varchar',
        'JoinedEmployeesCount' => 'Varchar',
        'ContactName' => 'Varchar',
        'ContactSurname' => 'Varchar',
        'ContactPosition' => 'Varchar',
        'ContactEmail' => 'Varchar',
        'ContactPhone' => 'Varchar',
        'VerificationHash' => 'Varchar',
        'SchoolClosed' => 'Varchar(10)',
        'UpdateHash' => 'Varchar',
        'Note' => 'Text',
    );

    private static $has_one = array(
        'School' => 'School',
    );

    private static $summary_fields = array(
        'Name' => 'Name',
        'Street' => 'Street',
        'CityName' => 'City',
    );

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Main', new DropdownField('CityID', 'City', City::get()->map()));

        return $fields;
    }

    protected function getCityName()
    {
        return $this->City()->Name;
    }

    public static function requestUpdate($email)
    {
        $registration = self::get()->filter(array('ContactEmail' => $email))->last();

        if ($registration instanceof SchoolStrikeRegistration)
        {
            $registration->sendUpdateLinkEmail();
        }
        else
        {
            $registration = new SchoolStrikeRegistration();
        }

        Session::set('FlashMessage',
            $registration->renderWith(array('FlashMessageRegistrationUpdateRequest'))
        );
    }

    public function verify()
    {
        $this->VerificationHash = null;
        $this->write();
    }

    public static function store($data)
    {
        $update_hash = empty($data['UpdateHash']) ? '' : $data['UpdateHash'];

        if (empty($update_hash))
        {


            $registration = new self;
            $registration->SchoolID = self::findOrCreateSchool($data)->ID;
            $registration->SchoolStreet = $data['SchoolStreet'];
        }
        else
        {
            $registration = self::get()->filter(array('UpdateHash' => $update_hash))->last();
        }

        if ($registration instanceof SchoolStrikeRegistration)
        {
            $action = $registration->isInDB() ? 'Updated' : 'Created';

            $registration->SchoolClosed = $data['SchoolClosed'];
            $registration->EmployeesCount = $data['EmployeesCount'];
            $registration->JoinedEmployeesCount = $data['JoinedEmployeesCount'];
            $registration->ContactName = $data['ContactName'];
            $registration->ContactSurname = $data['ContactSurname'];
            $registration->ContactPosition = $data['ContactPosition'];
            $registration->ContactEmail = $data['ContactEmail'];
            $registration->ContactPhone = $data['ContactPhone'];
            $registration->Note = $data['Note'];
            $registration->UpdateHash = null;

            $registration->write();

            if ($action == 'Created')
            {

                $registration->sendRegistrationCreateEmail();
            }
            else
            {
                $registration->sendRegistrationUpdateEmail();
            }

            Session::set('FlashMessage',
                $registration->renderWith(array('FlashMessageRegistration' . $action))
            );
        }

        return $registration instanceof SchoolStrikeRegistration;
    }

    protected static function findOrCreateSchool($data)
    {
        if (!empty($data['School']))
        {
            $school = School::get()->byID($data['School']);
        }
        else
        {
            if (!empty($data['City']))
            {
                $city = City::get()->byID($data['City']);
            }
            else
            {
                $city = new City;
                $city->Name = $data['CityRaw'];
                $city->Region = $data['Region'];
                $city->write();
            }

            $school = new School();

            $school->Name = $data['SchoolRaw'];
            $school->Street = $data['SchoolStreet'];
            $school->CityID = $city->ID;

            $school->write();
        }

        return $school;
    }

    public function sendRegistrationCreateEmail()
    {
        $this->sendEmail(
            array($this->ContactEmail),
            'www.isu.sk: Registrácia do štrajku',
            $this->renderWith(array('SchoolStrikeCreateRegistration'), array('Registration' => $this))
        );
    }

    public function sendRegistrationUpdateEmail()
    {
        $this->sendEmail(
            array($this->ContactEmail),
            'www.isu.sk: Aktualizácia údajov registrácie',
            $this->renderWith(array('SchoolStrikeUpdateRegistration'), array('Registration' => $this))
        );
    }

    public function sendUpdateLinkEmail()
    {
        $this->sendEmail(
            array($this->ContactEmail),
            'www.isu.sk: Aktualizácia údajov registrácie',
            $this->renderWith(array('SchoolStrikeUpdateLink'), array('Registration' => $this))
        );
    }

    public function EmailSalutation($prefix)
    {
        return implode(' ', array(
            $prefix,
            'p.',
            $this->ContactName,
            $this->ContactSurname
        ));
    }

    public function getVerificationLink()
    {
        return MAIL_BASE_URL . '/v/' . $this->generateVerificationHash();
    }

    public function getUpdateLink()
    {
        return MAIL_BASE_URL . '/home/edit/?h=' . $this->generateUpdateHash();
    }

    protected function generateVerificationHash()
    {
        if (empty($this->VerificationHash))
        {
            $this->VerificationHash = $this->generateHash();
            $this->write();
        }

        return $this->VerificationHash;
    }

    protected function generateUpdateHash()
    {
        if (empty($this->UpdateHash))
        {
            $this->UpdateHash = $this->generateHash();
            $this->write();
        }

        return $this->UpdateHash;
    }

    protected function generateHash()
    {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $characters_length = strlen($characters);
        $random_string = '';

        for ($i = 0; $i < 120; $i++)
        {
            $random_string .= $characters[rand(0, $characters_length - 1)];
        }

        return sha1($random_string);
    }

    protected function sendEmail($recipients, $subject, $body)
    {
        $email = new IsuEmail();
        $email->sendEmail($recipients, $subject, $body);
    }
}