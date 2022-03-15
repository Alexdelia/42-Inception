<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('MARIADB_DATABASE' ));

/** MySQL database username */
define( 'DB_USER', getenv('WP_ADMIN_USER' ));

/** MySQL database password */
define( 'DB_PASSWORD', getenv('WP_ADMIN_PWD' ) );

/** MySQL hostname */
define( 'DB_HOST', getenv('MARIADB_HOST' ) );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '<|leRHu3%R-M7y_RiA-n.(+vY8eV=*FDf(^ScB$v~}Z!T(v_fKSqF pAo#$zA*!z');
define('SECURE_AUTH_KEY',  'GHktGa-&vFT7dmKfzLY,Y2|Jn1bD$X{Fh|#go|Bt<z{ <495Gpuf*?zY}glUM9eD');
define('LOGGED_IN_KEY',    'MD]sejaz+2x!<za|^x{3&Vlk,!0<9~8):oxhOPH,{A3mR5:[is:14Xv!.FJltolb');
define('NONCE_KEY',        'wzAwgN7h&tXFT;Z3,eg2Pn.v+1SvIfi3q+(7+7/F_.I^#(@*/[Ka~5;#I`hi-Q*U');
define('AUTH_SALT',        '_nDi[AnmYoG|OU3dI1` +|QT+q?~_2Ccxo[s$g|!890RF=6p8mM4sv[*Q+ Yx|5P');
define('SECURE_AUTH_SALT', 'k4dc=?CwQJ| YxB^d5nOQ ~Z/}}8/nW+k!ns-LCpB-|[t|^be[MdDB506p]Tw)]v');
define('LOGGED_IN_SALT',   'rEc3T=n8d>ydbLc%_QS|$)TY3&L=YsU,mp^>ngPuD,}Rq((cU4R#g[b0+6DH5n98');
define('NONCE_SALT',       '|M6V-*z+y,r>jaYs}+L2c@u}s0`5m;N%K+j{k,E[^)~uF(,BODs.9c-1;un|r-v2');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
