<h2 style="font-weight: normal;"><?php echo $title;?></h2>
<div class="push">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><i class='fa fa-home'></i> <a href="javascript:void(0)">Home</a></li>
        <li class="breadcrumb-item"><?php echo anchor($this->uri->segment(1),$title);?></li>
        <li class="breadcrumb-item active">Data</li>
    </ol>
</div>
 
 <script src="<?php echo base_url()?>assets/js/jquery.min.js">
</script>

<script>
$(document).ready(function(){
			loadsiswa();
  });
</script>

<script>
$(document).ready(function(){
  $("#prodi").change(function(){
	  loadsiswa();
  });
});
</script>

<script>
$(document).ready(function(){
  $("#tipe").change(function(){
	  loadsiswa();
  });
});
</script>

<script>
$(document).ready(function(){
  $("#tahun_angkatan").change(function(){
      loadkelas();
  });
});
</script>

<script type="text/javascript">
function loadsiswa()
{
    //var konsentrasi=$("#konsentrasi").val();
	var prodi=$("#prodi").val();
	var tipe=$("#tipe").val();
	//var prodi=$("#prodi").val();
    var tahun_angkatan=$("#tahun_angkatan").val();
    $.ajax({
    url:"<?php echo base_url();?>siswa/tampilsiswa",
	//url:"<?php echo base_url();?>mahasiswa/tampilsiswa",
    //data:"konsentrasi=" + konsentrasi + "&tahun_angkatan=" + tahun_angkatan ,
	data:"prodi=" + prodi + "&tahun_angkatan=" + tahun_angkatan + "&tipe=" + tipe ,
    //data:"prodi=" + prodi + "&tahun_angkatan=" + tahun_angkatan ,
	success: function(html)
       {
          $("#siswa").html(html);
       }
       });
}
</script>

<script type="text/javascript">
//function loadjurusan()
function loadkelas()
{
    var prodi=$("#prodi").val();
    $.ajax({
	//url:"<?php echo base_url();?>mahasiswa/tampilkankonsentrasi",
	url:"<?php echo base_url();?>siswa/tampilkelas",
	//url:"<?php echo base_url();?>mahasiswa/tampilkelas",
	data:"prodi=" + prodi ,
	success: function(html)
	{
            //$("#konsentrasi").html(html);
			$("#prodi").html(html);
            //loadmahasiswa();
			loadsiswa();
            
	}
	});
}
</script>

<script type="text/javascript">
//function loadjurusan()
function loadtipe()
{
    var tipe=$("#tipe").val();
    $.ajax({
	url:"<?php echo base_url();?>siswa/tampiltipe",
	data:"tipe=" + tipe ,
	success: function(html)
	{
			$("#tipe").html(html);
			loadsiswa();
            
	}
	});
}
</script>

<script type="text/javascript">
function hapus(id)
{
    
    $.ajax({
	url:"<?php echo base_url();?>siswa/delete",
	//url:"<?php echo base_url();?>mahasiswa/delete",
	data:"id=" + id ,
	success: function(html)
	{
            $("#hide"+id).hide(300);   
	}
	});
   
}
</script>
<?php
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
<div class="col-sm-3">
    
    <table class="table table-bordered">
    <tr><td>Kelas<?php echo buatcombo('prodi', 'akademik_prodi', '', 'nama_prodi', 'prodi_id', $param, array('id'=>'prodi'))?></td></tr>
	<tr><td>Tipe<?php echo buatcombo('tipe', 'app_kelas', '','keterangan', 'kelas_id', '', array('id'=>'tipe'))?></td></tr>
	<?php //echo buatcombo('tipe kelas','app_kelas','col-sm-2','keterangan','kelas_id','',''); ?>
    <tr><td>Tahun Angkatan
            <?php echo buatcombo('tahun_angkatan', 'student_angkatan', '', 'keterangan', 'angkatan_id', '', array('id'=>'tahun_angkatan'))?>
        </td></tr>
    <tr><td><?php echo anchor('siswa/post','Input Data',array('class'=>'btn btn-primary  btn-sm'));?> <?php //echo anchor('','Cetak Data',array('class'=>'btn btn-primary  btn-sm'));?></td></tr>
</table>
</div>

<div class="col-sm-9" id="siswa">
	<!--<table class="table table-bordered" id="siswa">
    </table>
	<//?php echo $this->pagination->create_links(); ?>-->
</div>
</div>

