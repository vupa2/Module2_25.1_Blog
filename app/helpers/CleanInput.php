<?php

namespace app\helpers;

use HTMLPurifier_Config;
use HTMLPurifier;

class CleanInput
{
    private static $purifier;

    public static function clean($value)
    {
        return self::getPurifier()->purify($value);
    }

    private static function getPurifier()
    {
        if (is_null(self::$purifier)) {
            $config = HTMLPurifier_Config::createDefault();
            $config->set('HTML.ForbiddenElements', array('script', 'applet'));

            self::$purifier = new HTMLPurifier($config);
        }

        return self::$purifier;
    }
}
