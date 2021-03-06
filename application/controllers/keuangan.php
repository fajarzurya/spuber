<?php
// Load library phpspreadsheet
//require('./excel/vendor/autoload.php');

use PhpOffice\PhpSpreadsheet\Helper\Sample;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
// End load library phpspreadsheet

class keuangan extends CI_Controller
{
    
    var $folder =   "keuangan";
    var $tables =   "";
    var $pk     =   "";
    var $title  =   "Keuangan";
    
    function __construct() {
        parent::__construct();
		//$this->load->helper('telegram');
    }
    
	// Export ke excel
	public function export()
	{
		$jb	= $this->db->get('keuangan_jenis_bayar')->result();
		// Create new Spreadsheet object
		$spreadsheet = new Spreadsheet();

		// Set document properties
		$spreadsheet->getProperties()->setCreator('Fidhya Utami')
		->setLastModifiedBy('Fidhya Utami')
		->setTitle('Laporan Keuangan')
		->setSubject('Office 2007 XLSX Test Document')
		->setDescription('Document for Office 2007 XLSX, generated using PHP classes.')
		->setKeywords('office 2007 openxml php')
		->setCategory('Test result file');

		// Add some data
		// $spreadsheet->setActiveSheetIndex(0)
		// ->setCellValue('A1', 'LAPORAN KEUANGAN')
		// ->setCellValue('A2', 'No')
		// ->setCellValue('B2', 'NIS')
		// ->setCellValue('C2', 'Nama Siswa');
		// $i='D';foreach($jb as $jb)
		// {
			// $spreadsheet->setActiveSheetIndex(0)
			// ->setCellValue($i.'2', $jb->keterangan);
			// $i++;
		// }
		// $spreadsheet->setActiveSheetIndex(0)
		// ->setCellValue($i++.'2', 'Jumlah')
		// ->setCellValue($i++.'2', 'Kredit')
		// ->setCellValue($i++.'2', 'Keterangan');
		// $a=1;foreach()
		// {
			
		// }

		// Miscellaneous glyphs, UTF-8
		// $i=2; foreach($provinsi as $provinsi) {

		// $spreadsheet->setActiveSheetIndex(0)
		// ->setCellValue('A'.$i, $provinsi->id_provinsi)
		// ->setCellValue('B'.$i, $provinsi->nama_provinsi);
		// $i++;
		// }
		// Rename worksheet
		$spreadsheet->getActiveSheet()->setTitle('Report Excel'.date('d-m-Y H'));

		// Set active sheet index to the first sheet, so Excel opens this as the first sheet
		$spreadsheet->setActiveSheetIndex(0);

		// Redirect output to a client’s web browser (Xlsx)
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		header('Content-Disposition: attachment;filename="Report Excel.xlsx"');
		header('Cache-Control: max-age=0');
		// If you're serving to IE 9, then the following may be needed
		header('Cache-Control: max-age=1');

		// If you're serving to IE over SSL, then the following may be needed
		header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
		header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
		header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
		header('Pragma: public'); // HTTP/1.0

		$writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
		$writer->save('php://output');
		exit;
	}
	
    function index()
    {
        //$this->load->helper('telegram');
		if(isset($_POST['submit']))
        {
            $data['tanggal1']=  $this->input->post('tanggal1');
            $data['tanggal2']=  $this->input->post('tanggal2');
			$jurnal="SELECT kd.nim, s.nama FROM keuangan_pembayaran_detail as kd JOIN student_siswa as s ON kd.nim = s.nim WHERE left(kd.tanggal,10) BETWEEN '".$data['tanggal1']."' and '".$data['tanggal2']."' GROUP BY kd.nim";
			$data['jurnal']			= $this->db->query($jurnal)->result();
        }
		elseif(isset($_POST['submit2']))
        {
            $kelas			=  $this->input->post('kelas');
            $tipe			=  $this->input->post('tipe');
			$tahun			=  $this->input->post('tahun_angkatan');
			$data['kelasX']	=  getField('akademik_prodi', 'nama_prodi', 'prodi_id', $kelas);
			$data['tipeX']	=  getField('app_kelas', 'keterangan', 'kelas_id', $tipe);
			$data['nama']	=  $this->db->get_where('student_siswa',array('prodi_id'=>$kelas,'angkatan_id'=>$tahun,'kelas_id'=>$tipe))->result();
        }
        else
        {
            $data['tanggal1']="";
            $data['tanggal2']="";
        }
		$data['jenis_bayar']	= $this->db->get('keuangan_jenis_bayar');
		$data['title']			= $this->title;
        $this->template->load('template', 'keuangan/view',$data);
    }
    
