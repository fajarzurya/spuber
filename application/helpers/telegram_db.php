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
        'charset' => 'utf8',
		'logging' => true,
    ]);

// fungsi untuk daftar ke sistem
function daftar($iduser, $nis)
	// {
		// global $database;
		// $dft = $database->debug()->insert('telegram', [
        // 'chat_id'    => $iduser,
		// 'nis' => $nis,
        // 'tgl_daftar' => date('Y-m-d'),
        // 'status' => 'y',
    // ]);
    // return $dft;
	{
		global $database;
		$dft = $database->debug()->insert('telegram', [
        'chat_id'    => '01',
		'nis' => '01',
        'status' => 'y',
    ]);
    return $dft;
	}

function err()
	{
		global $database;
		$a = $database->debug()->select('telegram', [
        'chat_id',
		'nis',
        'tgl_daftar',
        'status',
    ],[
		'AND' => [
			'status' => 'y',
		],
	]);
    $jumlah = count($a);
	if($jumlah>0)
	{
		$hasil = "\n ABC";
	}else{
		$hasil = "Tidak ada data";
	}
	return $hasil;
	}
?>
