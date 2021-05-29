<main class="container">
    <div class="row g-5">
        <div class="col-md-8 offset-2">
            <h3 class="my-3 text-center">Thêm bài viết</h3>
            <form action="<?= URLROOT . '/posts/create' ?>" method="post">
                <div class="mb-3 row">
                    <div class="col-3">
                        <label for="postTitle" class="form-label">Chủ đề</label>
                        <select name="postCategory" class="form-select" id="postCategory" aria-label="Default select example">
                            <?php foreach ($data['categories'] as $category) : ?>
                                <option value="<?= $category->id ?>"><?= ucwords($category->name) ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="col-9">
                        <label for="postTitle" class="form-label">Tiêu đề</label>
                        <?php if (!empty($data['postTitleError'])) : ?>
                            <input type="text" name="postTitle" class="form-control is-invalid" id="postTitle" value="<?= $data['postTitle'] ?>">
                            <div class="invalid-feedback">
                                <?= $data['postTitleError'] ?>
                            </div>
                        <?php else : ?>
                            <input type="text" name="postTitle" class="form-control" id="postTitle" value="<?= isset($data['postTitle']) ? $data['postTitle'] : '' ?>">
                        <?php endif; ?>
                    </div>
                </div>

                <div class="mb-4 row">
                    <label for="postBody" class="form-label">Nội dung</label>
                    <?php if (!empty($data['postBodyError'])) : ?>
                        <textarea class="is-invalid form-control" name="postBody" id="postBody" rows="5"><?= $data['postBody'] ?></textarea>
                        <div class="invalid-feedback">
                            <?= $data['postBodyError'] ?>
                        </div>
                    <?php else : ?>
                        <textarea class="form-control" name="postBody" id="postBody" rows="5"><?= isset($data['postBody']) ? $data['postBody'] : '' ?></textarea>
                    <?php endif; ?>
                </div>

                <button class="w-100 btn btn-lg btn-dark" type="submit">Đăng bài</button>
            </form>
        </div>
</main>

<script>
    CKEDITOR.replace('postBody', {
        filebrowserUploadMethod: 'form',
        filebrowserUploadUrl: '<?= URLROOT . '/posts/uploadimage' ?>'
    })
</script>