    function laporan()
    {
        $data['title']=  'Laporan Keuangan';
        $data['tahun_angkatan']=  $this->db->get('akademik_tahun_akademik')->result();
        $this->template->load('template', 'keuangan/laporan',$data);
    }

    function loadlaporan()
    {
        //$konsentrasi    =$_GET['konsentrasi'];
		$kelas    =$_GET['kelas'];
        $tahun_akademik =$_GET['tahun_angkatan'];
        //$this->tampilkandata2($konsentrasi, $tahun_angkatan);
        //die;
        if($tahun_akademik==0)
        {
            // foreach tahun_aakdemik
            $tahun=  $this->db->get('student_angkatan')->result();
            foreach ($tahun as $t)
            {
                 //$this->tampilkandata($konsentrasi, $t->angkatan_id);
				 $this->tampilkandata($kelas, $t->angkatan_id);
                 for($grs=1;$grs<=227;$grs++)
                 {
                     echo "-";
                 }
            }
            // end foreach
        }
        else
        {
            // $this->tampilkandata($konsentrasi, $tahun_akademik);
			$this->tampilkandata($kelas, $tahun_akademik);
        }
    }
    

    function tampilkandata($kelas,$tahun_akademik)
    {
        // fires else
            //$data=  $this->db->get_where('student_mahasiswa',array('konsentrasi_id'=>$konsentrasi,'angkatan_id'=>$tahun_akademik))->result();
			$data=  $this->db->get_where('student_siswa',array('prodi_id'=>$kelas,'angkatan_id'=>$tahun_akademik))->result();
            $jenis_bayar=  $this->db->get('keuangan_jenis_bayar');
            
            echo"<table class='table table-bordered'>
                <tr><th width='170'>Nama Kelas</th><th>".  strtoupper(getField('akademik_prodi', 'nama_prodi', 'prodi_id', $kelas))."</th></tr>
                <tr><th>Tahun Akademik</th><th>".  getField('student_angkatan', 'keterangan', 'angkatan_id', $tahun_akademik)."</th></tr>
               
                </table>";
            echo"<table class='table table-bordered'>
                <tr><th rowspan=2>No</th><th rowspan=2>Nim</th><th rowspan='2' width='200'>Nama Lengkap</th>";
            foreach ($jenis_bayar->result() as $j)
            {
                echo "<th colspan=3><p align='center'>".  strtoupper($j->keterangan)."</p></th>";
            }
            echo"<th rowspan=2>Total Tunggakan</th></tr>
                <tr>";
            foreach ($jenis_bayar->result() as $j)
            {
                echo "<th>01</th><th>02</th><th>03</th>";
            }
            echo"</tr>";
            $no=1;

            $tunggakan=0;
            foreach ($data as $r)
            {
                // zebra
                $bgcolor=$no % 2!=0?'#CCCCCC':'#FFFFFF';
                // end zebra

                echo"<tr bgcolor='$bgcolor'>
                    <td>$no</td>
                    <td>".strtoupper($r->nim)."</td>
                    <td width='200'>".strtoupper($r->nama)."</td>";
                    // foreach kolom value
                    $tunggakanmsw=0;
                    foreach ($jenis_bayar->result() as $jb)
                    {
                        $harus_bayar=chek_bayar($r->nim, $jb->jenis_bayar_id, 01);
                        $sudah_bayar=chek_bayar($r->nim, $jb->jenis_bayar_id, 02);
                        $sisa1=$harus_bayar-$sudah_bayar;
                        $sisa=$sisa1==0?'Lunas':rp((int) $sisa1);
                        echo "<td>".  rp((int)$harus_bayar)."</td>
                            <td>".  rp((int)$sudah_bayar)."</td>
                            <td>".  $sisa."</td>";
                        $tunggakanmsw=$tunggakanmsw+$sisa1;
                        //
                    }
                    echo"<td>".rp((int) $tunggakanmsw)."</td></tr>";
                    $tunggakan=$tunggakan+$tunggakanmsw;
                    $no++;
            }

            echo"<tr class='success'>
                <td colspan=".(($jenis_bayar->num_rows()*3)+0)."></td>
                <td colspan=3>Total Tunggakan</td><td><b>".rp((int)$tunggakan)."</b></td>
                </tr></table>";
                    // hitung sudah berapa tahun kuliah berdasarkan tahun akademik
            $tahun_sekarang=date('Y');
            $jml_semester=($tahun_akademik-$tahun_sekarang)+1;
            $smt_aktif= getField('student_mahasiswa', 'semester_aktif', 'angkatan_id', $_GET['tahun_angkatan']);
            //$spp_bayar    =   jml_spp_konsentrasi($konsentrasi, $_GET['tahun_angkatan']);
			$spp_bayar    =   jml_spp_konsentrasi($kelas, $_GET['tahun_angkatan']);
            echo"<table class='table table-bordered'>
                <tr class='success'>
                <th colspan=".($smt_aktif+4).">PEMBAYARAN SPP | BIAYA SPP PERSEMESTER = RP. ". rp((int) $spp_bayar) ."</th>
                </tr>
                <tr>
                <th width='10'>No</th>
                <th width='60'>NIM</th>
                <th>NAMA</th>";
            // looping semester
            // get semester aktif
            
            for($i=1;$i<=$smt_aktif;$i++)
            {
                echo"<th><p align='center'>SEMESTER $i</p></th>";
            }
            echo"<th>Tunggakan</th></tr>";

            $no=1;
            $tot_tunggakan=0;
            foreach ($data as $r)
            {
                $tunggakan_smt=0;
                // zebra
                $bgcolor=$no % 2!=0?'#CCCCCC':'#FFFFFF';
                // end zebra
                echo "<tr bgcolor='$bgcolor'><td>$no</td>                
                    <td>".strtoupper($r->nim)."</td>
                    <td width='200'>".strtoupper($r->nama)."</td>";
                // looping kolom bayar
                    for($i=1;$i<=$smt_aktif;$i++)
                    {
                        $spp=  chek_bayar_semester($r->nim, $i);
                        echo "<td>".rp((int) $spp)."</td>";
                        $tunggakan_smt=$tunggakan_smt+($spp_bayar-$spp);
                    }
                // end looping kolom bayar
                    echo"<td>".rp((int) $tunggakan_smt)."</td></tr>";
                    $tot_tunggakan=$tot_tunggakan+$tunggakan_smt;
                $no++;
            }
             echo"<tr><td colspan='".($smt_aktif+3)."'>Jumlah Tunggakan</td><td>".rp((int) $tot_tunggakan)."</td></tr></table>";
            // end else
    }


