<h2 style="font-weight: normal;"><?php echo $title;?></h2>
<div class="push">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><i class='fa fa-home'></i> <a href="javascript:void(0)">Home</a></li>
        <li class="breadcrumb-item"><?php echo anchor($this->uri->segment(1),$title);?></li>
        <li class="breadcrumb-item active">Laporan Keuangan</li>
    </ol>
</div>
<style>
span {
    position: fixed;
    right: 5px;
}
</style>
<?php

$status=array(0=>'Lunas',1=>'Pembayaran Ke 1',2=>'Pembayaran Ke 2',3=>'Pembayaran Ke 3',4=>'Pembayaran Ke 4');
echo form_open('keuangan');
?>
<div class="row">
	<div class="col-md-12 clearfix">
							<div class="card">
                            <ul id="example-tabs" class="nav nav-tabs nav-tabs-neutral" role="tablist" data-background-color="orange">
                                <li class="nav-item"><a class="nav-link active" href="#bulan" data-toggle="tab" role="tab">Laporan Bulanan</a></li>
                                <li class="nav-item"><a class="nav-link" href="#kelas" data-toggle="tab" role="tab">Laporan Per Kelas</a></li>
                            </ul>

                            <div class="card-body">
							<div class="tab-content">
                                <div class="tab-pane active" id="bulan" role="tabpanel" >
								
								<!--<table class="table table-bordered">
									<tr class="success"><td colspan="2">PERIODE LAPORAN</td></tr>-->
								<div class="row">
									<div class="col-md-2">
									<label>Tanggal Mulai</label>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<input type="text" class="form-control date-picker" name="tanggal1" placeholder="Tanggal Awal">
									   </div>
									</div>
									<div class="col-md-7"></div>
									<div class="col-md-12">&nbsp;&nbsp;&nbsp;</div>
									<div class="col-md-2">
									<label>Tanggal Sampai</label>
									</div>
									<div class="col-md-3">
									<div class="form-group">
											<input type="text" class="form-control date-picker" name="tanggal2" placeholder="Tanggal Akhir" >
									   </div>
									</div>
								<!--</table>-->
								</div>
								<input type="submit" name="submit" value="Preview" class="btn btn-primary  btn-sm">
								</div>
								
								
								<!-- KELAS -->
								<div class="tab-pane" id="kelas" role="tabpanel">
								
								<!--<table class="table table-bordered">
									<tr class="success"><td colspan="2">PERIODE LAPORAN</td></tr>-->
								<div class="row">
									<div class="col-md-2">
									<label>Kelas</label>
									</div>
									<div class="col-md-3">
									<?php echo buatcombo('kelas', 'akademik_prodi', '', 'nama_prodi', 'prodi_id', '', array('id'=>'kelas'))?>
									</div>
									<div class="col-md-7"></div>
									<div class="col-md-12"></div>
									<div class="col-md-2">
									<label>Tipe Kelas</label>
									</div>
									<div class="col-md-3">
									<?php echo buatcombo('tipe', 'app_kelas', '', 'keterangan', 'kelas_id', '', array('id'=>'tipe'))?>
									</div>
									<div class="col-md-7"></div>
									<div class="col-md-12"></div>
									<div class="col-md-2">
									<label>Tahun Angkatan</label>
									</div>
									<div class="col-md-3">
									<?php echo buatcombo('tahun_angkatan', 'student_angkatan', '', 'keterangan', 'angkatan_id', '', array('id'=>'tahun_akademik'))?>
									</div>
								<!--</table>-->
								</div>
								<input type="submit" name="submit2" value="Preview" class="btn btn-primary  btn-sm"> 
								</div>
                            </div>
                            </div>
	</div>
	</div>
</div>
</form>

