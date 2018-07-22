<h2 style="font-weight: normal;"><?php echo $title;?></h2>
<div class="push">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><i class='fa fa-home'></i> <a href="javascript:void(0)">Home</a></li>
        <li class="breadcrumb-item"><?php echo anchor($this->uri->segment(1),$title);?></li>
        <li class="breadcrumb-item active">Entry Record</li>
    </ol>
</div>
 
  <script src="<?php echo base_url()?>assets/js/jquery.min.js"> </script>

<script>
$(document).ready(function(){
          loadjurusan();  
  });
</script>

<script type="text/javascript">
function loadjurusan()
{
     var prodi=$("#prodi").val();   
      $.ajax({
	url:"<?php echo base_url();?>siswa/tampilkankonsentrasi",
	//url:"<?php echo base_url();?>mahasiswa/tampilkankonsentrasi",
	data:"prodi=" + prodi ,
	success: function(html)
	{
            $("#konsentrasi").html(html);
             var konsentrasi=$("#konsentrasi").val();
	}
	});
}
</script>
<script>
$(document).ready(function(){
  $("#prodi").change(function(){
     
        loadjurusan();
  });
});
</script>
<?php
echo $this->session->flashdata('pesan');
echo form_open_multipart($this->uri->segment(1).'/post');
if($this->session->userdata('level')==1)
{
    $param="";
}
else
{
    $param=array('prodi_id'=>$this->session->userdata('keterangan'));
}
?>
 <div class="row">
                        <div class="col-md-12 clearfix">
							<div class="card">
                            <ul id="example-tabs" class="nav nav-tabs nav-tabs-neutral" role="tablist" data-background-color="orange">
                                <li class="nav-item"><a class="nav-link active" href="#biodata" data-toggle="tab" role="tab">Biodata</a></li>
                                <li class="nav-item"><a class="nav-link" href="#orangtua" data-toggle="tab" role="tab">Orangtua</a></li>
                            </ul>

                            <div class="card-body">
							<div class="tab-content">
                                <div class="tab-pane active" id="biodata" role="tabpanel">
                                    <table class="table table-bordered">
                                        <tr class="success"><th colspan="2">BIODATA</th></tr>
                                        <tr><td width="150">NIS, Nama</td>
                                            <td>
												<div class="row">
												  <?php echo inputan('text', 'nis','col-sm-3','NIS ..', 1, '','');?>
                                                  <?php echo inputan('text', 'nama','col-sm-6','Nama ..', 1, '','');?>
												<div>
                                            </td></tr>
                                        <tr><td>Jenis Kelamin</td>
                                            <td>
												<div class="row">
												 <div class="col-sm-2">
													<?php  echo form_dropdown('gender',array('1'=>'Laki Laki','2'=>'Perempuan'),'',"class='form-control'");?>
												</div></div>
											</td></tr>
										<tr><td>Agama</td>
											<td>
												<div class="row">
													<?php echo buatcombo('agama','app_agama','col-sm-2','keterangan','agama_id','',''); ?>
												</div>
											</td></tr>
                                        <tr><td>Tempat, Tanggal Lahir</td>
                                            <td>
												<div class="row">
													<?php echo inputan('text', 'tempat_lahir','col-sm-4','Tempat Lahir ..', 0, '','');?>
													<?php echo inputan('text', 'tanggal_lahir','col-sm-2','Tanggal Lahir ..', 0, '',array('id'=>'datepicker'));?>
												</div>
                                            </td></tr>
                                       <tr><td>Kelas</td>
                                           <td>
                                               <div class="row">
                                                  <?php echo buatcombo('kelas', 'akademik_prodi', 'col-sm-3', 'nama_prodi', 'prodi_id', $param, array('id'=>'prodi'))?>
												  <?php echo buatcombo('tipe kelas','app_kelas','col-sm-2','keterangan','kelas_id','',''); ?>
												</div></div>
											</td>
										</tr>
                                        <tr><td>Alamat</td>
											<td> <?php echo textarea('alamat', '', 'col-sm-02', 3, '');?>
											</td>
										</tr>
										<tr><td>Tahun Agkatan</td><td>
                                            <div class="row">
												<?php echo buatcombo('tahun_angkatan','student_angkatan','col-sm-2','keterangan','angkatan_id','',''); ?>
											</div>
                                            </td></tr>
                                    </table>   
                                </div>
                                
                                
                                <div class="tab-pane" id="orangtua" role="tabpanel">
                                    <table class="table table-bordered">
                                        <tr class="success"><th colspan="2">ORANG TUA</th></tr>
                                        <tr><td width="150">Nama Ayah, Ibu</td>
                                            <td>
												<div class="row">
													<?php echo inputan('text', 'nama_ayah','col-sm-6','Nama Ayah ..', 0, '','');?>
													<?php echo inputan('text', 'nama_ibu','col-sm-6','Nama Ibu ..', 0, '','');?>
												</div>
                                            </td></tr>
                                        <tr><td>Pekerjaan Ayah, Ibu</td>
                                            <td>
												<div class="row">
													<?php echo buatcombo('pekerjan_ayah','app_pekerjaan','col-sm-4','keterangan','pekerjaan_id','',''); ?>
													<?php echo buatcombo('pekerjaan_ibu','app_pekerjaan','col-sm-4','keterangan','pekerjaan_id','',''); ?>
												</div>
                                            </td></tr>
                                        <tr><td>Alamat Ayah, Ibu</td>
                                            <td>
                                                <div class="row">
													<?php echo textarea('alamat_ayah', '', 'col-sm-6', 2, '')?>
													<?php echo textarea('alamat_ibu', '', 'col-sm-6', 2, '')?>
												</div>
                                            </td></tr>
                                        <tr><td>Penghasilan Ayah, Ibu</td>
                                            <td>
                                                <?php
                                                $penghasilan=array(0=>'Satu Juta s/d dua juta',2=>'Dua Juta s/d Tiga Juta',3=>'Tiga Juta Lebih')
                                                ?>
												<div class="row">
													<div class="col-sm-4">
														<?php echo form_dropdown('penghasilan_ayah',$penghasilan,'',"class='form-control'");?>
													</div>
													<div class="col-sm-4">
														<?php echo form_dropdown('penghasilan_ibu',$penghasilan,'',"class='form-control'");?>
													</div>
												</div>
                                            </td></tr>
                                        <tr><td>No HP Orang Tua</td>
                                            <td>
                                                <div class="row">
													<?php echo inputan('text', 'no_hp_ortu','col-sm-3','No Hp Orang Tua ..', 0, '','');?>
												</div>
                                            </td></tr>
                                    </table>		
                                </div>    
                            </div>
							<input type="submit" name="submit" value="Simpan" class="btn btn-danger  btn-sm">
								<?php echo anchor($this->uri->segment(1),'Kembali',array('class'=>'btn btn-danger btn-sm'));?>
							</div>
                        </div>
</form>

