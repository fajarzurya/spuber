<!DOCTYPE html>
<html lang="en">
  <head>
    <title>SIM KEUANGAN SPUBER</title>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="<?php echo base_url();?>assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="<?php echo base_url();?>assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="<?php echo base_url();?>assets/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="<?php echo base_url();?>assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<?php echo base_url();?>assets/css/now-ui-kit.css?v=1.1.0" rel="stylesheet" />
  </head>
  <body class="login-page sidebar-collapse">
<!-- Navbar -->
    <nav class="navbar navbar-expand-lg bg-primary fixed-top navbar-transparent " color-on-scroll="400">
        <div class="container">
            <div class="collapse navbar-collapse justify-content-end" id="navigation" data-nav-image="<?php echo base_url();?>assets/img/blurred-image-1.jpg">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="http://smpsepuluhnopember.sch.id/">Back to Kit</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" rel="tooltip" title="Follow us on Twitter" data-placement="bottom" href="https://twitter.com/smp10nop" target="_blank">
                            <i class="fa fa-twitter"></i>
                            <p class="d-lg-none d-xl-none">Twitter</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" rel="tooltip" title="Like us on Facebook" data-placement="bottom" href="https://www.facebook.com/smp10nop" target="_blank">
                            <i class="fa fa-facebook-square"></i>
                            <p class="d-lg-none d-xl-none">Facebook</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" rel="tooltip" title="Follow us on Instagram" data-placement="bottom" href="https://www.instagram.com/smp10nop" target="_blank">
                            <i class="fa fa-instagram"></i>
                            <p class="d-lg-none d-xl-none">Instagram</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- End Navbar -->
	<div class="page-header clear-filter" filter-color="orange">
        <div class="page-header-image"></div>
		<div class="content">
        <div class="container">
            <div class="col-md-4 ml-auto mr-auto">
                <div class="card card-login card-plain">
                    <?php
					echo form_open('auth/login');
					?>
                        <div class="card-header">
                            <div class="logo-container">
                                <img src="<?php echo base_url();?>assets/img/spuber-logo.png" alt="">
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="input-group form-group-no-border input-lg">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons users_circle-08"></i>
                                </span>
                                <input type="text" name="username" required="" placeholder="Username ..." autofocus="" class="form-control">
                            </div>
                            <div class="input-group form-group-no-border input-lg">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons ui-1_lock-circle-open"></i>
                                </span>
                                <input type="password" name="password" placeholder="Password" required="" class="form-control">
                            </div>
                        </div>
                        <div class="card-footer">
							<input type="submit" name="submit" value="Enter" class="btn btn-primary btn-round btn-lg btn-block">
                        </div>
                </div>
            </div>
        </div>
		</div>
        <footer class="footer">
            <div class="container">
                <div>
					SMP SEPULUH NOPEMBER SIDOARJO &copy;
				</div>
            </div>
        </footer>
    </div>
  </body>
<!--   Core JS Files   -->
<script src="<?php echo base_url();?>assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="<?php echo base_url();?>assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="<?php echo base_url();?>assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="<?php echo base_url();?>assets/js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="<?php echo base_url();?>assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
<script src="<?php echo base_url();?>assets/js/plugins/bootstrap-datepicker.js" type="text/javascript"></script>
<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
<script src="<?php echo base_url();?>assets/js/now-ui-kit.js?v=1.1.0" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {
        // the body of this function is in assets/js/now-ui-kit.js
        nowuiKit.initSliders();
    });

    function scrollToDownload() {

        if ($('.section-download').length != 0) {
            $("html, body").animate({
                scrollTop: $('.section-download').offset().top
            }, 1000);
        }
    }
</script>
</html>