    function pembayaran()
    {
        if(isset($_POST['submit']))
        {
            $nim    = $this->input->post('nim');
			$jenis	= $this->input->post('jenis');
            $chek   = $this->db->get_where('student_siswa',array('nim'=>$nim))->num_rows();
            if($chek>0)
            {
            $this->session->set_userdata('pembayaran_mahasiswa_nim',$nim);
            }
            else
            {
                $this->session->set_flashdata('pesan', "<div class='alert alert-success'><i class='fa fa-bullhorn'></i> NIM YANG ANDA MASUKAN TIDAK DITEMUKAN DI DATABASE</div>");
            }
            redirect('keuangan/pembayaran');
        }
        elseif(isset($_POST['submit2']))
        {
            // simpan transaksi
            $jenis  =   $this->input->post('jenis');
            $jumlah =   $this->input->post('jumlah');
            $bulan	=  $this->input->post('semester');
			$semester = $this->input->post('uts_uas');
            // chek dulu udah lunas belum jenis bayarnya, jika sudah berikan pesan
            $idnim=$this->session->userdata('pembayaran_mahasiswa_nim');
            $tahun_akademik = getField('student_siswa', 'angkatan_id', 'nim', $idnim);
            //$konsentrasi_id = getField('student_mahasiswa', 'konsentrasi_id', 'nim', $idnim);
			$kelas = getField('student_siswa', 'prodi_id', 'nim', $idnim);
            $semester_aktif = getField('student_siswa', 'semester_aktif', 'nim', $idnim);
            //$jumlah_bayar   = get_biaya_kuliah($tahun_akademik, $jenis, $konsentrasi_id, 'jumlah');
			$jumlah_bayar   = get_biaya_sekolah($tahun_akademik, $jenis, $kelas, 'jumlah');
            $sudah_bayar    = get_biaya_sudah_bayar($idnim, $jenis);
            $sisa           = $jumlah_bayar-$sudah_bayar; //sisa pembayaran sesuai variable jenis yang dipilih
            // end chek
            
            // chek jenis inputan
            // jika spp maka chek dia semetter berapa dan apakah dy sudah lunas untuk bulan itu
            // jika selain spp chek sudah lunas atau belum
            
             //if($jenis==3)
			if($jenis==1) //jenis pembayaran spp
             {
                 //if($bulan>$semester_aktif)
				if($bulan>12)
                 {
                     // bulan yang dipilih lebih tinggi daripada semeser aktif
                    $this->session->set_flashdata('pesan', "<div class='alert alert-danger'><i class='fa fa-bullhorn'></i> BULAN YANG ANDA INPUTKAN TIDAK SESUAI DENGAN DATA SISWA</div>");
                 }
                 else
                 {
                     // chek spp bulan itu udah lunas belum
                    //$sdh_bayar_semester= $this->chek_sudah_bayar_semester($idnim, $semester);
					$sdh_bayar= $this->chek_sudah_bayar($idnim, $bulan);
                    if($jumlah_bayar<=$sdh_bayar)
                    {
                        $this->session->set_flashdata('pesan', "<div class='alert alert-danger'><i class='fa fa-bullhorn'></i> PEMBAYARAN UNTUK BULAN ".strtoupper(getbln($bulan))." <B>SUDAH LUNAS</B></div>");
     
                        
                    }
                    else
                    {
                        // save bayar spp bulan
                    $data   =   array(  'jenis_bayar_id'=>$jenis,
                                        'jumlah'=>$jumlah,
                                        'id_users'=> $this->session->userdata('id_users'),
                                        'tanggal'=>  waktu(),
                                        'semester'=>$bulan,
                                        'nim'=>$this->session->userdata('pembayaran_mahasiswa_nim'));
                    $this->db->insert('keuangan_pembayaran_detail',$data);
                    }
                 }
             }
             else //jenis pemnayaran selain spp
             {
                 // chek udah lunas belum
                 // kalau udah lunas tampilkan pesan udah lunas
                 // kalau belum lunas save
                 
                if($sisa<=0)
                {
                    // sudah lunas
                     $this->session->set_flashdata('pesan', "<div class='alert alert-danger'><i class='fa fa-bullhorn'></i> PEMBAYARAN <b> ".  strtoupper(getField('keuangan_jenis_bayar', 'keterangan', 'jenis_bayar_id', $jenis))." </b> SUDAH LUNAS</div>");
                }
                elseif($jumlah>$sisa)
                {
                    $this->session->set_flashdata('pesan', "<div class='alert alert-danger'><i class='fa fa-bullhorn'></i> PEMBAYARAN LEBIH !! </div>");
                }
                else
                {
                    // save pembayaran perjenis 
                    $data   =   array(  'jenis_bayar_id'=>$jenis,
                                        'jumlah'=>$jumlah,
                                        'id_users'=> $this->session->userdata('id_users'),
                                        'tanggal'=>  waktu(),
										'semester'=>$semester,
                                        'nim'=>$this->session->userdata('pembayaran_mahasiswa_nim'));
            $this->db->insert('keuangan_pembayaran_detail',$data);
                    
                }
             }
            redirect('keuangan/pembayaran');
        }
        else
        {
            $nim_session=$this->session->userdata('pembayaran_mahasiswa_nim');
            $query2="   SELECT au.nama,kj.keterangan,kd.tanggal,kd.jumlah,kd.pembayara_detail_id,kd.jenis_bayar_id,kd.semester
                        FROM  keuangan_pembayaran_detail  as kd,keuangan_jenis_bayar as kj,app_users as au
                        WHERE kd.jenis_bayar_id=kj.jenis_bayar_id and kd.id_users=au.id_users and kd.nim='$nim_session'";
            /*$query=     "SELECT sm.nama,ak.nama_konsentrasi,ap.nama_prodi
                        FROM student_mahasiswa as sm,akademik_konsentrasi as ak,akademik_prodi as ap
                        WHERE sm.konsentrasi_id=ak.konsentrasi_id and ap.prodi_id=ak.prodi_id and sm.nim='$nim_session'";*/
			$query=     "SELECT sm.nama,ap.prodi_id,ap.nama_prodi,sm.angkatan_id
                        FROM student_siswa as sm,akademik_prodi as ap
                        WHERE sm.prodi_id=ap.prodi_id and sm.nim='$nim_session'";
            $data['transaksi']=  $this->db->query($query2)->result();
            $data['profile']=  $this->db->query($query)->row_array();
            if($nim_session=="emptyy")
            {
                $data['statuss']="kosong";
            }
            else
            {
                $data['statuss']="ada";
            }
			//$data['jenis_bayar']=  $this->db->query('select * from keuangan_jenis_bayar where jenis_bayar_id not in("3")')->result();
			$data['jenis_bayar']=  $this->db->query('select * from keuangan_jenis_bayar where keterangan not like "%SPP%"')->result();
            $data['nim']=$nim_session;
            $data['semester']=getField('student_siswa', 'semester', 'nim', $nim_session);
            $data['title']=  $this->title;
            $this->template->load('template', 'keuangan/bayar/view',$data);
        }
    }
    
    
    
  
    
