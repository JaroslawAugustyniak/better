<?php
/**
 * Plugin Name: Sitemap All
 * Plugin URI: https://example.com
 * Description: Generuje XML sitemap zawierającą wszystkie typy wpisów: sitemap_all.xml
 * Version: 1.0.1
 * Author: Jarosław Augustyniak
 * Text Domain: sitemap-all
 * Domain Path: /languages
 * Requires at least: 5.0
 * Requires PHP: 7.2
 */

if (!defined('ABSPATH')) {
    exit;
}

class Sitemap_All {
    public function __construct() {
        add_action('init', [$this, 'handle_sitemap']);
    }

    public function handle_sitemap() {
        if (!isset($_SERVER['REQUEST_URI'])) {
            return;
        }

        // Sprawdź czy request jest do sitemap_all.xml
        if (strpos($_SERVER['REQUEST_URI'], '/sitemap_all.xml') === false) {
            return;
        }

        header('Content-Type: application/xml; charset=UTF-8');
        header('Cache-Control: public, max-age=3600');

        echo $this->generate_sitemap();
        exit;
    }

    private function generate_sitemap() {
        $xml = '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
        $xml .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . "\n";

        // Pobierz wszystkie publiczne post types
        $post_types = get_post_types(['public' => true], 'names');

        // Odfiltruj attachment i inne
        $excluded = ['attachment', 'wp_block', 'wp_template', 'news', 
        'slider', 
        'mainpage', 
		'comment',
		'video',
		'static',
		'faqs',
		'instagram',
		'seo',
		'team'];
        $post_types = array_diff($post_types, $excluded);

        // Dla każdego typu pobierz opublikowane wpisy
        foreach ($post_types as $post_type) {
            $posts = get_posts([
                'post_type'      => $post_type,
                'posts_per_page' => -1,
                'post_status'    => 'publish',
            ]);

            foreach ($posts as $post) {
                $url = get_permalink($post->ID);
                if ($url) {
                    $xml .= "\t<url>\n";
                    $xml .= "\t\t<loc>" . esc_url($url) . "</loc>\n";
                    $xml .= "\t\t<lastmod>" . get_the_modified_date('Y-m-d', $post->ID) . "</lastmod>\n";
                    $xml .= "\t\t<changefreq>monthly</changefreq>\n";
                    $xml .= "\t\t<priority>0.8</priority>\n";
                    $xml .= "\t</url>\n";
                }
            }
        }

        $xml .= '</urlset>';
        return $xml;
    }
}

new Sitemap_All();
