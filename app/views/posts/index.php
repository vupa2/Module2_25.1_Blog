
<main class="container">
    <!-- <div class="p-4 p-md-5 mb-4 text-white rounded bg-dark">
        <div class="col-md-6 px-0">
            <h1 class="display-4 fst-italic">Title of a longer featured blog post</h1>
            <p class="lead my-3">Multiple lines of text that form the lede, informing new readers quickly and efficiently about what’s most interesting in this post’s contents.</p>
            <p class="lead mb-0"><a href="#" class="text-white fw-bold">Continue reading...</a></p>
        </div>
    </div> -->

    <div class="row g-5">
        <div class="col-md-9">
            <div class="container-fluid p-0">
                <?php include_once __DIR__ . '/components/posts.php'; ?>
            </div>
        </div>

        <div class="col-md-3">
            <?php include_once __DIR__ . '/components/rightsidebar.php' ?>
        </div>
    </div>
</main>