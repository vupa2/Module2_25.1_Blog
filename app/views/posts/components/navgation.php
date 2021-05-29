<div class="container mb-3">
    <header class="blog-header py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
            <div class="col-4 pt-1">
            </div>
            <div class="col-4 text-center">
                <a class="blog-header-logo text-dark user-select-none text-decoration-none" href="<?= URLROOT ?>">Blog</a>
            </div>
            <div class="col-4 d-flex justify-content-end align-items-center">
                <?php if (!isset($_SESSION['user_id'])) : ?>
                    <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                        <a class="btn btn-sm btn-outline-secondary" role="button" href="<?= URLROOT . '/users/register' ?>">Đăng ký</a>
                        <a class="btn btn-sm btn-secondary" role="button" href="<?= URLROOT . '/users/login' ?>">Đăng nhập</a>
                    </div>
                <?php else : ?>
                    <span class="btn user-select-none cursor">Xin chào <?= $_SESSION['user_username'] ?></span>
                    <a class="btn btn-sm btn-secondary" role="button" href="<?= URLROOT . '/users/logout' ?>">Đăng xuất</a>
                <?php endif; ?>
            </div>
        </div>
    </header>

    <div class="nav-scroller py-1 mb-2 border-bottom">
        <nav class="nav d-flex justify-content-center">
            <div class="w-75 d-flex justify-content-around mb-5">
                <?php foreach ($data['categories'] as $category) : ?>
                    <a class="p-2 link-secondary text-decoration-none" href="#"><?= $category->name ?></a>
                <?php endforeach; ?>
            </div>
        </nav>
    </div>
</div>