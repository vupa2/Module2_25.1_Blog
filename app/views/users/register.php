<main class="form-signin text-center">
    <?php if (!empty($errors['unknown'])) : ?>
        <div class="alert alert-danger alert-dismissible fade show text-left" role="alert">
            <span><?= $errors['unknown'] ?></span>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <?php endif; ?>

    <form class="mb-3" action="<?= URLROOT . '/users/register' ?>" method="post">
        <h1 class="h2 mb-3 fw-normal text-uppercase text fw-bold">Đăng ký</h1>

        <div class="form-floating mb-2">
            <?php if (!empty($errors['username'])) : ?>
                <input type="text" class="form-control is-invalid" id="floating-username" name="username" placeholder="Tên đăng nhập" value="<?= $data['username'] ?>">
                <div class="invalid-feedback">
                    <?= $errors['username'] ?>
                </div>
            <?php else : ?>
                <input type="text" class="form-control" id="floating-username" name="username" placeholder="Tên đăng nhập">
            <?php endif; ?>
            <label for="floating-username">Tên đăng nhập</label>
        </div>

        <div class="form-floating mb-2">
            <?php if (!empty($errors['email'])) : ?>
                <input type="email" class="form-control is-invalid" name="email" id="floating-email" placeholder="Email" value="<?= $data['email'] ?>">
                <div class="invalid-feedback">
                    <?= $errors['email'] ?>
                </div>
            <?php else : ?>
                <input type="email" class="form-control" name="email" id="floating-email" placeholder="Email">
            <?php endif; ?>
            <label for="floating-email">Email</label>
        </div>

        <div class="form-floating mb-2">
            <?php if (!empty($errors['password'])) : ?>
                <input type="password" class="form-control is-invalid" name="password" id="floating-password" placeholder="Mật khẩu">
                <div class="invalid-feedback">
                    <?= $errors['password'] ?>
                </div>
            <?php else : ?>
                <input type="password" class="form-control" name="password" id="floating-password" placeholder="Mật khẩu">
            <?php endif; ?>
            <label for="floating-password">Mật khẩu</label>
        </div>

        <div class="form-floating mb-3">
            <?php if (!empty($errors['confirmPassword'])) : ?>
                <input type="password" class="form-control is-invalid" name="confirmPassword" id="floating-confirmPassword" placeholder="Nhập lại mật khẩu">
                <div class="invalid-feedback">
                    <?= $errors['confirmPassword'] ?>
                </div>
            <?php else : ?>
                <input type="password" class="form-control" name="confirmPassword" id="floating-confirmPassword" placeholder="Nhập lại mật khẩu">
            <?php endif; ?>
            <label for="floating-confirmPassword">Xác nhận lại mật khẩu</label>
        </div>

        <button class="w-100 btn btn-lg btn-dark" type="submit">Đăng ký</button>
    </form>

    <div>
        <span>
            Bạn đã có tài khoản? <a href="<?= URLROOT . '/users/login' ?>" class="link-primary fw-bold text-decoration-none">Đăng nhập</a>
        </span>
    </div>
</main>