<?php

require_once 'telegram_helper.php';

// ambil databasenya
require_once 'telegram_db.php';

// AKTIFKAN INI jika menggunakan metode poll
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo 'SpuberBot Ver. '.myVERSI.' OK Start!'.PHP_EOL.date('Y-m-d H:i:s').PHP_EOL;
$last_id = null;
while (true) {
    $result = getUpdates($last_id);
    if (!empty($result)) {
        echo '+';
        $last_id = printUpdates($result);
    } else {
        echo '-';
    }

    sleep(1);
}
?>