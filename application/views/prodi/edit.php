<h2 style="font-weight: normal;"><?php echo $title;?></h2>
<div class="push">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><i class='fa fa-home'></i> <a href="javascript:void(0)">Home</a></li>
        <li class="breadcrumb-item"><?php echo anchor($this->uri->segment(1),$title);?></li>
        <li class="breadcrumb-item active">Edit Record</li>
    </ol>
</div>
     <?php
echo form_open($this->uri->segment(1).'/edit');
echo "<input type='hidden' name='id' value='$r[prodi_id]'>";
?>
 <div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">Edit Record</h3>
  </div>
  <div class="panel-body">
<table class="table table-responsive">
   
    <tr>
    <td width="150">Nama Kelas</td><td>
        <?php echo inputan('text', 'nama','col-sm-4','Nama Kelas ..', 1, $r['nama_prodi'],'');?>
    </td>
    </tr>
    <tr>
         <td></td><td colspan="2"> 
            <input type="submit" name="submit" value="Edit" class="btn btn-primary">
            <?php echo anchor($this->uri->segment(1),'Kembali',array('class'=>'btn btn-primary'));?>
        </td></tr>
    
</table>
  </div></div>
</form>