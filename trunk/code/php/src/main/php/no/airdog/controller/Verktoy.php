<?php 
class Verktoy
{	
	// Inn: 10.01.2001
	// Ut:	2001-01-10
	public static function konverterDatTilDatabaseDato($dato)
	{
		$datoArray = split('[.]', trim($dato));
		
		if (!isset($datoArray[2]))
			return $dato;
		
		return $datoArray[2]."-".$datoArray[1]."-".$datoArray[0];
	}
	
	// Inn: 2001-01-10
	// Ut:	10.01.2001
	public static function konverterDatabaseTilDatDato($dato)
	{
		$datoArray = split('[-]', trim($dato));
		
		if (!isset($datoArray[2]))
			return $dato;
		
		return $datoArray[2].".".$datoArray[1].".".$datoArray[0];
	}
	
	
	public static function hvilkeUrl() 
	{
		 $url = 'http://';
		 
		 if ($_SERVER["SERVER_PORT"] != "80") 
		 {
		 	$url .= $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"].$_SERVER["REQUEST_URI"];
		 }
		 else
		 {
		 	$url .= $_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
		 }
		 return $url;
	}
	
	
	public static function hoppBakover($url, $antall)
	{	
		$url = str_replace("\\","/",$url);
		
		$url = split("/", $url);
		$sti = "";
		
		$strek = "";
		
		for ($i = 0; $i < sizeof($url) - $antall; $i++)
		{
			$sti .= $strek . $url[$i];
			$strek = "/";
		}
		
		return $sti;
	}
}