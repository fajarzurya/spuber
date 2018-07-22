 <h2 style="font-weight: normal;"><?php echo $title;?></h2>
<div class="push">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><i class='fa fa-home'></i> <a href="javascript:void(0)">Home</a></li>
        <li class="breadcrumb-item"><?php echo anchor($this->uri->segment(1),$title);?></li>
        <li class="breadcrumb-item active">Edit Record</li>
    </ol>
</div>
 <script src="<?php echo base_url()?>assets/js/jquery.min.js">
</script>
<script>
/*$(document).ready(function(){
  $("#prodi").change(function(){
      var prodi=$("#prodi").val();
      $.ajax({
	url:"<?php echo base_url();?>mahasiswa/tampilkankonsentrasi",
	data:"prodi=" + prodi ,
	success: function(html)
	{
            $("#konsentrasi").html(html);
             
	}
	});
      
        
  });
});
*/
</script>

<?php
echo form_open_multipart($this->uri->segment(1).'/edit');
echo "<input type='hidden' name='id' value='$r[siswa_id]'>";
if($this->session->userdata('level')==1)
{
    $param="";
}
else
{
    $param=array('prodi_id'=>$this->session->userdata('keterangan'));
}
?>
<table class="table table-bordered">
    <tr class="success"><th colspan="2">BIODATA PRIBADI</th><th colspan="2">BIODATA ORANG TUA</th></tr>
    <tr><td width="150">NIS /NAMA</td><td WIDTH="450"> 
        <div class="row">
		 <?php echo inputan('text', 'nis','col-sm-4','Nim ..', 1, $r['nim'],'');?>
         <?php echo inputan('text', 'nama','col-sm-8','Nama ..', 1, $r['nama'],'');?></td>
        </div>
        <td width="150">Nama Ayah, Ibu</td><td>
		 <div class="row">
            <?php echo inputan('text', 'nama_ayah','col-sm-6','Nama Ayah ..', 0, $r['nama_ayah'],'');?>
            <?php echo inputan('text', 'nama_ibu','col-sm-6','Nama Ibu ..', 0, $r['nama_ibu'],'');?>
		 </div>
        </td>
        </tr>
    <tr>
    <td width="050">Jenis Kelamin, Agama</td><td>
        <div class="row">
			<div class="col-md-4">
				<?php
				echo form_dropdown('gender',array('1'=>'Laki Laki','2'=>'Perempuan'),$r['gender'],"class='form-control'");
				?>
			</div>
			<?php echo editcombo('agama','app_agama','col-sm-4','keterangan','agama_id','','',$r['agama_id']); ?>
		</div>
    </td>
    <td>Pekerjaan Ayah ,Ibu</td>
    <td>
        <div class="row">
			<?php echo editcombo('pekerjan_ayah','app_pekerjaan','col-sm-6','keterangan','pekerjaan_id','','',$r['pekerjaan_id_ayah']); ?>
			<?php echo editcombo('pekerjaan_ibu','app_pekerjaan','col-sm-6','keterangan','pekerjaan_id','','',$r['pekerjaan_id_ibu']); ?>
		</div>
    </td>
    </tr>  
    <tr>
    <td width="050">Tempat ,Tanggal Lahir</td><td>
       <div class="row">
	    <?php echo inputan('text', 'tempat_lahir','col-sm-8','Tempat Lahir ..', 0, $r['tempat_lahir'],'');?>
        <div class="datepicker-container">
		 <div class="form-group">
			<input type="text" class="form-control date-picker" value="<?php echo $r['tanggal_lahir'] ?>" data-datepicker-color="primary">
		 </div>
		</div>
		<?php echo inputan('text', 'tanggal_lahir','col-sm-4','Tanggal Lahir ..', 0, $r['tanggal_lahir'],array('id'=>'datepicker'));?>
	   </div>
    </td>
    <td>Alamat Ayah, Ibu</td>
    <td>
		<div class="row">
		 <?php echo textarea('alamat_ayah', '', 'col-sm-6', 3, $r['alamat_ayah'])?>
         <?php echo textarea('alamat_ibu', '', 'col-sm-6', 3, $r['alamat_ibu'])?>
		</div>
    </td>
    </tr>
    <tr>
    <td width="050">Kelas</td><td>
       <div class="row">
            <?php
            //$prodi=  getField('akademik_konsentrasi', 'prodi_id', 'konsentrasi_id', $r['konsentrasi_id'])
            ?>
        <?php //echo buatcombo('prodi', 'akademik_prodi', '', 'nama_prodi', 'prodi_id', $param, array('id'=>'prodi'))?>
		<?php echo editcombo('kelas','akademik_prodi','col-sm-6','nama_prodi','prodi_id','','',$r['prodi_id']); ?>
		<?php echo editcombo('tipe kelas','app_kelas','col-sm-3','keterangan','kelas_id','','',$r['kelas_id']); ?>
        </div>
	   </div>
    </td>
    <td>Penghasilan Ayah, Ibu</td>
    <td>
        <?php
        $penghasilan=array(0=>'Satu Juta s/d dua juta',2=>'Dua Juta s/d Tiga Juta',3=>'Tiga Juta Lebih')
        ?>
        <div class="row">
			<div class="col-sm-6">
				<?php echo form_dropdown('penghasilan_ayah',$penghasilan,$r['penghasilan_ayah'],"class='form-control'");?>
			</div>
			<div class="col-sm-6">
				<?php echo form_dropdown('penghasilan_ibu',$penghasilan,$r['penghasilan_ibu'],"class='form-control'");?>
			</div>
		</div>
    </td>
    
    </tr>
    
    
    <tr>
    <td width="050">Alamat</td><td>
        <?php echo textarea('alamat', '', 'col-sm-02', 1, $r['alamat']);?>
    </td>
    <td>No Hp Ortu</td><td>
        <div class="row">
			<?php echo inputan('text', 'no_hp_ortu','col-sm-7','No Hp Orang Tua ..', 0, $r['no_hp_ortu'],'');?>
		</div>
    </td>
	</tr>
	<tr>
	<td colspan="4"> 
            <input type="submit" name="submit" value="Simpan" class="btn btn-danger  btn-sm">
            <?php echo anchor($this->uri->segment(1),'Kembali',array('class'=>'btn btn-danger btn-sm'));?>
        </td></tr>
    
</table>
</form>

