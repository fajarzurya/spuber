<?php
class setupbiaya extends CI_Controller
{
    var $folder =   "setupbiaya";
	//var $folder =   "setupbiayakuliah";
    var $tables =   "app_dosen";
    var $pk     =   "dosen_id";
    var $title  =   "Biaya Sekolah";
    
    function index()
    {
        $data['title']=  $this->title;
        $this->template->load('template', $this->folder.'/view',$data);
    }
    
    
    function loaddata()
    {
        $tahun          =  $_GET['tahun_akademik'];
        $prodi          =  $this->db->get('akademik_prodi')->result();
        $jenis_bayar    =  $this->db->get('keuangan_jenis_bayar');
        echo "<table class='table table-responsive table-hover'>
              <tr class='danger'>
                <th rowspan='2'>No</th>
                <th colspan='".$jenis_bayar->num_rows()."'><div align='center'>JENIS BIAYA</div></th>
                </tr>
            <tr class='danger'>";
                  // foreach jenis bayar
            foreach ($jenis_bayar->result() as $j)
            {
               echo"<th>".  strtoupper($j->keterangan)."</th>";
            }
              echo"</tr>";

            echo"";
            $no=1;
			echo"<tr>
				<th rowspan='2'>$no</th></tr>";
			foreach ($jenis_bayar->result() as $jb)
                    {
                        
						$jumlah =   $this->get_biaya_sekolah($tahun, $jb->jenis_bayar_id,'jumlah');
						echo"<td>Rp ".$jumlah."</td>";
						$no++;
                    }
			echo"</tr>";
            // foreach ($prodi as $p) 
            // {
                // echo"<tr>
					 // <th>$no</th>
                     // <!--<th colspan='".($jenis_bayar->num_rows()+2)."'>".  strtoupper($p->nama_prodi)."</th>-->
					 // <th>".  strtoupper($p->nama_prodi)."</th>";
					 // // forach jenis bayar
                    // foreach ($jenis_bayar->result() as $jb)
                    // {
                        // $jumlah =   $this->get_biaya_sekolah($tahun, $jb->jenis_bayar_id,$p->prodi_id,'jumlah');
						// echo"<td>Rp ".$jumlah."</td>";
                    // }
                // echo"</tr>";
                // foreach kelas
                //$konsentrasi=  $this->db->query("select konsentrasi_id,nama_konsentrasi from akademik_konsentrasi where prodi_id='$p->prodi_id'")->result();
				//$kelas=  $this->db->query("select prodi_id,nama_prodi from akademik_prodi")->result();
                // /*foreach ($kelas as $ks)
                // {
                    // echo"<tr>
                    // <td>&nbsp;</td>
                    // <td>".  strtoupper($ks->nama_prodi)."</td>";
                    // forach jenis bayar
                    // foreach ($jenis_bayar->result() as $jb)
                    // {
                        //$jumlah =   $this->get_biaya_sekolah($tahun, $jb->jenis_bayar_id,$ks->konsentrasi_id,'jumlah');
						// $jumlah =   $this->get_biaya_sekolah($tahun, $jb->jenis_bayar_id,$ks->prodi_id,'jumlah');
                       // echo"<td>Rp ".$jumlah."</td>";
                    // }
                  // echo"</tr>";
                // }*/
                // end load kelas
                // $no++;
            // }
                
          echo"</table>";
    }
    
