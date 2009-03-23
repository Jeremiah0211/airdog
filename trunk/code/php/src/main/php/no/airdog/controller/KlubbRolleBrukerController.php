<?php
require_once "database/KlubbRolleBrukerDatabase.php";
require_once "database/ACLDatabase.php";
require_once "database/RolleRettighetDatabase.php";

require_once 'database/ValiderBruker.php';
require_once 'database/Tilkobling.php';

class KlubbRolleBrukerController
{
	private $database;
	
	public function __construct()
	{
		$tilkobling = new Tilkobling();
		$this->database = $tilkobling->getTilkobling();
	}
	
	public function hentAlleBrukere($brukerEpost, $brukerPassord, $klubbId)
	{
		if(ValiderBruker::validerBrukerRettighet($this->database, $brukerEpost, $brukerPassord, $klubbId, "klubbRolleBrukerHandtering"))
		{
			$db = new KlubbRolleBrukerDatabase();
			return $db->hentAlleBrukere();
		}

		$feilkode = 1;
		throw(new Exception('Du har ikke denne rettigheten', $feilkode));
	}
	
	public function hentKlubbersRollersBrukere($brukerEpost, $brukerPassord, $klubbId)
	{
		if(ValiderBruker::validerBrukerRettighet($this->database, $brukerEpost, $brukerPassord, $klubbId, "klubbRolleBrukerHandtering"))
		{
			$dbACL = new ACLDatabase();
			$klubber = $dbACL->hentAlleKlubber();
			
			$db = new KlubbRolleBrukerDatabase();
			
			$dbRR = new RolleRettighetDatabase();			

	   		foreach($klubber as $klubb)
	   		{
	   			if(ValiderBruker::validerBrukerRettighet($this->database, $brukerEpost, $brukerPassord, $klubb['raseid'], "klubbRolleBrukerHandtering"))
				{	   
		   			$tempRoller = array();
		   			$roller['roller'] = $dbRR->hentAlleRoller();
		   			
		   			foreach($roller['roller'] as $rolle)
		   			{
		   				$rolle['brukere'] = $db->hentRollesBrukere($rolle['navn'], $klubb['raseid']);
		   				$tempRoller[] = $rolle;
		   			}
		   			
		   			$klubb['roller'] = $tempRoller;
		   			$tmp[] = $klubb;
				}
	   		}
			
			return $tmp;
		}

		$feilkode = 1;
		throw(new Exception('Du har ikke denne rettigheten', $feilkode));
	}
	
	public function leggBrukerTilRollePaKlubb($klubb, $rolle, $bruker, $brukerEpost, $brukerPassord, $klubbId)
	{
		if(ValiderBruker::validerBrukerRettighet($this->database, $brukerEpost, $brukerPassord, $klubbId, "klubbRolleBrukerHandtering"))
		{
			$db = new KlubbRolleBrukerDatabase();
			$db->leggBrukerTilRollePaKlubb($klubb, $rolle, $bruker);
			
			return $this->hentKlubbersRollersBrukere($brukerEpost, $brukerPassord, $klubbId);
		}

		$feilkode = 1;
		throw(new Exception('Du har ikke denne rettigheten', $feilkode));
	}
	
	
	public function slettBrukerFraRollePaKlubb($klubb, $rolle, $bruker, $brukerEpost, $brukerPassord, $klubbId)
	{
		if(ValiderBruker::validerBrukerRettighet($this->database, $brukerEpost, $brukerPassord, $klubbId, "klubbRolleBrukerHandtering"))
		{
			$db = new KlubbRolleBrukerDatabase();
			$db->slettBrukerFraRollePaKlubb($klubb, $rolle, $bruker);
			
			return $this->hentKlubbersRollersBrukere($brukerEpost, $brukerPassord, $klubbId);
		}

		$feilkode = 1;
		throw(new Exception('Du har ikke denne rettigheten', $feilkode));
	}
	
	public function slettBruker($epost, $brukerEpost, $brukerPassord, $klubbId)
	{
		if(ValiderBruker::validerBrukerRettighet($this->database, $brukerEpost, $brukerPassord, $klubbId, "klubbRolleBrukerHandtering"))
		{
			$db = new KlubbRolleBrukerDatabase();
			$db->slettBruker($epost);
			
			return $this->hentAlleBrukere($brukerEpost, $brukerPassord, $klubbId);
		}

		$feilkode = 1;
		throw(new Exception('Du har ikke denne rettigheten', $feilkode));
		
	}
	
	public function leggInnBruker($bruker, $brukerEpost, $brukerPassord, $klubbId)
	{
		if(ValiderBruker::validerBrukerRettighet($this->database, $brukerEpost, $brukerPassord, $klubbId, "klubbRolleBrukerHandtering"))
		{		
			$ret = array();
	    	$ret['epost'] = $bruker->epost;
	    	$ret['fornavn'] = $bruker->fornavn;
	    	$ret['etternavn'] = $bruker->etternavn;
	    	$ret['passord'] = sha1($bruker->passord);
	    	$ret['superadmin'] = $bruker->superadmin;  	

			$db = new KlubbRolleBrukerDatabase();
			$db->leggInnBruker($ret);
			
			return $this->hentAlleBrukere($brukerEpost, $brukerPassord, $klubbId);
		}

		$feilkode = 1;
		throw(new Exception('Du har ikke denne rettigheten', $feilkode));
		
	}
	
	public function redigerBruker($fraBruker, $tilBruker, $brukerEpost, $brukerPassord, $klubbId)
	{
		if(ValiderBruker::validerBrukerRettighet($this->database, $brukerEpost, $brukerPassord, $klubbId, "klubbRolleBrukerHandtering"))
		{
			$fra = array();
	    	$fra['epost'] = $fraBruker->epost;
	    	$fra['fornavn'] = $fraBruker->fornavn;
	    	$fra['etternavn'] = $fraBruker->etternavn;
	    	$fra['passord'] = sha1($fraBruker->passord);
	    	$fra['superadmin'] = $fraBruker->superadmin; 
	    	
	    	$til = array();
	    	$til['epost'] = $tilBruker->epost;
	    	$til['fornavn'] = $tilBruker->fornavn;
	    	$til['etternavn'] = $tilBruker->etternavn;
	    	$til['passord'] = sha1($tilBruker->passord);
	    	$til['superadmin'] = $tilBruker->superadmin; 	

			$db = new KlubbRolleBrukerDatabase();
			$db->redigerBruker($fra, $til);
			
			return $this->hentAlleBrukere($brukerEpost, $brukerPassord, $klubbId);
		}

		$feilkode = 1;
		throw(new Exception('Du har ikke denne rettigheten', $feilkode));
	}
}