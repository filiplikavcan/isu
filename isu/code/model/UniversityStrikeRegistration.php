<?php

class UniversityStrikeRegistration extends DataObject
{
    private static $db = array(
        'ContactName' => 'Varchar',
        'ContactSurname' => 'Varchar',
        'ContactEmail' => 'Varchar',
        'ContactPhone' => 'Varchar',
        'FacultyName' => 'Varchar(1000)',
        'VerificationHash' => 'Varchar',
        'Verified' => 'Boolean',
    );

    private static $has_one = array(
        'University' => 'University',
    );

    private static $default_sort = 'LastEdited DESC';

    private static $summary_fields = array(
        'LastEdited' => 'Čas aktualizácie',
        'ContactName' => 'Meno',
        'ContactSurname' => 'Priezvisko',
        'ContactEmail' => 'Email',
        'ContactPhone' => 'Telefón',
        'FacultyName' => 'Fakulta/Pracovisko',
        'UniversityName' => 'VŠ',
        'Verified' => 'Overené',
    );

    static $searchable_fields = array (

        'ContactName' => array('title' => 'Meno'),
        'ContactSurname' => array('title' => 'Priezvisko'),
        'ContactEmail' => array('title' => 'Email'),
        'ContactPhone' => array('title' => 'Telefón'),
        'FacultyName' => array('title' => 'Fakulta/Pracovisko'),
        'UniversityID' => array('title'=>'VŠ')
    );

    public function VerifiedHumanized()
    {
        return $this->Verified ? 'Áno' : 'Nie';
    }

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Main', new DropdownField('UniversityID', 'University', University::get()->map()));

        return $fields;
    }

    public function verify()
    {
        $this->VerificationHash = null;
        $this->write();
    }

    public function getUniversityName()
    {
        $university = $this->University();

        if ($university instanceof University)
        {
            return $university->Name;
        }
        else
        {
            return '';
        }
    }

    public static function store($data)
    {
        $registration = new self;

        if ($registration instanceof UniversityStrikeRegistration)
        {
            $registration->ContactName = $data['ContactName'];
            $registration->ContactSurname = $data['ContactSurname'];
            $registration->ContactPosition = $data['ContactPosition'];
            $registration->ContactEmail = $data['ContactEmail'];
            $registration->ContactPhone = $data['ContactPhone'];
            $registration->UniversityID = $data['University'];
            $registration->FacultyName = $data['FacultyName'];

            $registration->write();

            $registration->sendRegistrationCreateEmail();
            $registration->sendSlackNotification();

            Session::set('FlashMessage',
                $registration->renderWith(array('FlashMessageUniversityRegistrationCreated'))
            );
        }

        return $registration instanceof UniversityStrikeRegistration;
    }

    public function sendSlackNotification()
    {
        $university = $this->University();

        $message = array(
            '*Gaudeamus Igitur. Bol zaregistrovaný nový VŠ učiteľ!*',
            $this->ContactName . ', ' . $this->ContactSurname . ', ' . $this->ContactEmail . ', ' . $this->ContactPhone,
        );

        if ($university instanceof University)
        {
            $message[] = $university->Name . ', ' . $this->FacultyName;
        }

        $content = array(
            'username' => 'všeweb',
            'channel' => '#registracie-uni',
            'mrkdwn' => true,
            'icon_emoji' => ':v:',
            'text' => implode("\n", $message),
        );


        $opts = array(
            'http'=>array(
                'method'=>"POST",
                'content' => 'payload=' . json_encode($content),
                'timeout' => 3,
                'header' => "Content-type: application/x-www-form-urlencoded\r\n"
            )
        );

        $context = stream_context_create($opts);

        $fp = fopen('https://hooks.slack.com/services/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', 'r', false, $context);
        fclose($fp);
    }

    public function sendRegistrationCreateEmail()
    {
        $this->sendEmail(
            array($this->ContactEmail),
            'www.isu.sk: Registrácia do štrajku',
            $this->renderWith(array('SchoolStrikeCreateUniversityRegistration'), array('Registration' => $this)),
            'ivu@isu.sk'
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
        return MAIL_BASE_URL . '/uv/' . $this->generateVerificationHash();
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

    protected function sendEmail($recipients, $subject, $body, $from = null)
    {
        $email = new IsuEmail();
        $email->sendEmail($recipients, $subject, $body, $from);
    }
}