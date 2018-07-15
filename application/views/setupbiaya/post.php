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
 
 function simpan(id)
 {
     var jumlah=$("#jumlah"+id).val();
     $.ajax({
        url:"<?php echo base_url();?>setupbiaya/simpan",
		//url:"<?php echo base_url();?>setupbiayakuliah/simpan",
        data:"jumlah=" + jumlah + "&id=" + id  ,
                success: function(html)
                {
                    //loaddata();
                }
            });
 }
 
 function loaddata()
 {
     //var konsentrasi=$("#konsentrasi").val();
	 var kelas=$("#kelas").val();
     $.ajax({
        url:"<?php echo base_url();?>setupbiaya/loadform",
		//url:"<?php echo base_url();?>setupbiayakuliah/loadform",
        //data:"konsentrasi=" + konsentrasi  ,
		data:"kelas=" + kelas  ,
                success: function(html)
                {
                    $("#table").html(html);
                }
            });
 }
 </script>
 
<div class="row"> 
<div class="col-sm-3">
    <table class="table table-bordered">
        <tr><th>Pilih Kelas</th></tr>
        <tr><td><input  type="text" value="<?php echo $tahun_ajrn['keterangan'];?>" class="form-control" disabled=""></td></tr>
        <tr><td>
            <div class="col-sm-13">
                <select id="kelas" class="form-control">
                <?php
                foreach ($kelas as $k)
                {
                    echo "<option value='$k->prodi_id'>".strtoupper($k->nama_prodi)."</option>";
                }
                ?>
            </select>
            </div>
            </td></tr>
        <tr><td><?php echo anchor('setupbiaya','Kembali',array('class'=>'btn btn-primary'))?></td></tr>
    </table>
</div>

<div class="col-md-9">
    <table class="table table-bordered" id="table"></table>
</div>
</div>