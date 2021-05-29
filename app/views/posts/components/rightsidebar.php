<?php

use app\helpers\Uncategorized;

?>

<div class="position-sticky" style="top: 2rem;">
    <!-- <div class="p-4 mb-3 bg-light rounded">
        <h4 class="fst-italic">Về chúng tôi</h4>
        <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet asperiores corporis expedita facere hic libero necessitatibus optio veniam! Accusamus beatae doloribus dolorum eligendi, reiciendis vitae.</p>
    </div> -->

    <nav class="blog-pagination p-4 m-0" aria-label="Pagination">
        <?php if (isset($data['pages']) && $data['pages']['olderPage']) : ?>
            <a class="btn btn-outline-info" href="<?= URLROOT . $data['currentPage'] . $data['pages']['olderPage'] ?>">Cũ hơn</a>
        <?php else : ?>
            <a class="btn btn-outline-secondary disabled" href="#" aria-disabled="true">Cũ hơn</a>
        <?php endif; ?>

        <?php if (isset($data['pages']) && $data['pages']['newerPage']) : ?>
            <a class="btn btn-outline-info" href="<?= URLROOT . $data['currentPage'] . $data['pages']['newerPage'] ?>">Mới hơn</a>
        <?php else : ?>
            <a class="btn btn-outline-secondary disabled" href="#" tabindex="-1" aria-disabled="true">Mới hơn</a>
        <?php endif; ?>
    </nav>
    
    <?php if (isset($_SESSION['user_id'])) : ?>
        <div class="p-4 mb-3 bg-light rounded d-flex justify-content-lg-start">
            <a class="btn btn-primary" href="<?= URLROOT . '/posts/create' ?>" role="button">Thêm bài viết</a>
        </div>
    <?php endif; ?>

    <div class="p-4">
        <h4 class="fst-italic">Archives</h4>
        <ol class="list-unstyled mb-0">
            <?php foreach ($data['archiveTime'] as $value) : ?>
                <li>
                    <a class="text-decoration-none" href="<?= URLROOT . '/posts/search/time/' . $value->year . '-' . $value->month ?>">
                        <?= 'Tháng ' . Uncategorized::translateMonth($value->month) . ', ' . $value->year . ' (' . $value->count . ' bài viết)' ?>
                    </a>
                </li>
            <?php endforeach; ?>
        </ol>
    </div>

</div>