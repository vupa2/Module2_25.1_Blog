<?php

namespace app\libraries;

class Controller
{
    public function model($modelName)
    {
        $modelNamespace = 'app\\models\\' . $modelName;
        return new $modelNamespace();
    }

    public function view($view, $params = [])
    {
        if (file_exists(__DIR__ . '/../views/' . $view . '.php')) {
            foreach ($params as $key => $value) {
                $$key = $value;
            }
            
            ob_start();
            include_once __DIR__ . '/../views/' . $view . '.php';
            $content = ob_get_clean();
            include_once __DIR__ . '/../views/' . explode("/", $view)[0] . '/_layout' . '.php';
        } else {
            die("<h1 style='font-size: 2rem'>Trang không tồn tại.<h1>");
        }
    }
}
