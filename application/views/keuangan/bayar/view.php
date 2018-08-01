<h2 style="font-weight: normal;"><?php echo $title;?></h2>
<div class="push">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><i class='fa fa-home'></i> <a href="javascript:void(0)">Home</a></li>
        <li class="breadcrumb-item"><?php echo anchor($this->uri->segment(1),$title);?></li>
        <li class="breadcrumb-item active">Data</li>
    </ol>
</div>


<script src="<?php echo base_url();?>assets/js/1.8.2.min.js"></script>
 
  <script>
  $( document ).ready(function() { 
      hidesemster();
	  loadbiaya();
  });
</script>

  <script type="text/javascript">
$(document).ready(function(){
  $("#jenis_pembayaran").change(function(){
       hidesemster();
	   loadbiaya();
  });
});
</script>

<script type="text/javascript">
function loadbiaya()
{
	var jenis_pembayaran=$("#jenis_pembayaran").val();
	var kelas=$("#kelas").val();
	var tahun=$("#tahun").val();
	$.ajax({
	url:"<?php echo base_url();?>keuangan/tampilbiaya",
	data:"jenis_pembayaran=" + jenis_pembayaran + "&kelas=" + kelas + "&tahun=" + tahun,
	success: function(html)
	{
			$("#biaya").html(html);
	}
	});
}
function hidesemster()
{
     var jenis_pembayaran=$("#jenis_pembayaran option:selected").text();
        if(jenis_pembayaran=='SPP')
            {
                $("#semester").show();
				$("#uts_uas").hide();
				//alert($("#kelas").val());
            }
		else if (jenis_pembayaran=='UTS' || jenis_pembayaran=='UAS')
			{
				$("#semester").hide();
				$("#uts_uas").show();
			}
            else
                {
                     $("#semester").hide();
					 $("#uts_uas").hide();
                }
}
</script>
<?php
echo $this->session->flashdata('pesan');
$status=array(0=>'Lunas',1=>'Pembayaran Ke 1',2=>'Pembayaran Ke 2',3=>'Pembayaran Ke 3',4=>'Pembayaran Ke 4');
?>
<div class="row">
<div class="col-sm-6">
<?php
echo form_open('keuangan/pembayaran');
?>   
<table class="table table-bordered">
    <tr class="success"><th colspan="3">Data Siswa </th></tr>
    <tr>
	<td>NIS Siswa</td>
	<td>
		<div class="row">
		<?php echo inputan('text', 'nim','col-sm-10','Masukan NIS ..', 1, '','');?>
		</div>
		<input type="submit" value="OK" name="submit" class="btn btn-danger"> <?php echo anchor('keuangan/reset','Reset',array('class'=>'btn btn-danger'));?>
	</td>
    </tr>
    <tr><td>Nama</td><td>  : <?php echo $statuss=="kosong"?"":strtoupper($profile['nama'])?></td></tr>
    <tr><td>Kelas</td>
	<td> : 
		<?php 
			echo $statuss=="kosong"?"":strtoupper($profile['nama_prodi']);
		?>
		<?php echo $statuss=="kosong"?"":inputan('hidden','kelas','','',0,$profile['prodi_id'],array('id'=>'kelas'));
		echo $statuss=="kosong"?"":inputan('hidden','kelas','','',0,$profile['angkatan_id'],array('id'=>'tahun'));
		?>
	</td></tr>
 
</table>
</form>
</div>

<div class="col-sm-6">
<?php
echo form_open('keuangan/pembayaran');
?>
    <table class="table table-bordered">
        <tr class="success"><th colspan="2">Form Transaksi</th></tr>
        <tr>
			<td width="130">Jenis Pembayaran</td>
			<td>
			<div class="row">
            <?php 
				//echo buatcombo('jenis','keuangan_jenis_bayar','col-md-6','keterangan','jenis_bayar_id','',array('id'=>'jenis_pembayaran'));
				echo buatcombo('jenis','keuangan_jenis_bayar','col-md-6','keterangan','jenis_bayar_id','',array('id'=>'jenis_pembayaran'));
			?>
                <div class="col-md-6">
                    <select name="semester" id="semester" class="form-control">
                        <?php 
                        for($sms=1;$sms<=12;$sms++)
                        {
                            //echo "<option VALUE='$sms'>SEMESTER $sms</option>";
							echo "<option VALUE='$sms'>". getbln($sms) ."</option>";
                        }
                        ?>
                    </select>
					<select name="uts_uas" id="uts_uas" class="form-control">
                        <?php
						$gjl='ganjil';
						$gnp='genap';
                        for($sms=1;$sms<=2;$sms++)
                        {
                            // if($sms==1)
							// {
								// echo "<option VALUE='ganjil'>SEMESTER GANJIL</option>";
							// }
							// else
							// {
								// echo "<option VALUE='genap'>SEMESTER GENAP</option>";
							// }
							echo $sms==1?"<option VALUE='$sms'>SEMESTER ".strtoupper($gjl)."</option>":"<option VALUE='$sms'>SEMESTER ".strtoupper($gnp)."</option>";
                        }
                        ?>
                    </select>
                </div>
			</div>
            </td></tr>
       
        <tr>
			<td>Jumlah Bayar</td>
			<td>
			<div class="row" id="biaya"></div>
				<input type="submit" name="submit2" value="Simpan" class="btn btn-danger"></td></tr>
    </table>
