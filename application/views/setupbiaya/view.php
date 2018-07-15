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
  $("#tahun_akademik").change(function(){
      loaddata();
      
  });
});
</script>
  
 <script type="text/javascript">
 
 function loaddata()
 {
     var tahun_akademik=$("#tahun_akademik").val();
     $.ajax({
        url:"<?php echo base_url();?>setupbiaya/loaddata",
		//url:"<?php echo base_url();?>setupbiayakuliah/loaddata",
        data:"tahun_akademik=" + tahun_akademik  ,
                success: function(html)
                {
                    $("#table").html(html);
                }
            });
 }
 </script>
<div class="row">
<div class="col-sm-3">
    <table class="table table-responsive">
        <tr class="success"><th>Pilih Data</th></tr>
        <tr><td>Tahun Akademik
              <?php echo buatcombo('tahun_angkatan', 'student_angkatan', '', 'keterangan', 'angkatan_id', '', array('id'=>'tahun_akademik'))?>
            </td></tr>
         <tr><td><?php echo anchor('setupbiaya/post','Setup',array('class'=>'btn btn-primary'))?> <?php //echo anchor('','Cetak',array('class'=>'btn btn-primary'))?></td></tr>
    </table>
</div>

<div class="col-sm-9">
    <table class="table table-responsive" id="table">
</table>
</div>
</div>