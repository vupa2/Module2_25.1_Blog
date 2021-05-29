<?php

require_once __DIR__ . '/config/config.php';
require_once __DIR__ . '/../vendor/autoload.php';

use app\libraries\Core;

session_start();

$init = new Core();
