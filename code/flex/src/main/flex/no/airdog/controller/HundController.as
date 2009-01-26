package no.airdog.controller
{
	import mx.collections.ArrayCollection;
	
	import no.airdog.domain.hund.Hund;
	
	public class HundController
	{
		private var hunder:ArrayCollection;
		
		public function get alleHunder():ArrayCollection
		{
			return getDummyHunder();
		}
		
		private function getDummyHunder():ArrayCollection
		{
			hunder = new ArrayCollection();
			
			for (var i:int = 0; i < 10; i++)
			{
				var tempHund:Hund = new Hund();
				tempHund.id = i;
				tempHund.navn = "<NAVN " + i + ">";
				tempHund.tittel = "<TITTEL " + i + ">";
				tempHund.bilde = "Hund1.jpg";
				hunder.addItem(tempHund);	
			}
			
			return hunder;
		}	
	}
}