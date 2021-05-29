<?php

namespace app\controllers;

use app\libraries\Controller;

class Users extends Controller
{
    private $userModel;

    public function __construct()
    {
        $this->userModel = $this->model('User');
    }

    public function register()
    {
        if (isset($_SESSION['user_id'])) {
            header('Location: ' . URLROOT);
            exit();
        }

        $data = [
            'title' => 'Đăng ký',
            'message' => '',
        ];

        $errors = [];

        if ($_SERVER["REQUEST_METHOD"] === 'POST') {
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_URL);

            $data = [
                'title' => 'Đăng ký',
                'message' => '',
                'username' => trim($_POST['username']),
                'email' => trim($_POST['email']),
                'password' => trim($_POST['password']),
                'confirmPassword' => trim($_POST['confirmPassword']),
            ];

            $nameValidation = "/^[a-zA-z0-9]*$/";
            $passwordValidation = "/^(.{0,7}|[^a-z]*[^D]*)$/i";

            if (empty($data['username'])) {
                $errors['username'] = 'Hãy điền tên đăng nhập';
            } elseif (!preg_match($nameValidation, $data['username'])) {
                $errors['username'] = 'Tên đăng nhập chỉ nhận số và chữ';
            } elseif ($this->userModel->findUser($data['username'], 'username')) {
                $errors['username'] = 'Tên đăng nhập đã được đăng ký';
            }
            if (empty($data['email'])) {
                $errors['email'] = 'Hãy điền email';
            } elseif (!filter_var($data['email'], FILTER_VALIDATE_EMAIL)) {
                $errors['email'] = 'Email không đúng định dạng';
            } elseif ($this->userModel->findUser($data['email'], 'email')) {
                $errors['email'] = 'Email đã được đăng ký';
            }
            if (empty($data['password'])) {
                $errors['password'] = 'Hãy điền password';
            } elseif (strlen($data['password']) < 1) {
                $errors['password'] = 'Password phải có ít nhất 6 ký tự';
            } elseif (!preg_match($passwordValidation, $data['password'])) {
                $errors['password'] = 'Password phải chứa ít nhất 1 số';
            }
            if (empty($data['confirmPassword'])) {
                $errors['confirmPassword'] = 'Hãy điền xác nhận lại mật khẩu';
            } elseif ($data['password'] !== $data['confirmPassword']) {
                $errors['confirmPassword'] = 'Xác nhận lại mật khẩu không trùng khớp';
            }

            if (empty($errors)) {
                $data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);

                if ($this->userModel->register($data)) {
                    header('Location: ' . URLROOT . '/users/login/' . '?message=' . 'success');
                    exit();
                }

                $errors['unknown'] = 'Có lỗi xảy vui lòng thử lại';
            }
        }

        $this->view('users/register', ['data' => $data, 'errors' => $errors]);
    }

    public function login()
    {
        if (isset($_SESSION['user_id'])) {
            header('Location: ' . URLROOT);
            exit();
        }

        $data = [
            'title' => 'Đăng nhập',
            'username' => '',
            'password' => '',
        ];

        $errors = [];

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

            $data = [
                'title' => 'Đăng nhập',
                'username' => trim($_POST['username']),
                'password' => trim($_POST['password']),
            ];

            if (empty($data['username'])) {
                $errors['username'] = 'Hãy điền tên đăng nhập';
            }
            if (empty($data['password'])) {
                $errors['password'] = 'Hãy điền mật khẩu';
            }

            if (empty($errors)) {
                $loggedInUser = $this->userModel->login($data['username'], $data['password']);

                if ($loggedInUser) {
                    $this->createUserSession($loggedInUser);
                } else {
                    $errors['all'] = 'Tên đăng nhập hoặc mật khẩu không đúng';
                }
            }
        }

        $this->view('users/login', ['data' => $data, 'errors' => $errors]);
    }

    public function createUserSession($user)
    {
        $_SESSION['user_id'] = $user->id;
        $_SESSION['user_username'] = $user->username;
        $_SESSION['user_email'] = $user->email;
        header('Location: ' . URLROOT);
        exit();
    }

    public function logout()
    {
        session_destroy();
        header('Location: ' . $_SERVER['HTTP_REFERER']);
        exit();
    }
}
