<?php

namespace app\controllers;

use app\helpers\CleanInput;
use app\libraries\Controller;
use RuntimeException;

class Posts extends Controller
{
    private $userModel;

    public function __construct()
    {
        $this->userModel = $this->model('Post');
    }

    public function index($page = 1)
    {
        $postsCount = $this->userModel->getPostsCount();

        $step = 3;
        $pagesCount = ceil($postsCount / $step);

        if (!filter_var($page, FILTER_VALIDATE_INT) || $page > $postsCount || $page < 1) {
            $page = 1;
        }

        $newerPage = $page - 1 < 1 ? null : $page - 1;
        $olderPage = $page + 1 > $pagesCount ? null : $page + 1;

        $posts = $this->userModel->getAllPosts($page, $step);
        $archiveTime = $this->userModel->getArchiveTime();
        $categories = $this->userModel->getCategories();

        $data = [
            'title' => 'Blog',
            'currentPage' => '/posts/index/',
            'categories' => $categories,
            'posts' => $posts,
            'postsCount' => $postsCount,
            'archiveTime' => $archiveTime,
            'pages' => [
                'newerPage' => $newerPage,
                'olderPage' => $olderPage
            ],
        ];

        $this->view('posts/index', ['data' => $data]);
    }

    public function search($field, $input1, $page = 1)
    {
        if ($field !== 'id') {
            header('Location: ' . URLROOT);
            exit();
        }

        $postsCount = $this->userModel->getPostsCountByField($field, $input1);
        $step = 3;
        $pagesCount = ceil($postsCount / $step);

        if (!filter_var($page, FILTER_VALIDATE_INT) || $page > $pagesCount || $page < 1) {
            $page = 1;
        }

        $newerPage = $page - 1 < 1 ? null : $page - 1;
        $olderPage = $page + 1 > $pagesCount ? null : $page + 1;

        $posts = $this->userModel->searchPosts($field, $input1, $page, $step);
        $archiveTime = $this->userModel->getArchiveTime();
        $categories = $this->userModel->getCategories();
        
        $data = [
            'title' => 'Blog',
            'currentPage' => '/posts/search/id/' . $input1 . '/',
            'categories' => $categories,
            'posts' => $posts,
            'postsCount' => $postsCount,
            'archiveTime' => $archiveTime,
            'pages' => [
                'newerPage' => $newerPage,
                'olderPage' => $olderPage
            ],
        ];

        $this->view('posts/index', ['data' => $data]);
    }

    public function create()
    {
        if (!isset($_SESSION['user_id'])) {
            header('Location: ' . URLROOT);
            exit();
        }

        $categories = $this->userModel->getCategories();

        $data = [
            'title' => 'Thêm bài viết mới',
            'categories' => $categories,
            'userId' => $_SESSION['user_id'],
        ];

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $postBody = CleanInput::clean($_POST['postBody']);
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

            $data = [
                'title' => 'Thêm bài viết mới',
                'categories' => $categories,
                'userId' => $_SESSION['user_id'],
                'postTitle' => trim($_POST['postTitle']),
                'postCategory' => $_POST['postCategory'],
                'postBody' => $postBody,
                'postTitleError' => '',
                'postCategoryError' => '',
                'postBodyError' => '',
                'unknownError' => '',
            ];

            if (empty($data['postCategory'])) {
                $data['postCategoryError'] = 'Hãy chọn cho bài viết';
            }

            if (empty($data['postTitle'])) {
                $data['postTitleError'] = 'Hãy điền tiêu đề bài viết';
            } elseif (strlen($data['postTitle']) > 250) {
                $data['postTitleError'] = 'Tiêu đề không được dài hơn 250 kí tự';
            }

            if (empty($data['postBody']) && filter_var($data['postBody'], FILTER_VALIDATE_INT)) {
                $data['postBodyError'] = 'Hãy điền nội dung cho bài viết';
            }

            if (empty($data['postTitleError']) && empty($data['postCategoryError']) && empty($data['postBodyError'])) {
                if ($this->userModel->addPost($data)) {
                    header('Location: ' . URLROOT);
                    exit();
                }

                $data['unknownError'] = 'Có lỗi đã xảy ra xin vui lòng thử lại';
            }
        }

