<?php

function daftar($iduser, $nis){
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "spuber";
	$tgl = date('Y-m-d');
	// Create connection
	$conn = mysqli_connect($servername, $username, $password, $dbname);

	if ($conn->connect_error) {
		echo "Connection failed: " . $conn->connect_error;
	}else{
		echo "Connected successfully \n";
	}
	
	$sql = "INSERT INTO telegram (chat_id, nis, tgl_daftar, status)
	VALUES ($iduser, $nis, '$tgl', 'y')";

	if ($conn->query($sql) == TRUE) {
		$hasil =  "Selamat Anda sudah terdaftar\n";
	} else {
		//$hasil = "Error: " . $sql . "\n" . $conn->error . "\n";
		$hasil = "Nomor Induk Siswa '$nis' sudah terdaftar\n";
	}
	return $hasil;
}

?>
