<?php

namespace app\models;

use app\libraries\Database;

class User
{
    private $database;

    public function __construct()
    {
        $this->database = new Database();
    }

    public function getUsers()
    {
        $this->database->query('SELECT * FROM users');
        return $this->database->resultSet();
    }

    public function findUser($value, $field)
    {
        $this->database->query("SELECT * FROM users WHERE $field = ?");
        $this->database->bind(1, $value);
        return $this->database->rowCount() > 0;
    }

    public function login($username, $password)
    {
        $this->database->query('SELECT * FROM users WHERE username = ?');
        $this->database->bind(1, $username);
        $row = $this->database->single();

        if ($row && password_verify($password, $row->password)) {
            return $row;
        }
        return false;
    }

    public function register($data)
    {
        $this->database->query('INSERT INTO users(username, email, password) VALUES (?, ?, ?)');

        $this->database->bind(1, $data['username']);
        $this->database->bind(2, $data['email']);
        $this->database->bind(3, $data['password']);

        return $this->database->execute();
    }
}
