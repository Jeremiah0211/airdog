package no.airdog.controller
{
	import flash.events.*;
	import flash.geom.Rectangle;
	
	import mx.containers.HBox;
	import mx.containers.VBox;
	import mx.controls.*;
	import mx.core.UIComponent;
	import mx.events.*;
	
	import no.airdog.model.Hund;
	import no.airdog.services.Components;
	
	public class HundeStamtre extends HBox
	{
		private var _box:HBox;
		
		public function HundeStamtre()
		{
			this.setStyle("horizontalAlign", "center");
			this.setStyle("verticalAlign", "middle");
			this.setStyle("width", "100%");
			this.setStyle("height", "100%");
		}
		
		public function set hund(val:Hund):void
		{
			while (this.numChildren > 0)
			{             
				this.removeChildAt(0);        
			}
			
			if (val != null)
			{
				_box = leggTilHund(val);
				this.addChild(_box);
			}
			else
			{
				_box = null;
				this.invalidateDisplayList();
			}
		}
			
		private function visHund(event:Event):void
		{
			var sender:Button = event.target as Button;
			if (sender != null)
			{
				Components.instance.controller.visHund(sender.data.toString());
			}
		}
		
		private function oppdaterStrek(event:Event):void
		{
			this.invalidateDisplayList();
		}
		
		private function leggTilHund(hund:Hund):HBox
		{
			var hBox:HBox = new HBox();
			var button:Button = new Button();
			var vBox:VBox = new VBox();
			
			hBox.setStyle("verticalAlign","middle")
			hBox.addChild(button);
			hBox.addChild(vBox);
			
			button.name = "hundKnapp";
			button.label = hund.navn;
			button.width = 190;
			button.data = hund.hundId;
			button.addEventListener(MouseEvent.CLICK, visHund);
			button.addEventListener(FlexEvent.UPDATE_COMPLETE, oppdaterStrek);
			
			vBox.name = "foreldreBoks";
			
			if (hund.far != null && hund.far.navn != null)
			{
				vBox.addChild(leggTilHund(hund.far));
			}
			
			if (hund.mor != null && hund.mor.navn != null)
			{
				vBox.addChild(leggTilHund(hund.mor));
			}
	
			return hBox;
		}
		
		private function tegnStrek(hBox:HBox):void
		{
			var button:Button = hBox.getChildByName("hundKnapp") as Button;
			var buttonRect:Rectangle = button.getRect(this);
			
			var vBox:VBox = hBox.getChildByName("foreldreBoks") as VBox;
			
			if (vBox != null)
			{
				var foreldre:Array = vBox.getChildren();
				
				var i:int;
				for (i = 0; i < foreldre.length; i++) 
				{
					var nyBox:HBox = foreldre[i] as HBox;
					tegnStrek(nyBox);
					
					var nyBoxRect:Rectangle = nyBox.getRect(this);
					
					graphics.moveTo(buttonRect.right, buttonRect.y + (buttonRect.height / 2));
					graphics.lineStyle(3,0xD3D4AA);
					graphics.lineTo(nyBoxRect.x, nyBoxRect.y + (nyBoxRect.height / 2));
				}
			}
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			graphics.clear();
			
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			if (_box != null)
			{
				_box.invalidateSize();
				_box.invalidateProperties();
				_box.invalidateDisplayList();
				tegnStrek(_box);
			}
		}
	}
}