<main class="form-signin text-center">
    <?php if (isset($_GET['message']) && $_GET['message'] === 'success') : ?>
        <div class="alert alert-success alert-dismissible fade show text-left" role="alert">
            <span>Đăng ký thành công</span>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <?php endif; ?>

    <form class="mb-3" action="<?= URLROOT . '/users/login' ?>" method="post">
        <h1 class="h2 mb-3 fw-normal text-uppercase text fw-bold">Đăng Nhập</h1>

        <div class="form-floating mb-2">
            <?php if (!empty($errors['username'])) : ?>
                <input type="text" class="form-control is-invalid" name="username" id="floating-username" placeholder="Tên đăng nhập" value="<?= $data['username'] ?>">
                <div class="invalid-feedback">
                    <?= $errors['username'] ?>
                </div>
            <?php else : ?>
                <input type="text" class="form-control" name="username" id="floating-username" placeholder="Tên đăng nhập">
            <?php endif; ?>
            <label for="floating-username">Tên đăng nhập</label>
        </div>

        <div class="form-floating mb-3">
            <?php if (!empty($errors['password'])) : ?>
                <input type="password" class="form-control is-invalid" name="password" id="floating-password" placeholder="Mật khẩu">
                <div class="invalid-feedback">
                    <?= $errors['password'] ?>
                </div>
            <?php else : ?>
                <input type="password" class="form-control" name="password" id="floating-password" placeholder="Mật khẩu">
            <?php endif; ?>

            <?php if (!empty($errors['all'])) : ?>
                <div class="is-invalid text-danger mt-1 text-center">
                    <?= $errors['all'] ?>
                </div>
            <?php endif; ?>

            <label for="floating-password">Mật khẩu</label>

        </div>

        <button class="w-100 btn btn-lg btn-dark" type="submit">Đăng nhập</button>
    </form>

    <div>
        <span>
            Bạn chưa <a href="<?= URLROOT . '/users/register' ?>" class="link-primary fw-bold text-decoration-none">đăng ký</a>?
        </span>
    </div>
</main>