<h2 style="font-weight: normal;"><?php echo $title;?></h2>
<div class="push">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><i class='fa fa-home'></i> <a href="javascript:void(0)">Home</a></li>
        <li class="breadcrumb-item"><?php echo anchor($this->uri->segment(1),$title);?></li>
        <li class="breadcrumb-item active">Entry Record</li>
    </ol>
</div>
<script src="<?php echo base_url();?>assets/js/1.8.2.min.js"></script>
<script>
  $( document ).ready(function() {
    $( "#jurusan" ).hide();
  });
  </script>
  <script>
$(document).ready(function(){
    $("#level").change(function(){
        var level = $("#level").val();  
        if(level==2)
            {
                 $( "#jurusan" ).show();
            }
            else
            {
                   $( "#jurusan" ).hide();  
            }
  });
});
</script>
<?php
echo form_open_multipart($this->uri->segment(1).'/post');
//$level=array(1=>'Admin',2=>'Pihak Jurusan',3=>'Dosen');
$level=array(1=>'Admin',2=>'Bendahara');
$class      ="class='form-control' id='level'";
?>
 <div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">Entry Record</h3>
  </div>
  <div class="panel-body">
<table class="table table-responsive">
    
    <tr>
    <td width="150">Username</td><td>
        <?php echo inputan('text', 'username','col-sm-3','Username ..', 1, '','');?>
    </td>
    </tr>
    <tr>
        <tr>
    <td width="150">Password</td><td>
        <?php echo inputan('password', 'password','col-sm-4','Password ..', 1, '','');?>
    </td>
    </tr>
    <tr>
    <td width="150">Level</td><td>
        <div class="col-sm-3">
        <?php echo form_dropdown('level',$level,'',$class);?>
        </div>
        
        <?php echo buatcombo('prodi', 'akademik_prodi', 'col-sm-3', 'nama_prodi', 'prodi_id', '', array('id'=>'jurusan'))?>
        
    </td>
    </tr>
    <tr>
         <td></td><td colspan="2"> 
            <input type="submit" name="submit" value="Simpan" class="btn btn-primary">
            <?php echo anchor($this->uri->segment(1),'Kembali',array('class'=>'btn btn-primary'));?>
        </td></tr>
    
</table>
  </div></div>
</form>