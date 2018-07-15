<h2 style="font-weight: normal;"><?php echo $title;?></h2>
<div class="push">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><i class='fa fa-home'></i> <a href="javascript:void(0)">Home</a></li>
        <li class="breadcrumb-item"><?php echo anchor($this->uri->segment(1),$title);?></li>
        <li class="breadcrumb-item active">Data</li>
    </ol>
</div>
 
<?php
echo anchor($this->uri->segment(1).'/post','Tambah Data',array('class'=>'btn btn-info'))
?>
                   <div class="dataTable_wrapper"> 
					<table id="example-datatables" class="table table-hover table-responsive">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Keterangan</th>
                                <th>Status</th>
								<th width="20"></th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            <?php
                            $i=1;
                            foreach ($record as $r)
                            {
                            ?>
                            
                            <tr>
                                <td><?php echo $i;?></td>
                                <td><?php echo strtoupper($r->keterangan);?></td>
                                <td><?php echo $r->aktif=='y'?'OPEN':'CLOSED'?></td>
								<td>
                                    <div class="btn-group">
                                        <a href="<?php echo base_url().''.$this->uri->segment(1).'/edit/'.$r->angkatan_id;?>" data-toggle="tooltip" title="Edit" class="btn btn-sm btn-warning"><i class="fa fa-pencil"></i></a>
                                        <a href="<?php echo base_url().''.$this->uri->segment(1).'/delete/'.$r->angkatan_id;?>" data-toggle="tooltip" title="Delete" class="btn btn-sm btn-danger"><i class="fa fa-times"></i></a>
                                                                            </div>
                                </td>
                            </tr>
                            <?php $i++;}?>
                            
                            
                        </tbody>
                    </table>
				</div>
                    <!-- END Datatables -->
                    
