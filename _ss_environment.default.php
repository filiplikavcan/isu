<?php
/* What kind of environment is this: development, test, or live (ie, production)? */
define('SS_ENVIRONMENT_TYPE', 'dev');

global $_FILE_TO_URL_MAPPING;

$_FILE_TO_URL_MAPPING = array(__DIR__ => 'http://isu.sk/');

/* Database connection */
define('SS_DATABASE_SERVER', '');
define('SS_DATABASE_USERNAME', '');
define('SS_DATABASE_PASSWORD', '');
#define('SS_DATABASE_PREFIX', 'prefix_');

/* Configure a default username and password to access the CMS on all sites in this environment. */
define('SS_DEFAULT_ADMIN_USERNAME', '');
define('SS_DEFAULT_ADMIN_PASSWORD', '');

define('SS_ERROR_LOG', 'logs/error.log');

define('MAIL_BASE_URL', 'http://isu.sk');

define('SENDINBLUE_API_KEY', '');

//Required:
define('SMTPMAILER_SMTP_SERVER_ADDRESS', ''); //SMTP server address
define('SMTPMAILER_DO_AUTHENTICATE', true); //Turn on SMTP server authentication. Set to false for an anonymous connection
define('SMTPMAILER_USERNAME', ''); //SMTP server username, if SMTPAUTH == true
define('SMTPMAILER_PASSWORD', ''); //SMTP server password, if SMTPAUTH == true

//Optional:
define('SMTPMAILER_USE_SECURE_CONNECTION', 'ssl'); //SMTP encryption method : Set to '', 'tls', or 'ssl'
define('SMTPMAILER_SMTP_SERVER_PORT', 465); //SMTP server port. Set to 25 if no encryption is used, 465 if ssl or tls is activated