        $this->view('posts/create', ['data' => $data]);
    }

    public function update($id)
    {
        if (!isset($_SESSION['user_id'])) {
            header('Location: ' . URLROOT);
            exit();
        }

        $post = $this->userModel->getPostById($id);

        if ($_SESSION['user_id'] !== $post->user_id) {
            header('Location: ' . URLROOT);
            exit();
        }

        $categories = $this->userModel->getCategories();

        $data = [
            'title' => 'Chỉnh sửa bài viết',
            'categories' => $categories,
            'postId' => $post->id,
            'postCategory' => $post->category_id,
            'postTitle' => $post->title,
            'postBody' => $post->body
        ];

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $postBody = CleanInput::clean($_POST['postBody']);
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

            $data = [
                'title' => 'Chỉnh sửa bài viết',
                'categories' => $categories,
                'userId' => $_SESSION['user_id'],
                'postId' => $post->id,
                'postTitle' => trim($_POST['postTitle']),
                'postCategory' => $_POST['postCategory'],
                'postBody' => $postBody,
                'postTitleError' => '',
                'postCategoryError' => '',
                'postBodyError' => '',
                'unknownError' => '',
            ];

            if (empty($data['postCategory'])) {
                $data['postCategoryError'] = 'Hãy chọn cho bài viết';
            }

            if (empty($data['postTitle'])) {
                $data['postTitleError'] = 'Hãy điền tiêu đề bài viết';
            } elseif (strlen($data['postTitle']) > 250) {
                $data['postTitleError'] = 'Tiêu đề không được dài hơn 250 kí tự';
            }

            if (empty($data['postBody'])) {
                $data['postBodyError'] = 'Hãy điền nội dung cho bài viết';
            }

            if (empty($data['postTitleError']) && empty($data['postCategoryError']) && empty($data['postBodyError'])) {
                if ($this->userModel->updatePost($data)) {
                    header('Location: ' . $_SERVER['HTTP_REFERER']);
                    exit();
                }

                $data['unknownError'] = 'Có lỗi đã xảy ra xin vui lòng thử lại';
            }
        }
        
        $this->view('postss/update', ['data' => $data]);
    }

    public function delete($id)
    {
        if (isset($_SESSION['user_id']) && filter_var($id, FILTER_VALIDATE_INT)) {
            $post = $this->userModel->getPostById($id);
            if ($_SESSION['user_id'] === $post->user_id && $_SERVER['REQUEST_METHOD'] === 'POST') {
                $this->userModel->deletePost($id);
            }
        }

        header('Location: ' . $_SERVER['HTTP_REFERER']);
        exit();
    }

    public function uploadimage()
    {
        $directory = APPROOT . '/../../public/upload/';
        $allowedExtesion = ['jpg', 'png', 'jpeg'];

        if (isset($_FILES['upload']['name'])) {
            if (!is_dir($directory)) {
                if (mkdir($directory) && !is_dir($directory)) {
                    throw new RuntimeException(sprintf('Directory "%s" was not created', 'upload/'));
                }
            }

            $fileName = $_FILES['upload']['name'];
            $fileTmp = $_FILES['upload']['tmp_name'];
            $fileNameArray = explode('.', $fileName);
            $fileExtesion = end($fileNameArray);

            if (in_array($fileExtesion, $allowedExtesion, true)) {
                do {
                    $fileNewName = uniqid(mt_rand(), false) . '.' . $fileExtesion;
                } while (file_exists($directory . $fileNewName));

                move_uploaded_file($fileTmp, $directory . $fileNewName);
                $function_number = $_GET['CKEditorFuncNum'];
                $url = URLROOT . '/public/upload/' . $fileNewName;
                $message = '';
                echo "<script>window.parent.CKEDITOR.tools.callFunction('" . $function_number . "','" . $url . "','" . $message . "');</script>";
            }
        }
    }
}
