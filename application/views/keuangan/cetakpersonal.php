<body onload="window.print()">
    
</body><style type="text/css">
    body
    {
        font-family: sans-serif;
        font-size: 14px;
    }
    th{
        padding: 5px;
        font-weight: bold;
        font-size: 12px;
    }
    td{
        font-size: 12px;
    }
    h2{
        text-align: center;
        margin-bottom: -6px;
    }
	h3{
        text-align: center;
        margin-bottom: -6px;
    }
    .potong
    {
        page-break-after:always;
    }
</style>
<table border=0>

	<tr><td rowspan=3><img src="<?php echo base_url();?>assets/images/logo10nop2.png" width="120%"></td><td colspan=2><h2>SMP SEPULUH NOPEMBER SIDOARJO</h2></td></tr>
	<tr><td><h3>Jl.Siwalanpanji-Buduran-Sidoarjo</h3></td></tr>
	<tr><td colspan=2><h3>Telp. 031-8061010</h3></td></tr>
	<tr><td colspan=2><hr style="color: black;"></td></tr>
	<tr><td></td><td><h2 align="center">KUITANSI BUKTI PEMBAYARAN</h2></td></tr>
	<tr><td colspan=2><hr style="color: black;"></td></tr>
    <tr><td width="100">NIS</td><td colspan=2>: <?php echo strtoupper($biodata['nim'])?></td></tr>
    <tr><td>NAMA</td><td colspan=5>: <?php echo strtoupper($biodata['nama'])?></td></tr>
    <tr><td>KELAS</td><td colspan=5>: <?php echo strtoupper($biodata['nama_prodi'])?></td></tr>
	<tr>
		<td colspan=2>
		<table border=1 cellspacing=1 cellpadding=1>
		<tr>
			<th width="10">No</th>
			<th width="500">Jenis Pembayaran</th>
			<th width="160">Jumlah Bayar</th>
			<th width="200">Sudah Bayar</th>
			<th width="150">Sisa</th>
		</tr>
        
		<?php
		// tahun akademik ketika masuk
		//$tahun_akademik_id=  getField('student_mahasiswa', 'angkatan_id', 'nim', $biodata['nim']);
		$tahun_akademik_id=  getField('student_siswa', 'angkatan_id', 'nim', $biodata['nim']);
		// konsentrasi
		//$konsentrasi_id=getField('student_mahasiswa', 'konsentrasi_id', 'nim', $biodata['nim']);
		//$kelas=getField('student_mahasiswa', 'prodi_id', 'nim', $biodata['nim']);
		$kelas=getField('student_siswa', 'prodi_id', 'nim', $biodata['nim']);
		$no=1;
		$sisa_total=0;
			foreach ($jenis_bayar as $jb)
			{
				//$jumlah_bayar   =(int) get_biaya_kuliah($tahun_akademik_id, $jb->jenis_bayar_id, $konsentrasi_id, 'jumlah');
				$jumlah_bayar   =(int) get_biaya_sekolah($tahun_akademik_id, $jb->jenis_bayar_id, $kelas, 'jumlah');
				$sudah_bayar    = (int)get_biaya_sudah_bayar($biodata['nim'], $jb->jenis_bayar_id);
				$sisa           = $jumlah_bayar-$sudah_bayar;
				$ket           = $sisa<=0?'Lunas':'Tunggakan '.rp($sisa);
				echo "<tr><td>$no</td>
					<td>".  strtoupper($jb->keterangan)."</td>
					<td>".rp($jumlah_bayar)."</td>
					<td>".rp($sudah_bayar)."</td>
					<td>".rp($sisa)."</td>
					</tr>";
				$no++;
				$sisa_total=$sisa_total+$sisa;
			}
			// looping semester
			for($i=1;$i<=$semester;$i++)
			{
				//$spp            =   (int) get_biaya_kuliah($tahun_akademik_id, 3, $konsentrasi_id, 'jumlah');
				$spp            =   (int) get_biaya_sekolah($tahun_akademik_id, 1, $kelas, 'jumlah');
				$spp_udah_bayar =   (int)get_spp_sudah_bayar($biodata['nim'], $i);
				$sisa           =   $spp-$spp_udah_bayar;
				$keterangan           =   $sisa<=0?'Lunas':'Tunggakan '.$sisa;
				echo "<tr><td>$no</td>
					<td>SPP BULAN ".strtoupper(getbln($i))."</td>
					<td>".rp($spp)."</td>
					<td>".rp($spp_udah_bayar)."</td>
					<td>".rp($sisa)."</td>";
				$sisa_total=$sisa_total+$sisa;
				$no++;
			}
		?>
		<tr><td colspan="4" align="left">Total Yang Belum Dibayar</td><td><?php echo  rp($sisa_total);?></td></tr>
		</table>
		</td>
	</tr>
</table>

<br><br>
Sidoarjo, <?php echo tgl_indo(substr(waktu(), 0,10))?><br>
Bagian Keuangan<BR></br><br><br><br>
(...........................)