    //function chek_sudah_bayar_semester($nim,$semester)
	function chek_sudah_bayar($nim,$bulan)
    {
        $sql=   "SELECT sum(jumlah) as jumlah 
                FROM keuangan_pembayaran_detail
                WHERE jenis_bayar_id=1 and nim='$nim' and semester='$bulan'";
        $data=  $this->db->query($sql)->row_array();
        if($data['jumlah']==null)
        {
            return 0;
        }
        else
        {
            return $data['jumlah'];
        }
    }
    
    function reset()
    {
        $this->session->set_userdata('pembayaran_mahasiswa_nim','emptyy');
        redirect('keuangan/pembayaran');
    }

    function cetakpersonal()
    {
        $session=$this->session->userdata('pembayaran_mahasiswa_nim');
        if($session=="")
        {
            redirect($this->index());
        }
        else
        {
            //$query="SELECT sm.nim,sm.nama,ap.nama_prodi,ta.keterangan FROM student_mahasiswa as sm,akademik_prodi as ap,student_angkatan as ta WHERE sm.prodi_id=ap.prodi_id and ta.angkatan_id=sm.angkatan_id and sm.nim='$session'";
			$query="SELECT sm.nim,sm.nama,ap.nama_prodi,ta.keterangan FROM student_siswa as sm,akademik_prodi as ap,student_angkatan as ta WHERE sm.prodi_id=ap.prodi_id and ta.angkatan_id=sm.angkatan_id and sm.nim='$session'";
            $nim_session=$this->session->userdata('pembayaran_mahasiswa_nim');
            $data['jenis_bayar']=  $this->db->query('select * from keuangan_jenis_bayar where jenis_bayar_id not in("1")')->result();
            $data['biodata']=  $this->db->query($query)->row_array();
            //$data['semester']=getField('student_mahasiswa', 'semester_aktif', 'nim', $nim_session);
			$data['semester']=getField('student_siswa', 'semester_aktif', 'nim', $nim_session);
			
		   $this->load->view('keuangan/cetakpersonal',$data);
		   $this->notifikasi($nim_session);
        }
    }
    
