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

    public static function store($data)
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

        $registration = new self;
        $registration->SchoolID = $school->ID;
        $registration->SchoolStreet = $data['SchoolStreet'];
        $registration->EmployeesCount = $data['EmployeesCount'];
        $registration->JoinedEmployeesCount = $data['JoinedEmployeesCount'];
        $registration->ContactName = $data['ContactName'];
        $registration->ContactSurname = $data['ContactSurname'];
        $registration->ContactPosition = $data['ContactPosition'];
        $registration->ContactEmail = $data['ContactEmail'];
        $registration->ContactPhone = $data['ContactPhone'];
        $registration->Note = $data['Note'];

        $registration->write();
    }

    private function sendEmail($recipients, $subject, $body)
    {
        $mail = new PHPMailer;

        $mail->isSMTP();
        $mail->Host = SMTPMAILER_SMTP_SERVER_ADDRESS;
        $mail->SMTPAuth = SMTPMAILER_DO_AUTHENTICATE;
        $mail->Username = SMTPMAILER_USERNAME;
        $mail->Password = SMTPMAILER_PASSWORD;
        $mail->SMTPSecure = SMTPMAILER_USE_SECURE_CONNECTION;
        $mail->Port = SMTPMAILER_SMTP_SERVER_PORT;

        $config = SiteConfig::current_site_config();

        $mail->From = $config->AdminEmail;
        $mail->FromName = $config->AdminEmail;
        $mail->CharSet = 'UTF-8';

        foreach ($recipients as $recipient)
        {
            $mail->addAddress($recipient);
        }

        $mail->isHTML(false);

        $mail->Subject = $subject;
        $mail->Body = $body;

        $mail->Send();
    }
}