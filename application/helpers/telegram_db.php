<?php

/*
* Ebook II: Telegram Bot PHP dan Database SQL
* oleh bang Hasan ( @hasanudinhs )
*
* Fungsi Database untuk Diary Bot Telegram
*
*/

// masukkan database framework nya
require_once 'Medoo.php';
//require 'vendor/autoload.php';
 
// Using Medoo namespace
use Medoo\Medoo;

// koneksikan ke database

// ini contoh menggunakan SQLite
    // $database = new medoo([
        // 'database_type' => 'sqlite',
        // 'database_file' => 'diary.db',
    // ]);

// uncomment ini jika menggunakan mySQL atau mariaDB
// sesuaikan nama database, host, user, dan passwordnya

    $database = new Medoo([
        'database_type' => 'mysql',
        'database_name' => 'spuber',
        'server' => 'localhost',
        'username' => 'root',
        'password' => '',
        'charset' => 'utf8'
    ]);

// fungsi untuk daftar ke sistem
function daftar($iduser, $nis)
	{
		global $database;
		$dft = $database->debug()->insert('telegram', [
        'chat_id'    => $iduser,
		'nis' => $nis,
        'tgl_daftar' => date('Y-m-d'),
        'status' => 'y',
    ]);
    return $dft;
	}	
	
?>
