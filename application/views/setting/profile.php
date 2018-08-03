<h2 style="font-weight: normal;"><?php echo $title;?></h2>
<div class="push">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><i class='fa fa-home'></i> <a href="javascript:void(0)">Home</a></li>
        <li class="breadcrumb-item"><?php echo anchor($this->uri->segment(1),$title);?></li>
        <li class="breadcrumb-item active">Data</li>
    </ol>
</div>
<?php
echo form_open($this->uri->segment(1).'/profilekampus');
echo "<input type='hidden' name='id' value='$r[id]'>";
$class="class='form-control'";
?>
<div class="row">
	<div class="col-md-12 clearfix">
							<div class="card">
                            <ul id="example-tabs" class="nav nav-tabs nav-tabs-neutral" role="tablist" data-background-color="orange">
                                <li class="nav-item"><a class="nav-link active" href="#biodata" data-toggle="tab" role="tab">Setting</a></li>
                            </ul>

                            <div class="card-body">
							<div class="tab-content">
                                <div class="tab-pane active" id="biodata" role="tabpanel">
								<table class="table table-bordered">
									<tr class="success"><td colspan="2">PROFILE SEKOLAH</td></tr>
									<tr>
									<td width="150">Nama Sekolah</td><td>
										<?php echo inputan('text', 'nama','col-sm-4','Nama Lengkap ..', 1, strtoupper($r['nama_kampus']),'');?>
									</td>
									</tr>
								 
											<tr>
									<td width="150">Alamat Sekolah</td><td>
										<?php echo textarea('alamat', '', 'col-sm-5', 2, strtoupper($r['alamat_kampus']));?>
									</td>
									</tr>
									  <tr>
									<td width="150">No Telepon</td><td>
										<?php echo inputan('text', 'telpon','col-sm-4','No Telpon ..', 1, $r['telpon'],'');?>
									</td>
									</tr>
								</table>		
                                </div>    
                            </div>
							<input type="submit" name="submit" value="Simpan" class="btn btn-danger  btn-sm">
							<?php echo anchor($this->uri->segment(1),'Kembali',array('class'=>'btn btn-danger btn-sm'));?>
    
							</div>    
                            </div>
							</div>
							</div>
</form>