    //function get_biaya_kuliah($tahun_akademik,$jenis_biaya_kuliah,$konsentrasi,$field)
	function get_biaya_sekolah($tahun_akademik,$jenis_biaya_kuliah,$field)
    {
        $where  =   array(  'angkatan_id'=>$tahun_akademik,
                            'jenis_bayar_id'=>$jenis_biaya_kuliah);
                            //'prodi_id'=>$kelas);
        $r      =  $this->db->get_where('keuangan_biaya_kuliah',$where);
        if($r->num_rows()>0)
        {
            $r=$r->row_array();
            return $r[$field];
        }
        else
        {
            return '';
        }
       
    }
    
    
    function post()
    {
         /*$query      ="  SELECT konsentrasi_id,nama_konsentrasi 
                         FROM akademik_konsentrasi 
                         ORDER by prodi_id";
		*/
		 $query      ="  SELECT prodi_id,nama_prodi 
                         FROM akademik_prodi 
                         ORDER by prodi_id";
		$tahun		= $this->input->post('tahun_angkatan');
         $query2     ="  SELECT * FROM student_angkatan WHERE aktif='y'";
		 //$query2     ="  SELECT * FROM student_angkatan WHERE angkatan_id = '".$tahun."'";
         //$data['konsentrasi']=  $this->db->query($query)->result();
		 $data['kelas']=  $this->db->query($query)->result();
         $data['tahun_ajrn'] = $this->db->query($query2)->row_array();
		 //$data['tahun_ajrn'] = $this->db->query($query2)->row();
         $data['title']=  $this->title;
         $this->template->load('template', $this->folder.'/post',$data);
    }
    
    function loadform()
    {
        //$konsentrasi            =   $_GET['konsentrasi'];
		$kelas		            =   $_GET['kelas'];
        $tahun_angkatan_id      =   $this->db->get_where('student_angkatan',array('aktif'=>'y'))->row_array();
        $tahun_ajaran           =   $tahun_angkatan_id['angkatan_id'];
        $no=1;
        $keuangan_jenis_bayar   =   $this->db->get('keuangan_jenis_bayar')->result();
        echo "<table class='table table-bordered'>
            <tr><th width=10>No</th><th>Jenis Biaya Sekolah</th><th width=150>Jumlah Bayar</th></tr>";
        foreach ($keuangan_jenis_bayar as $r)
        {
            /*$a=$this->chek_data_biaya_kuliah($konsentrasi, $r->jenis_bayar_id);
            $jumlah = $this->get_biaya_kuliah($tahun_ajaran, $r->jenis_bayar_id, $konsentrasi,'jumlah');
            $id     = $this->get_biaya_kuliah($tahun_ajaran, $r->jenis_bayar_id, $konsentrasi,'biaya_kuliah_id');
            */
			$a=$this->chek_data_biaya_sekolah($kelas, $r->jenis_bayar_id);
            $jumlah = $this->get_biaya_sekolah($tahun_ajaran, $r->jenis_bayar_id, $kelas,'jumlah');
            $id     = $this->get_biaya_sekolah($tahun_ajaran, $r->jenis_bayar_id, $kelas,'biaya_kuliah_id');
			echo "<tr>
                    <td>$no</td>
                    <td> ".  strtoupper($r->keterangan)."</td>
                    <td> ".  inputan('text', 'jumlah', 'col-sm-12', '', 1, $jumlah, array('id'=>'test','onkeyup'=>"simpan($id)",'id'=>"jumlah$id"))."</td>
                    </tr>";
            $no++;
        }
        echo"</table>";
    }
    
    //function chek_data_biaya_kuliah($kelas,$jenis_bayar)
	function chek_data_biaya_sekolah($kelas,$jenis_bayar)
    {
        $tahun_angkatan_id      =   $this->db->get_where('student_angkatan',array('aktif'=>'y'))->row_array();
        $chek=  $this->db->get_where('keuangan_biaya_kuliah',array('jenis_bayar_id'=>$jenis_bayar,'prodi_id'=>$kelas,'angkatan_id'=>  $tahun_angkatan_id['angkatan_id']));
        if($chek->num_rows()==0)
        {
            $data=array('jenis_bayar_id'=>$jenis_bayar,
                        'prodi_id'=>$kelas,
                        'angkatan_id'=> $tahun_angkatan_id['angkatan_id']);
            $this->db->insert('keuangan_biaya_kuliah',$data);
        }
        //return $chek->num_rows();
    }
    
    
    function test()
    {
        echo $tahun=  get_tahun_akademik();
        //echo $this->chek_data_biaya_kuliah(10, 1);
    }
    
    function simpan()
    {
        $jumlah =   $_GET['jumlah'];
        $id     =   $_GET['id'];
        $this->mcrud->update('keuangan_biaya_kuliah',array('jumlah'=>$jumlah), 'biaya_kuliah_id',$id);
    }
}