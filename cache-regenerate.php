<?php

ini_set('memory_limit', '256M');

$_SERVER['argv'][1] = 'dev/tasks/BuildStaticCacheFromQueue';
include('framework/cli-script.php');
