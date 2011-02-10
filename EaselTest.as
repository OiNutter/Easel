package  {
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import oinutter.easel.Easel;
	/**
	 * ...
	 * @author Will McKenzie
	 */
	public class EaselTest extends MovieClip{
		
		public function EaselTest() {
			
			var origColour = Math.round(Math.random() * 0xFFFFFF);
			var mixer = 0xFF3232;
						
			var orig = new Shape();
			orig.graphics.beginFill(origColour);
			orig.graphics.drawRect(0, 0, 150, 50);
			orig.y = 5;
			orig.x = (stage.stageWidth / 2) - 155;
			addChild(orig);
			
			var origLabel = new TextField();
			origLabel.text = "Original: #" + Number(origColour).toString(16);
			origLabel.y = 20;
			origLabel.x = (stage.stageWidth / 2) + 5;
			addChild(origLabel) ;
			
			var darken = new Shape();
			darken.graphics.beginFill(Easel.darken(origColour,0.25));
			darken.graphics.drawRect(0, 0, 150, 50);
			darken.y = 60;
			darken.x = (stage.stageWidth / 2) - 155;
			addChild(darken);
			
			var darkenLabel = new TextField();
			darkenLabel.text = "Darken: #" + Number(Easel.darken(origColour,0.25)).toString(16);
			darkenLabel.y = 75;
			darkenLabel.x = (stage.stageWidth / 2) + 5;
			addChild(darkenLabel) ;
			
			var lighten = new Shape();
			lighten.graphics.beginFill(Easel.lighten(origColour,0.25));
			lighten.graphics.drawRect(0, 0, 150, 50);
			lighten.y =115;
			lighten.x = (stage.stageWidth / 2) - 155;
			addChild(lighten);
			
			var lightenLabel = new TextField();
			lightenLabel.text = "Lighten: #" + Number(Easel.lighten(origColour,0.25)).toString(16);
			lightenLabel.y = 130;
			lightenLabel.x = (stage.stageWidth / 2) + 5;
			addChild(lightenLabel);
			
			var complement = new Shape();
			complement.graphics.beginFill(Easel.complement(origColour));
			complement.graphics.drawRect(0, 0, 150, 50);
			complement.y =170;
			complement.x = (stage.stageWidth / 2) - 155;
			addChild(complement);
			
			var complementLabel = new TextField();
			complementLabel.text = "Complement: #" + Number(Easel.complement(origColour)).toString(16);
			complementLabel.autoSize = TextFieldAutoSize.CENTER;
			complementLabel.y = 185;
			complementLabel.x = (stage.stageWidth / 2) + 5;
			addChild(complementLabel);
			
			var grayscale = new Shape();
			grayscale.graphics.beginFill(Easel.grayscale(origColour));
			grayscale.graphics.drawRect(0, 0, 150, 50);
			grayscale.y =225;
			grayscale.x = (stage.stageWidth / 2) - 155;
			addChild(grayscale);
			
			var grayscaleLabel = new TextField();
			grayscaleLabel.text = "Grayscale: #" + Number(Easel.grayscale(origColour)).toString(16);
			grayscaleLabel.autoSize = TextFieldAutoSize.CENTER;
			grayscaleLabel.y = 240;
			grayscaleLabel.x = (stage.stageWidth / 2) + 5;
			addChild(grayscaleLabel);
			
			var desaturate = new Shape();
			desaturate.graphics.beginFill(Easel.desaturate(origColour,0.1));
			desaturate.graphics.drawRect(0, 0, 150, 50);
			desaturate.y =280;
			desaturate.x = (stage.stageWidth / 2) - 155;
			addChild(desaturate);
			
			var desaturateLabel = new TextField();
			desaturateLabel.text = "Desaturate: #" + Number(Easel.desaturate(origColour,0.1)).toString(16);
			desaturateLabel.autoSize = TextFieldAutoSize.CENTER;
			desaturateLabel.y = 295;
			desaturateLabel.x = (stage.stageWidth / 2) + 5;
			addChild(desaturateLabel);
			
			var saturate = new Shape();
			saturate.graphics.beginFill(Easel.saturate(origColour,0.1));
			saturate.graphics.drawRect(0, 0, 150, 50);
			saturate.y =335;
			saturate.x = (stage.stageWidth / 2) - 155;
			addChild(saturate);
			
			var saturateLabel = new TextField();
			saturateLabel.text = "Saturate: #" + Number(Easel.saturate(origColour,0.1)).toString(16);
			saturateLabel.autoSize = TextFieldAutoSize.CENTER;
			saturateLabel.y = 350;
			saturateLabel.x = (stage.stageWidth / 2) + 5;
			addChild(saturateLabel);
			
			var mix = new Shape();
			mix.graphics.beginFill(Easel.mix(origColour,mixer));
			mix.graphics.drawRect(0, 0, 150, 50);
			mix.y =390;
			mix.x = (stage.stageWidth / 2) - 155;
			addChild(mix);
			
			var mixLabel = new TextField();
			mixLabel.text = "Mix: #" + Number(Easel.mix(origColour,mixer)).toString(16);
			mixLabel.autoSize = TextFieldAutoSize.CENTER;
			mixLabel.y = 405;
			mixLabel.x = (stage.stageWidth / 2) + 5;
			addChild(mixLabel);
		}
		
	}

}