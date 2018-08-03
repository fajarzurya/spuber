<h2 style="font-weight: normal;"><?php echo $title;?></h2>
<div class="push">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><i class='fa fa-home'></i> <a href="javascript:void(0)">Home</a></li>
        <li class="breadcrumb-item"><?php echo anchor($this->uri->segment(1),$title);?></li>
        <li class="breadcrumb-item active">Laporan Keuangan</li>
    </ol>
</div>
<?php

$status=array(0=>'Lunas',1=>'Pembayaran Ke 1',2=>'Pembayaran Ke 2',3=>'Pembayaran Ke 3',4=>'Pembayaran Ke 4');
echo form_open('keuangan');
?>
<div class="row">
	<div class="col-md-12 clearfix">
							<div class="card">
                            <ul id="example-tabs" class="nav nav-tabs nav-tabs-neutral" role="tablist" data-background-color="orange">
                                <li class="nav-item"><a class="nav-link active" data-toggle="tab" role="tab">LAPORAN KEUANGAN</a></li>
                            </ul>

                            <div class="card-body">
							<div class="tab-content">
                                <div class="tab-pane active" role="tabpanel">
								
								<!--<table class="table table-bordered">
									<tr class="success"><td colspan="2">PERIODE LAPORAN</td></tr>-->
								<div class="row">
									<div class="col-md-2">
									<label>Tanggal Mulai</label>
									</div>
									<div class="col-md-3">
									<?php echo inputan('text', 'tanggal1','col-xs-3 ','Tanggal Awal', 1, $tanggal1,array('id'=>'datepicker'));?>
									</div>
									<div class="col-md-7"></div>
									<div class="col-md-12">&nbsp;&nbsp;&nbsp;</div>
									<div class="col-md-2">
									<label>Tanggal Sampai</label>
									</div>
									<div class="col-md-3">
									<?php echo inputan('text', 'tanggal2','col-xs-3','Tanggal Akhir', 1, $tanggal2,array('id'=>'datepicker1'));?>
									</div>
								<!--</table>-->
								</div>
								</div>
                            </div>
							<input type="submit" name="submit" value="Preview" class="btn btn-primary  btn-sm"> 
							<?php echo anchor(base_url().'keuangan/laporanpembayaran/'.$tanggal1.'/'.$tanggal2.'/cetak','Cetak',array('class'=>'btn btn-primary   btn-sm','target'=>'_blank'))?>
							</div>    
                            </div>
	</div>
</div>
</form>
<?php
if(isset($_POST['submit']))
{
?>
<div class="card">
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
    //foreach ($transaksi as $r)
	foreach ($jurnal as $r)
    {
        echo "<tr>
            <th>$no</th>
            <th>".  strtoupper($r->nim)."</th>
            <th>".  strtoupper($r->nama)."</th>";
			$jumlah=0;
			foreach($jenis_bayar->result() as $a)
			{
				$sudah_bayar=(int)pivot_laporan($r->nim, $a->jenis_bayar_id, $tanggal1, $tanggal2);
				echo"<td>Rp ".rp($sudah_bayar)."</td>";
				$jumlah=$jumlah+$sudah_bayar;
			}
		echo"<td>".rp((int) $jumlah)."</td></tr>";
        $grandttl=$grandttl+$jumlah;
        $no++;
    }
	echo"<tr>
        <td colspan=".$jenis_bayar->num_rows()."></td>
        <td colspan=3>Grand Total</td><td><b>".rp((int)$grandttl)."</b></td>
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



