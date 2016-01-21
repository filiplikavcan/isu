<?php

ini_set('memory_limit', '256M');

$_SERVER['argv'][1] = 'dev/tasks/BuildStaticCacheFromQueue';
$_SERVER['argv'][2] = 'daemon=1';
include('framework/cli-script.php');
