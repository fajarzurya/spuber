<h2 style="font-weight: normal;"><?php echo $title;?></h2>
<div class="push">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><i class='fa fa-home'></i> <a href="javascript:void(0)">Home</a></li>
        <li class="breadcrumb-item"><?php echo anchor($this->uri->segment(1),$title);?></li>
        <li class="breadcrumb-item active">Data</li>
    </ol>
</div>
    <?php
echo anchor($this->uri->segment(1).'/post','Tambah Data',array('class'=>'btn btn-info'));
?>
<div class="table table-responsive">
    <?php
    echo $table;
    ?>
</div>
<?php
echo $pagination;
?>