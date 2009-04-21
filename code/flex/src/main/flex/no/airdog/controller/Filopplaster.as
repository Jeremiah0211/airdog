package no.airdog.controller
{
	import flash.errors.IllegalOperationError;
	import flash.events.*;
	import flash.net.*;
	
	import mx.collections.ArrayCollection;
	import mx.controls.*;
	
	import no.airdog.model.Opplastning;
	import no.airdog.model.Valg;
	import no.airdog.services.Components;
    
	public class Filopplaster
	{
		private var adresse:String;
        private var fr:FileReference;
        private var pBar:ProgressBar;
		private var bildeTyper:FileFilter;
		private var tekstTyper:FileFilter;
		private var alleTyper:Array;
		private var maksfilStorrelse:Number;	
		private var uploadtekst:TextArea; 
		private var opplastning:Opplastning;
		
		public function Filopplaster(urlAdresse:String, laster:Opplastning)
		{
			adresse = urlAdresse;
			
			opplastning = laster;
			opplastning.ferdig = false;
			opplastning.startet = false;
			opplastning.resultat = "";
			opplastning.objektliste = new ArrayCollection();
			opplastning.objektType = "";
			
			settFilrestriksjoner();
			fr = new FileReference();
            lagEventListerner();
		}
		
		private function settFilrestriksjoner():void
        {

        	if (opplastning.type == "dat")
        	{
        		tekstTyper = new FileFilter("Tekstfiler (*.dat)", "*.dat");
        		alleTyper = new Array(tekstTyper); 
        	}
        	else if (opplastning.type == "bilde")
        	{        		
        		bildeTyper = new FileFilter("Bilder (*.jpg, *.jpeg, *.gif, *.png)", "*.jpg; *.jpeg; *.gif; *.png");
        		alleTyper = new Array(bildeTyper); 
        	}
        	
        	maksfilStorrelse = 50 * 1024;
        }
               
        private function lagEventListerner():void
        {
       		fr.addEventListener(Event.SELECT, selectHandler);
            fr.addEventListener(Event.OPEN, openHandler);
            fr.addEventListener(ProgressEvent.PROGRESS, progressHandler);
            fr.addEventListener(Event.COMPLETE, completeHandler);
            fr.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            fr.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA, uploadCompleteHandler);
        }

        public function velgFil():void
        {
       		try
			{
				fr.browse(alleTyper);
			}
			catch (io:IllegalOperationError)
			{
				Alert.show( String(io.message), "feil filformat", 0);
			}	
        }
		
        private function selectHandler(event:Event):void
        { 
        	opplastning.startet = true;
        	var filstorrelse:Number = Math.round( fr.size / 1024 );
        	 
			if ( filstorrelse <= maksfilStorrelse )
			{
	    		var request:URLRequest = new URLRequest();
	            request.url = adresse;   
	    	    try
			    {
	            	fr.upload(request);
			    }
			    catch (error:Error)
			    {
			        trace("Kunne ikke laste opp fil.");
			    }
			} 
			else {
				Alert.show(String("Filen er for stor! \n\nVelg en fil som er mindre "+ filstorrelse + "KB" ), 
				"Filstørrelsefeil", Alert.OK);
			} 
        }
		
        private function openHandler(event:Event):void
        {
            opplastning.progressBar.label = "Laster opp...";
        }
        
       	private function ioErrorHandler( event:IOErrorEvent ):void 
		{
			Alert.show( "Kan ikke koble til server", "Serverfeil");
			opplastning.progressBar.label = "Kan ikke koble til server";
		}
		
        private function progressHandler(event:ProgressEvent):void
        {
            opplastning.progressBar.label = "Laster opp %3%% : " + Math.round( event.bytesLoaded / 1024 ) + " KB av " +
												   Math.round( event.bytesTotal / 1024 ) + " KB ";
            opplastning.progressBar.setProgress(event.bytesLoaded, event.bytesTotal);
            
            if(opplastning.progressBar.value == opplastning.progressBar.maximum)
            {
            	if(opplastning.type == 'bilde')
            	{
            		opplastning.progressBar.label = "Bilde endret";
            	}
        		else
        		{
        			opplastning.progressBar.label = fr.name + " lastet opp";
        		} 
            	opplastning.venterSQL = true;
            }
        }

        private function completeHandler(event:Event):void
        {
			opplastning.venterSQL = false; 
        	opplastning.startet = false;
	        opplastning.progressBar.setProgress(100, 100);
        }

        private function uploadCompleteHandler(event:DataEvent):void
        {
        	var resultat:Array = event.data.split(/###/);
        	
        	if (resultat[1] != null)
        	{
	        	opplastning.resultat += "Lagt til: " + resultat[4];
	        	opplastning.resultat += "\rOppdatert: " + resultat[3];
	        	
	        	opplastning.resultat += "\rIgnorert: " + resultat[5];
	        	opplastning.resultat += "\r\rFiltype: " + resultat[2];	        	
	        	
	        	opplastning.resultat += "\rGenerelt: " + resultat[1];
	     	
	     		opplastning.objektType = resultat[2];
	     	
	        	for(var i:int = 6; i < resultat.length; i++)
	        	{  		
	        		opplastning.objektliste.addItem(new Valg(resultat[i], false));
	        	}
        	}
        	else
        	{
        		opplastning.resultat += event.data.toString();
        	}
        	
        	opplastning.ferdig = true;
        	
        	
        	if (opplastning.type == "bilde")
        	{  
        		var b:String = Components.instance.session.hundprofil.bilde;
        		
        		if(b != null && b != "")
        		{
        			Components.instance.session.hundprofil.bilde = null;
        			Components.instance.session.hundprofil.bilde = b;
        		}
        		else
        		{
        			Components.instance.controller.visHund(Components.instance.session.hundprofil.hundId);
        		}
        	}
        	
        }		

	}
}