    function laporanpembayaran()
    {
        $data			="SELECT kd.nim, s.nama FROM keuangan_pembayaran_detail as kd JOIN student_siswa as s ON kd.nim = s.nim WHERE left(kd.tanggal,10) BETWEEN '".$tanggal1."' and '".$tanggal2."' GROUP BY kd.nim";
		$jurnal			= $this->db->query($data)->result();
		$jenis_bayar	= $this->db->get('keuangan_jenis_bayar');
		echo "<thead>
		<tr><th rowspan='2'>No</th>
			<th rowspan='2'>NIS</th>
			<th rowspan='2'>Nama Siswa</th>";
			foreach ($jenis_bayar->result() as $j)
				{
				   echo"<th>".  strtoupper($j->keterangan)."</th>";
				}
		echo"<th rowspan='2'>Jumlah</th></tr>
		</thead>";
		//-------------------------
		$no=1;
		$grandttl=0;
		foreach ($jurnal as $r)
		{
			echo "<tr>
				<th>$no</th>
				<th>".  strtoupper($r->nim)."</th>
				<th>".  strtoupper($r->nama)."</th>";
				$jumlah=0;
				foreach($jenis_bayar->result() as $a)
				{
					$sudah_bayar=(int)pivot_laporan($r->nim, $a->jenis_bayar_id, $tanggal1, $tanggal2);
					echo"<td>Rp ".rp($sudah_bayar)."</td>";
					$jumlah=$jumlah+$sudah_bayar;
				}
			echo"<td>".rp((int) $jumlah)."</td></tr>";
			$grandttl=$grandttl+$jumlah;
			$no++;
		}
		echo"<tr>
			<td colspan=".$jenis_bayar->num_rows()."></td>
			<td colspan=3>Grand Total</td><td><b>".rp((int)$grandttl)."</b></td>
			</tr>";
		$tanggal1=  $this->uri->segment(3);
        $tanggal2=  $this->uri->segment(4);
        $query="SELECT sm.nama,sm.nim,jb.keterangan,pd.tanggal,pd.jumlah,pd.semester,ak.nama_konsentrasi
                FROM keuangan_pembayaran_detail as pd,keuangan_jenis_bayar as jb,student_mahasiswa as sm,akademik_konsentrasi as ak
                WHERE pd.jenis_bayar_id=jb.jenis_bayar_id and ak.konsentrasi_id=sm.konsentrasi_id and sm.nim=pd.nim and pd.tanggal 
                BETWEEN '".$tanggal1."' and '".$tanggal2."'";
        $data['transaksi']=  $this->db->query($query)->result();
        $this->load->view('keuangan/laporanpembayaran',$data);
    }
    
    
    function jurnalkhusus()
    {
        if(isset($_POST['submit']))
        {
            $data['tanggal1']=$this->input->post('tanggal1');
            $data['tanggal2']=$this->input->post('tanggal2');
            $query="SELECT sm.nim,sm.nama,jb.keterangan as jenis_bayar,pd.tanggal,pd.jenis_bayar_id,pd.jumlah
                    FROM keuangan_pembayaran_detail as pd,student_mahasiswa as sm,keuangan_jenis_bayar as jb
                    WHERE sm.nim=pd.nim and pd.jenis_bayar_id=jb.jenis_bayar_id and left(pd.tanggal,10) BETWEEN '".$data['tanggal1']."' and '".$data['tanggal2']."' ";
            $data['transaksi']=  $this->db->query($query)->result();
            $this->template->load('template','keuangan/jurnalkhusus',$data);
        }
        else
        {
            $data['tanggal1']='';
            $data['tanggal2']='';
            $this->template->load('template','keuangan/jurnalkhusus',$data);
        }
    }
    
