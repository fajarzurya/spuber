<?php

require_once 'telegram_helper.php';

// AKTIFKAN INI jika menggunakan metode poll
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
// AKTIFKAN INI jika menggunakan metode webhook
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/*$content = file_get_contents("php://input");
$update = json_decode($content, true);

if (!$update) {
  // ini jebakan jika ada yang iseng mengirim sesuatu ke hook
  // dan tidak sesuai format JSON harus ditolak!
  exit;
} else {
  // sesuai format JSON, proses pesannya
  processMessage($update);
}*/

/*

Sekian.

*/
?>