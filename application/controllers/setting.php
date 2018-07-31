<?php
class setting extends CI_Controller
{
    
    var $folder =   "setting";
    var $tables =   "setting";
    var $pk     =   "kelompok_id";
	var $title  =   "Setting";
    
    function __construct() 
    {
        parent::__construct();
    }
    
    function index()
    {
			$this->profilekampus();
    }
    
    function profilekampus()
    {
        $data['title']=  $this->title;
		if(isset($_POST['submit']))
        {
            $nama   =   $this->input->post('nama');
            $alamat =   $this->input->post('alamat');
            $telpon =   $this->input->post('telpon');
            $data   =   array('nama_kampus'=>$nama,'alamat_kampus'=>$alamat,'telpon'=>$telpon);
            $this->mcrud->update($this->tables,$data, 'id',1);
            redirect('siswa');
        }
        else
        {
            $data['r']=  $this->db->get_where('setting',array('id'=>1))->row_array();
            $this->template->load('template', $this->folder.'/profile',$data);
        }
    }
}