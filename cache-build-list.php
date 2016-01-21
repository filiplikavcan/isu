<?php

ini_set('memory_limit', '256M');

$_SERVER['argv'][1] = 'dev/tasks/IsuSiteTreeFullBuildEngine';
$_SERVER['argv'][2] = 'flush=all';
include('framework/cli-script.php');

