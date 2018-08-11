<?php
class Telegramf extends CI_Controller
{
	
	public function index($to = 'Fajar')
	{
		echo "SpuberBot Ver {$to}".PHP_EOL;
		$this->template->load('template');
	}
}
?>