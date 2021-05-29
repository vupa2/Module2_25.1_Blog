<?php foreach ($data['posts'] as $post) : ?>
    <article class="blog-post row">
        <div>
            <div class="d-flex justify-content-between align-items-center">
                <div class="w-100">
                    <div class="d-flex justify-content-between align-items-start">
                        <h2 class="blog-post-title me-1"><?= $post->title ?></h2>
                        <?php if (isset($_SESSION['user_id']) && $_SESSION['user_id'] === $post->user_id) : ?>
                            <div class="d-flex justify-content-end align-items-center">
                                <form class="me-1" action="<?= URLROOT . '/posts/update/' . $post->id ?>" method="get">
                                    <button type="submit" class="btn btn-outline-success">
                                        <i class="far fa-edit"></i>
                                    </button>
                                </form>
                                <form action="<?= URLROOT . '/posts/delete/' . $post->id ?>" method="post">
                                    <button type="submit" class="btn btn-outline-danger" onclick="return confirm('Bạn có muốn xóa bài viết này?');">
                                        <i class="far fa-trash-alt"></i>
                                    </button>
                                </form>
                            </div>
                        <?php endif; ?>
                    </div>
                    <p class="blog-post-meta">
                        <a href="#" class="badge bg-secondary text-decoration-none"><?= ucwords($post->category_name) ?></a> &verbar;
                        <?= date('d/m/Y, H:i', strtotime($post->created_at)) ?> &verbar;
                        <a href="<?= URLROOT . '/posts/search/id/' . $post->user_id ?>"><?= $post->username ?></a>
                    </p>
                </div>
            </div>

            <?= $post->body ?>
        </div>
    </article>
<?php endforeach; ?>