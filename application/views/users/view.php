<h2 style="font-weight: normal;"><?php echo $title;?></h2>
<div class="push">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><i class='fa fa-home'></i> <a href="javascript:void(0)">Home</a></li>
        <li class="breadcrumb-item"><?php echo anchor($this->uri->segment(1),$title);?></li>
        <li class="breadcrumb-item active">Entry Record</li>
    </ol>
</div>
<?php
echo anchor($this->uri->segment(1).'/post','Tambah Data',array('class'=>'btn btn-info'))
?>
                    <table id="example-datatables" class="table table-hover">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Username</th>
                                <th>Level</th>
                                <th>Last Login</th>
                                <th>Keterangan</th>
								<th></th>
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
                                <td><?php echo $r->username;?></a></td>
                                <td>
                                    <?php
                                    if($r->level==1)
                                    {
                                        echo "Admin";
                                    }
                                    elseif($r->level==2)
                                    {
                                        echo "Jurusan";
                                    }
                                    elseif($r->level==3)
                                    {
                                        echo "Dosen";
                                    }
                                    ?>
                                </td>
                                <td><?php echo tgl_indo($r->last_login);?></td>
                                <td><?php echo users_keterangan($r->level, $r->keterangan)?></td>
								<td>
                                    <div class="btn-group">
                                        <a href="<?php echo base_url().''.$this->uri->segment(1).'/edit/'.$r->id_users;?>" data-toggle="tooltip" title="Edit" class="btn btn-warning btn-sm"><i class="fa fa-pencil"></i></a>
                                        <a href="<?php echo base_url().''.$this->uri->segment(1).'/delete/'.$r->id_users;?>" data-toggle="tooltip" title="Delete" class="btn btn-sm btn-danger"><i class="fa fa-times"></i></a>
                                    </div>
                            </tr>
                            <?php $i++;}?>
                            
                            
                        </tbody>
                    </table>
                    <!-- END Datatables -->