    function cetakjurnalkhusus()
    {
        $data['tanggal1']=  $this->uri->segment(3);
        $data['tanggal2']=$this->uri->segment(4);
        $query="SELECT sm.nim,sm.nama,jb.keterangan as jenis_bayar,pd.tanggal,pd.jenis_bayar_id,pd.jumlah
                    FROM keuangan_pembayaran_detail as pd,student_mahasiswa as sm,keuangan_jenis_bayar as jb
                    WHERE sm.nim=pd.nim and pd.jenis_bayar_id=jb.jenis_bayar_id 
                    and pd.tanggal BETWEEN '".$data['tanggal1']."' and '".$data['tanggal2']."'";
        $data['transaksi']=  $this->db->query($query)->result();
        $this->load->view('keuangan/cetakjurnalkhusus',$data);
    }
    
    
        function delete()
    {
         $id     =  $this->uri->segment(3);
         $this->mcrud->delete('keuangan_pembayaran_detail',  'pembayara_detail_id',  $id);
         redirect('keuangan/pembayaran');
    }
    
    function sms()
    {
        // looping kosentrasi
        // cari mahassiwa yang aktif
        // chek biaya yang belum dibayar
        // kirim sms ke no hp yang di daftarkan
        
        $tahun_akademik=  $this->db->get('student_angkatan')->result();
        foreach ($tahun_akademik as $t)
        {
            $konsentrasi=  $this->db->get('akademik_konsentrasi')->result();
            foreach ($konsentrasi as $k)
            {
                // mahassiwa
                $mahasiswa=  $this->db->get_where('student_mahasiswa',array('angkatan_id'=>$t->angkatan_id,'konsentrasi_id'=>$k->konsentrasi_id))->result();
                foreach ($mahasiswa as $m)
                {
                    $tunggakan_permahasiswa=0;
                    $tunggakan=0;
                    $jenis_bayar=  $this->db->get('keuangan_jenis_bayar')->result();
                    foreach ($jenis_bayar as $j)
                    {
                        // HB = harus bayar & SB = Sudah bayar
                        $hb     =  chek_bayar($m->nim, $j->jenis_bayar_id, 01);
                        $sb     =  chek_bayar($m->nim, $j->jenis_bayar_id, 02);
                        $sisa   =   $hb-$sb;
                        $tunggakan=$tunggakan+$sisa;
                    }
                    // chek tunggakan semester
                    $tahun_masuk    = substr(getField('student_angkatan', 'keterangan', 'angkatan_id', $m->angkatan_id),0,4);
                    $tahun_sekarang = date('Y');
                    $semester       = ($tahun_sekarang-$tahun_masuk)+1;
                    for($i=1;$i<=$semester;$i++)
                    {
                        $biaya_spp      = jml_spp_konsentrasi($m->konsentrasi_id, $t->angkatan_id);
                        $sdh_bayarspp   = chek_bayar_semester($m->nim, $i);
                        $tunggakan=$tunggakan+($biaya_spp-$sdh_bayarspp);
                    }
                    // kirim sms
                    $pesan="Biaya Tunggakan Keuangan anak anda adalah $tunggakan";
                    $this->_kirim_sms($m->no_hp_ortu, $pesan);
                    // end kirim sms
                }
            }
        }
        
        echo "SMS SUDAH DIKIRIM";
    }
    
