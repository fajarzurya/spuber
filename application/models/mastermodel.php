<?php
if(!defined('BASEPATH'))
     exit('No direct script access allowed');
class Mastermodel extends CI_Model
{          
    function konsentrasi_view(){
        return $this->db->query("SELECT ak.*,ap.nama_prodi
                FROM akademik_konsentrasi as ak,akademik_prodi as ap
                WHERE ak.prodi_id=ap.prodi_id");
    } 
}
?>