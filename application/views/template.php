<?php
if($this->session->userdata('id_users')=='')
{
    redirect('auth/login');
}
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <title>SIM SPUBER</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="<?php echo base_url();?>assets/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="<?php echo base_url();?>assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<?php echo base_url();?>assets/css/now-ui-kit.css?v=1.1.0" rel="stylesheet" />
	<!-- DatePicker CSS -->
	<link href="<?php echo base_url();?>assets/datepicker/css/datepicker.css" rel="stylesheet" />
	<!-- DataTables CSS -->
    <link href="<?php echo base_url(); ?>assets/datatables/datatables.min.css" rel="stylesheet">
  </head>
  <body class="index-page sidebar-collapse">
      <!-- Navbars -->
                    

                    <!-- Inverse Navbar - You can replace 'navbar-inverse' with 'navbar-default' for a light navbar -->
                    <nav class="navbar navbar-expand-lg bg-primary fixed-top">
						<div class="container">
                        <div class="collapse navbar-collapse" id="navigation" data-nav-image="<?php echo base_url();?>assets/img/blurred-image-1.jpg">
                            <ul class="navbar-nav">
                               <!-- <li class="active"><a href="javascript:void(0)"> <i class="fa fa-barcode"></i> Link</a></li>-->
                                <?php
                                $mainmenu=$this->db->get_where('mainmenu',array('aktif'=>'y','level'=>$this->session->userdata('level')))->result();
                                foreach ($mainmenu as $m)
                                {
                                    // chek sub menu
                                    $submenu=$this->db->get_where('submenu',array('id_mainmenu'=>$m->id_mainmenu,'aktif'=>'y'));
                                    if($submenu->num_rows()>0)
                                    {
                                        //looping
                                        echo "<li class='nav-item dropdown'>
												<a href='javascript:void(0)' class='nav-link dropdown-toggle' data-toggle='dropdown' id='navbarDropdownMenuLink'>
													<i class='".$m->icon."'></i> ".  strtoupper($m->nama_mainmenu)."
												</a>
												<ul class='dropdown-menu' aria-labelledby='navbarDropdownMenuLink'>";
                                        foreach ($submenu->result() as $s)
                                        {
                                            //echo "<li class='dropdown-item'>".  anchor($s->link,  '<i class="'.$s->icon.'"></i> '.strtoupper($s->nama_submenu))."</li>";
											echo "<a class='dropdown-item' href='".base_url().''.$this->uri->segment(0).$s->link."'><i class='".$s->icon."'></i>&nbsp;".strtoupper($s->nama_submenu)."</a>";
                                        }
                                    echo"</ul>
                                </li>";
                                        // end looping
                                    }
                                    else
                                    {
                                        echo "<li class='nav-link'>".  anchor($m->link,  '<i class="'.$m->icon.'"></i> '.strtoupper($m->nama_mainmenu))."</li>";
                                    }
                                }
                                ?>
                           
                            </ul>
						</div>
						<div class="collapse navbar-collapse justify-content-end" data-nav-image="<?php echo base_url();?>assets/img/blurred-image-1.jpg">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a href="javascript:void(0)" class="nav-link dropdown-toggle" data-toggle="dropdown" id="navbarDropdownMenuLink">
										<i class="fa fa-user" ></i> <?php echo strtoupper($this->session->userdata('username'));?>
									</a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
										<a class="dropdown-item" href="<?php echo base_url().''.$this->uri->segment(0).'users/profile'?>">
											<i class="fa fa-cogs"></i>Account
										</a>
										<a class="dropdown-item" href="<?php echo base_url().''.$this->uri->segment(0).'auth/logout'?>">
											<i class="fa fa-sign-out"></i>Logout
										</a>
                                    </ul>
                                </li>
                            </ul>
                        </div>
						</div>
                    </nav>
                    <!-- END Inverse Navbar -->
                    <!-- END Navbars -->

      <div class="container" style="background: white;">
      <!-- Example row of columns -->
      <div class="row">

        <div class="col-md-12">
            
            <?php echo $contents; ?>     
        </div>
		<hr>

      
	  </div> 
      <div class="clear:both"></div>
      
      <p align='center' class="copyright" style="font-weight: bold;" >&copy; Designed by SIM SPUBER <?php echo date('Y')?></p>
<!--   Core JS Files   -->
<script src="<?php echo base_url();?>assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="<?php echo base_url();?>assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="<?php echo base_url();?>assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="<?php echo base_url();?>assets/js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="<?php echo base_url();?>assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
<script src="<?php echo base_url();?>assets/js/now-ui-kit.js?v=1.1.0" type="text/javascript"></script>
<!-- DataTables JavaScript -->
<script src="<?php echo base_url(); ?>assets/datatables/datatables.min.js" type="text/javascript"></script>
<!-- DatePicker JavaScript -->
<script src="<?php echo base_url(); ?>assets/datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>
<script>
$(function(){
   $('#datepicker').datepicker({
      format: 'yy-mm-dd'
    });
});
</script>
<!--<script>
	$(function() {
		$( "#datepicker" ).datepicker({
                changeMonth: true,
                dateFormat: 'yy-mm-dd',
                changeYear: true
                });

                $( "#datepicker1" ).datepicker({
                changeMonth: true,
                dateFormat: 'yy-mm-dd',
                changeYear: true
                });

                $( "#datepicker2" ).datepicker({
                changeMonth: true,
                dateFormat: 'yy-mm-dd',
                changeYear: true
                });
                $( "#datepicker3" ).datepicker({
                changeMonth: true,
                dateFormat: 'yy-mm-dd',
                changeYear: true
                });

                $( "#datepicker4" ).datepicker({
                changeMonth: true,
                dateFormat: 'yy-mm-dd',
                changeYear: true
                });
                
                $( "#datepicker5" ).datepicker({
                changeMonth: true,
                dateFormat: 'yy-mm-dd',
                changeYear: true
                });
                
                $( "#datepicker6" ).datepicker({
                changeMonth: true,
                dateFormat: 'yy-mm-dd',
                changeYear: true
                });
                
                $( "#datepicker7" ).datepicker({
                changeMonth: true,
                dateFormat: 'yy-mm-dd',
                changeYear: true
                });
	});
	</script>-->
        

        <!-- Javascript code only for this page -->
		<script>
		$(document).ready(function(){
			$('#example-datatables').DataTable({
				responsive: true
			});
		});
		</script>
  </body>
</html>