	function cetak()
    {
        $jenis="SELECT * FROM `keuangan_jenis_bayar` WHERE jenis_bayar_id not in('3') ";
        $data['tahun_akademik']      =  $this->input->post('tahun');
        //$data['konsentrasi_id']=  $this->input->post('konsentrasi');
		$data['prodi_id']=  $this->input->post('kelas');
        $data['tahun']=  $this->db->get('student_angkatan')->result();
        $data['jenis_bayar']=  $this->db->query($jenis);
        $this->load->view('keuangan/cetaklap',$data);
    }
	
    function pdf()
    {
        $this->load->library(array('cfpdf'));
        $pdf = new FPDF('L','mm','A4');
        $pdf->AddPage();
        $pdf->Line(200, 37, 10, 37);
        $pdf->Line(200, 38, 10, 38);
        $pdf->Cell(10,32,'',0,1,'L');
        $pdf->SetFont('Arial','B',11);
        $pdf->Cell(10,14,'No',1,0,'L');
        $pdf->Cell(25,14,'NIM',1,0,'L');
        $pdf->Cell(83,14,'Nama Mahasiswa',1,0,'L');
        $pdf->Cell(72,7,'PEKA',1,2,'L');
        $pdf->Cell(72,7,'PEKA',1,0,'L');
        $pdf->Cell(72,7,'PEKA',1,0,'L');
        $pdf->Cell(72,7,'SPP',1,2,'L');
        $pdf->Cell(72,7,'PEKA',1,0,'L');
        $pdf->Line(10, 10, 10, 10);
        $pdf->Output();
    }
    
