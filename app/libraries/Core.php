<?php

namespace app\libraries;

// Kiểm tra URL và điều hướng
class Core
{
    private $currentController = 'Posts';
    private $currentMethod = 'index';
    private $params = [];
    private $currentControllerNameSpace;

    public function __construct()
    {
        $url = $this->getURL();

        // Kiểm tra file controller có tòn tại hay không
        if (!empty($url) && file_exists(__DIR__ . '/../controllers/' . ucwords($url[0]) . '.php')) {
            $this->currentController = ucwords($url[0]);
            unset($url[0]);
        }

        $this->currentControllerNameSpace = 'app\\controllers\\' . $this->currentController;
        $this->currentController = new $this->currentControllerNameSpace();

        // Kiểm tra method có tồn tại trong controller hay không
        if (isset($url[1]) && method_exists($this->currentControllerNameSpace, $url[1])) {
            $this->currentMethod = $url[1];
            unset($url[1]);
        }

        // Kiểm tra tham số có được truyền vào hay không
        $this->params = $url ? array_values($url) : [];

        // Gọi method của controller và truyền tham số
        if (method_exists($this->currentControllerNameSpace, $this->currentMethod)) {
            call_user_func_array([$this->currentController, $this->currentMethod], $this->params);
        } else {
            header('Location: ' . URLROOT);
            exit();
        }
    }

    // Lấy URL và return array
    public function getURL()
    {
        if (isset($_GET['url'])) {
            $url = rtrim($_GET['url'], '/');
            $url = filter_var($url, FILTER_SANITIZE_URL);
            return explode('/', $url);
        }
        return [];
    }
}