</form>
</div>
</div>
<?php
if($statuss!="kosong"){
?>
<table class="table table-responsive table-hover">
	<thead>
    <tr class="success"><th colspan="7"><div align="center">Riwayat Transaksi Detail</div></th></tr>
    <tr><th width="10">No</th>
        <th width="400">Jenis Pembayaran</th>
        <th width="220">Tanggal</th>
        <th width="160">Jumlah</th>
        <th width="200">Petugas</th><th width="10">Operasi</th></tr>
	</thead>
    <?php
    $i=1;
    
    foreach ($transaksi as $r)
    {
        //$smt=$r->jenis_bayar_id==3?$r->semester:'';
		//$kondisi=$r->jenis_bayar_id==1?$r->semester:''; //variable spp
		$a = $r->jenis_bayar_id;
		if($a==1)
		{
			$kondisi = strtoupper(getbln($r->semester));
		}elseif($a==5 || $a==6)
		{
			$kondisi =$r->semester==0?'GANJIL':'GENAP';
		}else
		{
			$kondisi = '';
		}
        echo "<tr>
            <td>$i</td>
            <td>".  strtoupper($r->keterangan)." ".$kondisi."</td>
            <td>".  tgl_indo($r->tanggal)."</td>
            <td>Rp ".rp((int)$r->jumlah)."</td>
            <td>".  strtoupper($r->nama)."</td>
            <td align='center'>".anchor('keuangan/delete/'.$r->pembayara_detail_id,'<i class="fa fa-trash-o"></i>',array('title'=>'Hapus Transaksi'))."</td></tr>";
			//<td align='center'>".anchor('keuangan/delete/'.$r->pembayara_detail_id,'<i class="fa fa-trash-o"></i>',array('title'=>'Hapus Catatan'))."</td></tr>";
        $i++;
    }
    ?>
</table>

<table class="table table-responsive table-hover">
<thead>
    <tr class="success"><th colspan="7"><div align="center">Riwayat Transaksi</div></th></tr>
    <tr><th width="10">No</th>
        <th width="240">Jenis Pembayaran</th>
		<th width="180">Harus Dibayar</th>
        <th width="180">Sudah Dibayar</th>
        <th width="80">Sisa</th>
        <th width="100">Persentase %</th>
        <th>Keterangan</th></tr>
</thead>
    <?php
    
    // tahun akademik ketika masuk
    $tahun_akademik_id=  getField('student_siswa', 'angkatan_id', 'nim', $nim);
    // konsentrasi
    //$konsentrasi_id=getField('student_mahasiswa', 'konsentrasi_id', 'nim', $nim);
	$kelas = getField('student_siswa', 'prodi_id', 'nim', $nim);
    $no=1;
        foreach ($jenis_bayar as $jb)
        {
            //$jumlah_bayar   =(int) get_biaya_kuliah($tahun_akademik_id, $jb->jenis_bayar_id, $konsentrasi_id, 'jumlah');
			$jumlah_bayar   =(int)get_biaya_sekolah($tahun_akademik_id, $jb->jenis_bayar_id, $kelas, 'jumlah');
            $sudah_bayar    =(int)get_biaya_sudah_bayar($nim, $jb->jenis_bayar_id);
			$sisa           = $jumlah_bayar-$sudah_bayar;
            $ket           = $sisa<=0?'Lunas':'Tunggakan '.rp($sisa);
            echo "<tr><td>$no</td>
                <td>".  strtoupper($jb->keterangan)."</td>
                <td>".rp($jumlah_bayar)."</td>
                <td>".rp($sudah_bayar)."</td>
				<td>".rp($sisa)."</td>
                <td>".  get_persentase_pembayaran($jumlah_bayar, $sudah_bayar)." %</td>
                <td>$ket</td>
                </tr>";
            $no++;
        }
       // get semester aktif
       //$smt_aktif = getField('student_siswa', 'semester_aktif', 'nim', $nim);
        // looping semester
        //for($i=1;$i<=$smt_aktif;$i++)
		for($i=1;$i<=12;$i++)
        {
            //$spp            =   (int) get_biaya_kuliah($tahun_akademik_id, 3, $konsentrasi_id, 'jumlah');
			//$spp            =   (int) get_biaya_sekolah($tahun_akademik_id, 3, $kelas, 'jumlah');
			$spp            =   (int) get_biaya_sekolah($tahun_akademik_id, 1, $kelas, 'jumlah'); //Untuk SPP
            //$spp_udah_bayar =   (int)get_semester_sudah_bayar($nim, $i);
			$spp_udah_bayar =   (int)get_spp_sudah_bayar($nim, $i);
            //$tanggal		= tanggal;
			//$tanggal		= tanggal;
			$sisa           =   $spp-$spp_udah_bayar;
            $keterangan           =   $sisa<=0?'Lunas':'Tunggakan '.$sisa;
            echo "<tr><td>$no</td>
                <td>SPP ".getbln($i)."</td>
                <td>".rp($spp)."</td>
                <td>".rp($spp_udah_bayar)."</td>
				<td>$sisa</td>
                <td>".  rp(get_persentase_pembayaran($spp, $spp_udah_bayar))." %</td>
                <td>$keterangan</td></tr>";
            $no++;
        }
    ?>
    <tr><td colspan="7"><?php echo anchor('keuangan/cetakpersonal','Cetak Data',array('class'=>'btn btn-danger','target'=>'new'))?></td></tr>
</table>

<?php
}
else
{
?>

<?php } ?>

