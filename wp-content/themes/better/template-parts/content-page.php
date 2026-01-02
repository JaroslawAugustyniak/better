
<?php

global $post; 


$current_page = $post;

?>
					<h1 class="page-title"><?= $current_page->post_title ?></h1>
				
<?php



$content = $current_page->post_content;
$content = apply_filters( 'the_content', $content );
$content = str_replace( ']]>', ']]&gt;', $content );
echo $content;
?>
