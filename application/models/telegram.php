<?php
if(!defined('BASEPATH'))
     exit('No direct script access allowed');
class Telegram extends CI_Model
{          
    function getChatId($nis){
        return $this->db->get_where('telegram', array('nis'=>$nis))->result_array();
    } 
}
?>