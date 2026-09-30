<?php
/**
 * Plugin Name: Custom YouTube Cover Block
 * Description: Dodaje blok z customową okładką dla wideo YouTube.
 * Version: 1.0.0
 * Author: Jarosław AUgustyniak
 */

if ( ! defined( 'ABSPATH' ) ) exit;

function cyb_register_block_init() {
    register_block_type( __DIR__ );
}
add_action( 'init', 'cyb_register_block_init' );

// Skrypt frontendowy do obsługi kliknięcia
function cyb_enqueue_frontend_assets() {
    if ( ! is_admin() ) {
        wp_enqueue_script(
            'cyb-frontend-script',
            plugins_url( 'frontend.js', __FILE__ ),
            array(),
            '1.0',
            true
        );
    }
}
add_action( 'wp_enqueue_scripts', 'cyb_enqueue_frontend_assets' );