<?php

class IsuEmail extends DataObject
{
    public function sendEmail($recipients, $subject, $body)
    {
        $mail = new PHPMailer;

        $mail->AddEmbeddedImage(BASE_PATH . '/themes/isu/images/isu-email-logo.png', 'logo');
        $mail->AddEmbeddedImage(BASE_PATH . '/themes/isu/images/isu-email-strajk.png', 'strajk');

        $mail->isSMTP();
        $mail->Host = SMTPMAILER_SMTP_SERVER_ADDRESS;
        $mail->SMTPAuth = SMTPMAILER_DO_AUTHENTICATE;
        $mail->Username = SMTPMAILER_USERNAME;
        $mail->Password = SMTPMAILER_PASSWORD;
        $mail->SMTPSecure = SMTPMAILER_USE_SECURE_CONNECTION;
        $mail->Port = SMTPMAILER_SMTP_SERVER_PORT;

        $config = SiteConfig::current_site_config();

        $mail->From = 'info@isu.sk';
        $mail->FromName = 'ISU';
        $mail->CharSet = 'UTF-8';

        foreach ($recipients as $recipient)
        {
            $mail->addAddress($recipient);
        }

        $mail->isHTML(true);

        $mail->Subject = $subject;
        $mail->Body = $this->renderWith(array('EmailLayout'), array('Content' => $body));

        $mail->Send();
    }
}