        function _kirim_sms($noHp,$pesan)
    {
            if($noHp!='')
            {
                $pesan  =   str_replace("'", "/", $pesan);
        $jmlSms = ceil(strlen($pesan)/153);
        if($jmlSms==1)
        {
            // kirim ke outbox
            //get senderID
            $sender=  $this->db->get('phones')->row_array();
            $senderID=$sender['ID'];
            $data   =   array(  'DestinationNumber'=>$noHp,
                            'TextDecoded'=>$pesan,
                            'SenderID'=>$senderID,
                            'CreatorID'=>'Nuris');
            $this->db->insert('outbox',$data);
        }
            }
    }
	
	function tampilbiaya()
	{
		$jenis_pembayaran	= $_GET['jenis_pembayaran'];
		$kelas				= $_GET['kelas'];
		$tahun				= $_GET['tahun'];
		$data				= $this->db->get_where('keuangan_biaya_kuliah',array('prodi_id'=>$kelas,'jenis_bayar_id'=>$jenis_pembayaran,'angkatan_id'=>$tahun))->result();
		if($kelas==null){ //kosong
			echo inputan('text', 'jumlah','col-sm-8','Jumlah', 1,'Jumlah','');
		}else{
			if($jenis_pembayaran==1){ //Jika SPP
				foreach($data as $x){
					echo inputan('text', 'jumlah','col-sm-8','', 1,$x->jumlah,array('readonly'=>'readonly'));
				}
			}elseif($jenis_pembayaran==5 || $jenis_pembayaran==6){ //Jika UTS dan UAS
				foreach($data as $x){
					echo inputan('text', 'jumlah','col-sm-8','', 1,$x->jumlah/2,array('readonly'=>'readonly'));
				}
			}else{
				echo inputan('text', 'jumlah','col-sm-8','Jumlah', 1,'','');
			}
		}
	}
	
	function notifikasi($nis)
	{
		$id			= getField('telegram', 'chat_id', 'nis', $nis);
		$nama		= getField('student_siswa', 'nama', 'nim', $nis);
		$now		= substr(waktu(),0,10);
		$tgl_bayar 	= $this->db->get_where('keuangan_pembayaran_detail', array('nim'=>$nis,'left(tanggal,10)'=>$now))->result();
		$text		= "Yth Bpk/Ibu. Siswa/i ".$nama." sudah melakukan Pembayaran :\n";
		$no			= 1;
		foreach($tgl_bayar as $tb)
		{ 
			$jenis_bayar= getField('keuangan_jenis_bayar', 'keterangan', 'jenis_bayar_id', $tb->jenis_bayar_id);
			$detail		= $no.". ".$jenis_bayar." sebesar Rp.".rp((int)$tb->jumlah);
			$text .= " ".$detail .= " tanggal ".$tb->tanggal."\n";
			$no++;
		}
		$data = [
				'chat_id'             => $id,
				'text'                => $text,
				'parse_mode'          => 'Markdown'
				];
		apiRequest('sendMessage', $data);
		//$this->telegram->apiRequest('sendMessage', $data);
		//echo $this->telegram->send->chat("403119565");
		// echo $this->telegram->send();
		// echo $this->telegram->send->text(json_encode('ABC'))->send();
	}
}
?>