<!-- BULANAN -->
<?php
if(isset($_POST['submit']))
{
?>
<div class="card">
<a class="pull-right" href="laporan/cetakbulan">
	<span class="btn btn-success btn-sm btn-round">
		<i class="fa fa-print"></i>
	</span>
</a><br><br>
<a class="pull-right" href="#">
	<span class="btn btn-primary btn-sm btn-round">
		<i class="fa fa-arrow-up"></i>
	</span>
</a>
<div class="card-body">
							<div class="tab-content">
                                <div class="tab-pane active" role="tabpanel">
<table class="table table-responsive table-hover">
	<thead>
	<?php echo "<tr><th colspan=".($jenis_bayar->num_rows()+4)."><div align='center'>LAPORAN KEUANGAN PERIODE ".strtoupper(getbln(substr($tanggal1,6,2)))."</div></th></tr>";?>
    <tr><th rowspan='2'>No</th>
        <th rowspan='2'>NIS</th>
        <th rowspan='2'>Nama Siswa</th>
		<?php
		foreach ($jenis_bayar->result() as $j)
            {
               echo"<th>".  strtoupper($j->keterangan)."</th>";
            }
		?>
        <th rowspan='2'>Jumlah</th></tr>
	</thead>
    <?php
	//-------------------------
    $no=1;
    $grandttl=0;
	foreach ($jurnal as $r)
    {
        echo "<tr>
            <th>$no</th>
            <th>".  strtoupper($r->nim)."</th>
            <th>".  strtoupper($r->nama)."</th>";
			$jumlah=0;
			$jumlah_jb=array();
			foreach($jenis_bayar->result() as $a)
			{
				$id = $a->jenis_bayar_id;
				$jumlah_jb[$id]=0;
				$sudah_bayar=(int)pivot_laporan($r->nim, $id, $tanggal1, $tanggal2,'');
				$gtsudah_byr=(int)pivot_laporan($r->nim, $id, $tanggal1, $tanggal2,'GT');
				echo"<td>Rp ".rp($sudah_bayar)."</td>";
				$jumlah_jb[$id]=$jumlah_jb[$id]+$gtsudah_byr;
				$jumlah=$jumlah+$sudah_bayar;
			}
		echo"<td>".rp((int) $jumlah)."</td></tr>";
        $grandttl=$grandttl+$jumlah;
        $no++;
    }
	echo"<tr>
        <th colspan=3><div align='right'>Grand Total</div></th>";
		foreach($jenis_bayar->result() as $b)
		{
			echo"<th>Rp ".rp($jumlah_jb[$b->jenis_bayar_id])."</th>";
		}
	echo"<th>".rp((int)$grandttl)."</th>
        </tr>";
	?>
</table>
</div>
</div>
</div>
</div>
<?php } ?>

<!-- KELAS -->
<?php
if(isset($_POST['submit2']))
{
?>
<div class="card">
<a class="pull-right" href="keuangan/export">
	<span class="btn btn-success btn-sm btn-round">
		<i class="fa fa-print"></i>
	</span>
</a><br><br>
<a class="pull-right" href="#">
	<span class="btn btn-primary btn-sm btn-round">
		<i class="fa fa-arrow-up"></i>
	</span>
</a>
<div class="card-body">
							<div class="tab-content">
                                <div class="tab-pane active" role="tabpanel">
<table class="table table-responsive table-hover">
	<thead>
	<?php echo "<tr><th colspan=".($jenis_bayar->num_rows()+6)."><div align='center'>LAPORAN KEUANGAN ".strtoupper($kelasX)." ".$tipeX."</div></th></tr>";?>
    <tr><th rowspan='2'>No</th>
        <th rowspan='2'>NIS</th>
        <th rowspan='2'>Nama Siswa</th>
		<?php
		foreach ($jenis_bayar->result() as $j)
            {
               echo"<th>".  strtoupper($j->keterangan)."</th>";
            }
		?>
        <th rowspan='2'>Jumlah</th>
		<th rowspan='2'>Kredit</th>
		<th rowspan='2'>Keterangan</th>
	</tr>
	</thead>
    <?php
	//-------------------------
    $no=1;
    $grand_jumlah=0;
	$grand_kredit=0;
    //foreach ($transaksi as $r)
	foreach ($nama as $nm)
    {
        echo "<tr>
            <th>$no</th>
            <th>".  strtoupper($nm->nim)."</th>
            <th>".  strtoupper($nm->nama)."</th>";
			$tunggakan=0;
			$jumlah=0;
			foreach($jenis_bayar->result() as $b)
			{
				$harus_bayar=(int)chek_bayar($nm->nim, $b->jenis_bayar_id, 01);
				$sudah_bayar=(int)chek_bayar($nm->nim, $b->jenis_bayar_id, 02);
                $sisa=$harus_bayar-$sudah_bayar;
				$keterangan	= $sisa==0?'Lunas':'Kredit';
				echo"<td>".rp($sudah_bayar)."</td>";
				$jumlah		= $jumlah+$sudah_bayar;
				$tunggakan	= $tunggakan+$sisa;
			}
		echo"<td>".rp((int) $jumlah)."</td>
			<td>".rp((int) $tunggakan)."</td>
			<td>$keterangan</td></tr>";
		$grand_jumlah=$grand_jumlah+$jumlah;
		$grand_kredit=$grand_kredit+$tunggakan;
        $no++;
    }
	echo"<tr>
        <th colspan=".($jenis_bayar->num_rows()+3)."><div align='right'>Grand Total</div></td>
		<th>".rp($grand_jumlah)."</th>
		<th>".rp($grand_kredit)."</th>
		<td></td>
        </tr>";
	?>
</table>
</div>
</div>
</div>
</div>
<?php } ?>

<script type="text/javascript">
function cetak(id,id2)
{
    window.open('http://localhost/akademik/keuangan/cetak/','1397003076569','width=700,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=0,top=0');
}
</script>



