<h2 style="font-weight: normal;"><?php echo $title;?></h2>
<div class="push">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><i class='fa fa-home'></i> <a href="javascript:void(0)">Home</a></li>
        <li class="breadcrumb-item"><?php echo anchor($this->uri->segment(1),$title);?></li>
        <li class="breadcrumb-item active">Data</li>
    </ol>
</div>
 
 <?php
echo anchor($this->uri->segment(1).'/post',"<i class='fa fa-pencil-square-o'></i> Tambah Data",array('class'=>'btn btn-info','title'=>'Tambah Data'))
?>
      
                    <table id="example-datatables" class="table table-responsive table-hover">
                        <thead>
                            <tr>
                                <th>Nomor</th>
								<th>Nama Tipe Kelas</th>
                                <th>Nama Kelas</th>
                                <th>Wali Kelas</th>
                                <th width="90"></th>
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
                                <td><?php echo strtoupper($r->nama_konsentrasi)?></td>
                                <td><?php echo strtoupper($r->nama_prodi);?></td>
                                <td><?php echo strtoupper($r->ketua);?></td>
								<td class="text-center">
                                    <div class="btn-group">
                                        <a href="<?php echo base_url().''.$this->uri->segment(1).'/edit/'.$r->konsentrasi_id;?>" data-toggle="tooltip" title="Edit" class="btn btn-sm btn-warning"><i class="fa fa-pencil"></i></a>
                                        <a href="<?php echo base_url().''.$this->uri->segment(1).'/delete/'.$r->konsentrasi_id;?>" data-toggle="tooltip" title="Delete" class="btn btn-sm btn-danger"><i class="fa fa-times"></i></a>
                                                                            </div>
                                </td>
                            </tr>
                            <?php $i++;}?>
                            
                            
                        </tbody>
                    </table>
                    <!-- END Datatables -->