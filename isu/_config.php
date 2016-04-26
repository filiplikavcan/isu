<?php

global $project;
$project = 'isu';

global $database;
$database = 'isuweb55_redesign';
//$database = 'isuweb';

// Set the site locale
i18n::set_locale('sk_SK');

require_once("conf/ConfigureFromEnv.php");