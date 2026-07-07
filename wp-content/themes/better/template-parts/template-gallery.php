<?php
$post = $args;
$post_id = $post->ID;

$gallery_type = $post->gallery_type;

// Pobierz featured image
$featured_image = get_the_post_thumbnail_url($post_id, 'full');

// Pobierz galerię z ACF
$gallery_images = get_field('galeria', $post_id);

// Połącz featured image z galerią
$all_images = [];
if ($featured_image) {
    $all_images[] = [
        'url' => $featured_image,
        'alt' => get_the_title($post_id)
    ];
}

if ($gallery_images && is_array($gallery_images)) {
    foreach ($gallery_images as $image) {
        $img_url = is_array($image) ? $image['url'] ?? $image['ID'] : $image;
        $img_id = is_array($image) ? $image['ID'] : $image;

        $all_images[] = [
            'url' => is_numeric($img_id) ? wp_get_attachment_image_url($img_id, 'full') : $img_url,
            'alt' => is_numeric($img_id) ? get_post_meta($img_id, '_wp_attachment_image_alt', true) : ''
        ];
    }
}

if (!empty($all_images)) :
?>
<div class="gallery-container <?=$gallery_type?>">
    <div class="gallery-main">
        <div class="gallery-main-image">
            <?php foreach ($all_images as $index => $image) : ?>
                <div class="gallery-main-slide" data-index="<?php echo $index; ?>">
                    <a href="<?=get_permalink($post->ID)?>">
                        <img src="<?php echo esc_url($image['url']); ?>" alt="<?php echo esc_attr($image['alt']); ?>" />
                    </a>
                </div>
            <?php endforeach; ?>
        </div>        
    </div>

    <div class="gallery-nav-arrows">
            <button class="gallery-arrow gallery-prev" aria-label="Previous image">
                
            </button>
            <button class="gallery-arrow gallery-next" aria-label="Next image">
                
            </button>
        </div>

    <?php if (count($all_images) > 1) : ?>
    <div class="gallery-thumbs">
        <?php foreach ($all_images as $index => $image) : ?>
            <div class="gallery-thumb" data-index="<?php echo $index; ?>">
                <img src="<?php echo esc_url($image['url']); ?>" alt="<?php echo esc_attr($image['alt']); ?>" />
            </div>
        <?php endforeach; ?>
    </div>
    <?php endif; ?>
</div>


<?php endif; ?>
