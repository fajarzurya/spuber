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
      loaddata();
  });
  </script>
  
   <script type="text/javascript">
$(document).ready(function(){
  //$("#konsentrasi").change(function(){
  $("#kelas").change(function(){
      loaddata();    
  });
});
</script>
   <script type="text/javascript">
$(document).ready(function(){
  $("#tahun").change(function(){
      loaddata();    
  });
});
</script>
 <script type="text/javascript">
     
     function loaddata()
     {
         //var konsentrasi=$("#konsentrasi").val();
		 var kelas=$("#kelas").val();
         var tahun_akademik=$("#tahun").val();
         $.ajax({
        url:"<?php echo base_url();?>keuangan/loadlaporan",
        //data:"tahun_angkatan=" + tahun_akademik +"&konsentrasi="+konsentrasi ,
		data:"tahun_angkatan=" + tahun_akademik +"&kelas="+kelas ,
                success: function(html)
                {
                    $("#table").html(html);
                    //$("#table").hide();
                }
            });
     }
 </script>

 <?php
 echo form_open('keuangan/cetak');
 ?>
 <div class="row">
     <div class="col-md-3">
         <table class="table table-bordered">
             <tr class="success"><th colspan="2">Pilih Data</th></tr>
        <tr>
			<td>Pilih Kelas
				<?php 
					//echo buatcombo('konsentrasi','akademik_konsentrasi','col-sm-14','nama_konsentrasi','konsentrasi_id','',array('id'=>'konsentrasi'));
					echo buatcombo('kelas','akademik_prodi','col-sm-14','nama_prodi','prodi_id','',array('id'=>'kelas'));
				?>
            </td>
		</tr>
        <tr><td>Angkatan
                <select name="tahun" id="tahun" class="form-control">
                    <?php
                    $data=$this->db->get('student_angkatan')->result();
                    foreach ($data as $d)
                    {
                        echo "<option value='$d->angkatan_id'>$d->keterangan</option>";
                    }
                    ?>
                    <option value="0">Semua Angkatan</option>
                </select>
                <?php //echo buatcombo('tahun', 'student_angkatan', '', 'keterangan', 'angkatan_id', '', array('id'=>'tahun'))?></td></tr>
        
    </table>
     </div>
     
         <div class="col-md-4">
     <table class="table table-bordered">
         <tr class="success"><th colspan="2">Keterangan</th></tr>
         <tr><th>01</th><th>BIAYA YANG SUDAH DIBAYAR</th></tr>
         <tr><th>02</th><th>TUNGGAKAN</th></tr>
         <tr><td colspan="2"><input type="submit" class="btn btn-danger btn-sm" value="Cetak Laporan">
             <?php
             echo anchor('keuangan/sms','Kirim Telegram',array('class'=>'btn btn-danger btn-sm','target'=>'new'));
             ?>
             </td></tr>
     </table>
     </div>
 </form>
     <div style="clear: both"></div><hr>
     
     <div id="table"></div>
    
 
 </div>
 
