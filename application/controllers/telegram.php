<?php
class telegram extends CI_Controller
{
/**
 * Bot PHP Telegram ver Curl
 * Lebih Bersih
 * Sample Sederhana untuk Ebook Edisi 3: Membuat Bot Sendiri Menggunakan PHP.
 *
 * Dimodifikasi untuk Ebook II: Telegram Bot PHP dan Database SQL
 *
 * Dibuat oleh Hasanudin HS
 *
 * @hasanudinhs di Telegram dan Twitter
 * Email: banghasan@gmail.com
 *
 * -----------------------
 * Grup @botphp
 * Jika ada pertanyaan jangan via PM
 * langsung ke grup saja.
 * ----------------------
 * diary.php
 * Bot PHP untuk membuat diary sederhana
 * Versi 0.1
 * 10 September 2016, 8 Dzulhijjah 1437 H
 * Last Update : 10 September 2016 00:40 WIB
 *
 * Default adalah poll!
 */

/* buatlah file token.php isinya :

<?php

$token = "isiTokenBotmu";

*/
//require_once 'token.php';

// masukkan bot token di sini
//define('BOT_TOKEN', '590086026:AAGfE5F9UArMVX4WyxMKxt_9L6JsbyeF3xQ');
var $BOT_TOKEN = "590086026:AAGfE5F9UArMVX4WyxMKxt_9L6JsbyeF3xQ";

// versi official telegram bot
//define('API_URL', 'https://api.telegram.org/bot'.BOT_TOKEN.'/');
var $API_URL = 'https://api.telegram.org/bot'.BOT_TOKEN.'/';

// versi 3rd party, biar bisa tanpa https / tanpa SSL.
//define('API_URL', 'https://api.pwrtelegram.xyz/bot'.BOT_TOKEN.'/');
//define('Version', '0.1');
var $Version = '0.1';
//define('LastUpdate', '16 Juli 2018');
var $LastUpdate = '16 Juli 2018';

// ambil databasenya
//require_once 'database.php';

// aktifkan ini jika ingin menampilkan debugging poll
var $debug = true;

function exec_curl_request($handle)
{
    $response = curl_exec($handle);

    if ($response === false) {
        $errno = curl_errno($handle);
        $error = curl_error($handle);
        error_log("Curl returned error $errno: $error\n");
        curl_close($handle);

        return false;
    }

    $http_code = intval(curl_getinfo($handle, CURLINFO_HTTP_CODE));
    curl_close($handle);

    if ($http_code >= 500) {
        // do not wat to DDOS server if something goes wrong
    sleep(10);

        return false;
    } elseif ($http_code != 200) {
        $response = json_decode($response, true);
        error_log("Request has failed with error {$response['error_code']}: {$response['description']}\n");
        if ($http_code == 401) {
            throw new Exception('Invalid access token provided');
        }

        return false;
    } else {
        $response = json_decode($response, true);
        if (isset($response['description'])) {
            error_log("Request was successfull: {$response['description']}\n");
        }
        $response = $response['result'];
    }

    return $response;
}

function apiRequest($method, $parameters = null)
{
    if (!is_string($method)) {
        error_log("Method name must be a string\n");

        return false;
    }

    if (!$parameters) {
        $parameters = [];
    } elseif (!is_array($parameters)) {
        error_log("Parameters must be an array\n");

        return false;
    }

    foreach ($parameters as $key => &$val) {
        // encoding to JSON array parameters, for example reply_markup
    if (!is_numeric($val) && !is_string($val)) {
        $val = json_encode($val);
    }
    }
    $url = API_URL.$method.'?'.http_build_query($parameters);

    $handle = curl_init($url);
    curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($handle, CURLOPT_CONNECTTIMEOUT, 5);
    curl_setopt($handle, CURLOPT_TIMEOUT, 60);
    curl_setopt($handle, CURLOPT_SSL_VERIFYPEER, false);

    return exec_curl_request($handle);
}

function apiRequestJson($method, $parameters)
{
    if (!is_string($method)) {
        error_log("Method name must be a string\n");

        return false;
    }

    if (!$parameters) {
        $parameters = [];
    } elseif (!is_array($parameters)) {
        error_log("Parameters must be an array\n");

        return false;
    }

    $parameters['method'] = $method;

    $handle = curl_init(API_URL);
    curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($handle, CURLOPT_CONNECTTIMEOUT, 5);
    curl_setopt($handle, CURLOPT_TIMEOUT, 60);
    curl_setopt($handle, CURLOPT_POSTFIELDS, json_encode($parameters));
    curl_setopt($handle, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);

    return exec_curl_request($handle);
}

function getUpdates($last_id = null)
{
    $params = [];
    if (!empty($last_id)) {
        $params = ['offset' => $last_id + 1, 'limit' => 1];
    }
  //echo print_r($params, true);
  return apiRequest('getUpdates', $params);
}

// ----------- pantengin mulai ini
function sendMessage($idpesan, $idchat, $pesan)
{
    $data = [
    'chat_id'             => $idchat,
    'text'                => $pesan,
    'parse_mode'          => 'Markdown',
    'reply_to_message_id' => $idpesan,
  ];

    return apiRequest('sendMessage', $data);
}

function processMessage($message)
{
    global $database;
    if ($GLOBALS['debug']) {
        print_r($message);
    }

    if (isset($message['message'])) {
        $sumber = $message['message'];
        $idpesan = $sumber['message_id'];
        $idchat = $sumber['chat']['id'];

        $namamu = $sumber['from']['first_name'];
        $iduser = $sumber['from']['id'];

        if (isset($sumber['text'])) {
            $pesan = $sumber['text'];

            if (preg_match("/^\/view_(\d+)$/i", $pesan, $cocok)) {
                $pesan = "/view $cocok[1]";
            }

            if (preg_match("/^\/hapus_(\d+)$/i", $pesan, $cocok)) {
                $pesan = "/hapus $cocok[1]";
            }

     // print_r($pesan);

      $pecah = explode(' ', $pesan, 2);
            $katapertama = strtolower($pecah[0]);
            switch ($katapertama) {
        case '/start':
          $text = "Selamat Datang `$namamu` di BOT SMP Sepuluh Nopember Sidoarjo\n\nUntuk bantuan ketik: /help";
          break;

        case '/help':
          $text = '💁🏼 Ini adalah *Spuber Bot* ver.`'.Version."`\n";
          $text .= "🎓 Oleh _Fidhya Utami_\n⌛️".lastUPDATE."\n\n";
          $text .= "💌 Berikut menu yang tersedia \n\n";
          $text .= "➕ /daftar `[NIS]` untuk Mendaftarkan ID Telegram dengan BOT SMP Sepuluh Nopember Sidoarjo\n";
          $text .= "🆘 /help Info bantuan ini\n\n";
          break;
		  
        case '/daftar':
          if (isset($pecah[1])) {
              $pesanproses = $pecah[1];
              //$r = diarytambah($iduser, $pesanproses);
			  $r = spuberdaftar($iduser, $pesanproses);
              $text = '😘 Pendaftaran ke sistem sedang di proses\n `$iduser` Sudah berhasil terdaftar di BOT';
          } else {
              $text = '⛔️ *ERROR:* _Pesan yang ditambahkan tidak boleh kosong!_';
              $text .= "\n\nContoh: `/pesan besok aku sahur mau puasa sunnah`";
          }
          break;

        default:
          $text = '😥 _aku tidak mengerti apa maksudmu, namun tetap akan kudengarkan sepenuh hatiku.._';
          break;
      }
        } else {
            $text = 'Ada sesuatu di bola matamu..';
        }

        $hasil = sendMessage($idpesan, $idchat, $text);
        if ($GLOBALS['debug']) {
            // hanya nampak saat metode poll dan debug = true;
      echo 'Pesan yang dikirim: '.$text.PHP_EOL;
            print_r($hasil);
        }
    }
}

// pencetakan versi dan info waktu server, berfungsi jika test hook
//echo 'Ver. '.Version.' OK Start!'.PHP_EOL.date('Y-m-d H:i:s').PHP_EOL;

function printUpdates($result)
{
    foreach ($result as $obj) {
        // echo $obj['message']['text'].PHP_EOL;
    processMessage($obj);
        $last_id = $obj['update_id'];
    }

    return $last_id;
}

// AKTIFKAN INI jika menggunakan metode poll
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
var $last_id = null;
function start_bot()
{
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
}
