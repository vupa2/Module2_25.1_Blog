<?php

namespace app\helpers;

class Uncategorized
{
    public static function translateMonth($monthNum)
    {
        $monthName = date("M", mktime(0, 0, 0, $monthNum, 10));

        $timeEng = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        $timeVie = ['Chủ Nhật', 'Thứ Hai', 'Thứ Ba', 'Thứ Tư', 'Thứ Năm', 'Thứ Sáu', 'Thứ Bảy', 'Một', 'Hai', 'Ba', 'Tư', 'Năm', 'Sáu', 'Bảy', 'Tám', 'Chín', 'Mười', 'Mười Một', 'Mười Hai'];

        return mb_strtolower(str_replace($timeEng, $timeVie, $monthName), 'UTF-8');
    }

    public static function isLoggedIn()
    {
        if (isset($_SESSION['user_id'])) {
            return true;
        }
        return false;
    }
}
