<?php
// Load library phpspreadsheet
require('./excel/vendor/autoload.php');

use PhpOffice\PhpSpreadsheet\Helper\Sample;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
// End load library phpspreadsheet

class laporan extends CI_Controller
{
    function __construct() {
        parent::__construct();
    }
    
    function index()
    {
		
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
		$spreadsheet->setActiveSheetIndex(0)
		->setCellValue('A1', 'LAPORAN KEUANGAN')
		->setCellValue('A2', 'No')
		->setCellValue('B2', 'NIS')
		->setCellValue('C2', 'Nama Siswa');
		$i='D';foreach($jb as $jb)
		{
			$spreadsheet->setActiveSheetIndex(0)
			->setCellValue($i.'2', $jb->keterangan);
			$i++;
		}
		$spreadsheet->setActiveSheetIndex(0)
		->setCellValue($i++.'2', 'Jumlah')
		->setCellValue($i++.'2', 'Kredit')
		->setCellValue($i++.'2', 'Keterangan');
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
}
?>
