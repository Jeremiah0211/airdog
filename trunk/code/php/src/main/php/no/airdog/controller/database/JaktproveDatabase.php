<?php
require_once 'ValiderBruker.php';
require_once 'Tilkobling.php';
class JaktproveDatabase
{
	private $database;
	
	public function __construct()
	{
		$tilkobling = new Tilkobling();
		$this->database = $tilkobling->getTilkobling();
	}
	
	public function redigerJaktprove($jaktprove, $brukerEpost, $brukerPassord, $klubbId)
	{
		if(ValiderBruker::validerBrukerRettighet($this->database, $brukerEpost, $brukerPassord, $klubbId, "redigerJaktprove"))
		{
			$hvor = $this->database->quoteInto('proveNr = ?', $jaktprove['proveNr']);			
			
			return $this->database->update('nkk_fugl', $jaktprove, $hvor);
		}
		
		$errorCode = 1;	
   		throw(new Exception('Du har ikke denne rettigheten', $errorCode));
	}
	
	public function hentJaktprove($hundId, $brukerEpost, $brukerPassord, $klubbId)
	{
		if(ValiderBruker::validerBrukerRettighet($this->database, $brukerEpost, $brukerPassord, $klubbId, "lese"))
		{
			$select = $this->database->select()
			->from('NKK_fugl') 
			->where('hundId=?',$hundId)
			->where('raseId=?', $klubbId); 
	
			return $this->database->fetchAll($select); 
		}
		
		$errorCode = 1;	
   		throw(new Exception('Du har ikke denne rettigheten', $errorCode));
	}
}