<?php

namespace app\models;

use app\libraries\Database;

class Post
{
    private $database;

    public function __construct()
    {
        $this->database = new Database();
    }

    public function getPostsCount()
    {
        $this->database->query('SELECT COUNT(id) as count FROM posts');
        return $this->database->single()->count;
    }

    public function getPostsCountByField($field, $input1)
    {
        $this->database->query("SELECT COUNT(posts.id) as count FROM posts LEFT JOIN users on posts.user_id = users.id WHERE users.$field = ?");
        $this->database->bind(1, $input1);

        return $this->database->single()->count;
    }

    public function getCategories()
    {
        $this->database->query('SELECT * FROM categories ORDER BY name');
        return $this->database->resultSet();
    }

    public function getArchiveTime()
    {
        $this->database->query('SELECT Year(created_at) as year, Month(created_at) as month, GROUP_CONCAT(title) as post, Count(*) as count FROM posts GROUP BY year, month ORDER BY created_at DESC');
        return $this->database->resultSet();
    }

    public function getAllPosts($page, $step)
    {
        $this->database->query('SELECT posts.*, users.username, categories.name AS category_name FROM posts LEFT JOIN users on posts.user_id = users.id LEFT JOIN categories on posts.category_id = categories.id ORDER BY posts.created_at DESC LIMIT ?, ?');

        $row = ($page - 1) * $step;

        $this->database->bind(1, $row);
        $this->database->bind(2, $step);
        return $this->database->resultSet();
    }

    public function searchPosts($field, $input1, $page, $step)
    {
        $this->database->query("SELECT posts.*, users.username, categories.name AS category_name FROM posts LEFT JOIN users on posts.user_id = users.id LEFT JOIN categories on posts.category_id = categories.id WHERE users.$field = ? ORDER BY posts.created_at DESC LIMIT ?, ?;");

        $row = ($page - 1) * $step;

        $this->database->bind(1, $input1);
        $this->database->bind(2, $row);
        $this->database->bind(3, $step);
        return $this->database->resultSet();
    }

    public function getPostById($id)
    {
        $this->database->query('SELECT * FROM posts WHERE id = ?');
        $this->database->bind(1, $id);
        return $this->database->single();
    }

    public function addPost($data)
    {
        $this->database->query('INSERT INTO posts (user_id, category_id, title, body) VALUES (?, ?, ?, ?)');
        $this->database->bind(1, $data['userId']);
        $this->database->bind(2, $data['postCategory']);
        $this->database->bind(3, $data['postTitle']);
        $this->database->bind(4, $data['postBody']);
        return $this->database->execute();
    }

    public function updatePost($data)
    {
        $this->database->query('UPDATE posts SET category_id = ?, title = ?, body = ? WHERE id = ?');
        $this->database->bind(1, $data['postCategory']);
        $this->database->bind(2, $data['postTitle']);
        $this->database->bind(3, $data['postBody']);
        $this->database->bind(4, $data['postId']);
        return $this->database->execute();
    }

    public function deletePost($id)
    {
        $this->database->query('DELETE FROM posts WHERE id = ?');
        $this->database->bind(1, $id);
        return $this->database->execute();
    }
}
