package oinutter.easel {
	/**
	 * ...
	 * @author Will McKenzie
	 */
	public class Easel{
		
		public static function mix(color1:Number, color2:Number) {
			   var rgb1:Object = getRGB(color1),
					rgb2:Object = getRGB(color2);
            
			for (var ele in rgb1){
                rgb1[ele] = rgb1[ele] + (rgb2[ele] - rgb1[ele]) * ratio;
                if (rgb1[ele] > 255) rgb1[ele] = 255;
                if (rgb1[ele] < 0) rgb1[ele] = 0;
            }
			
            return getHex(rgb1.r, rgb1.g, rgb1.b);
		}
		
		public static function lighten(color:Number, ratio:Number) {
			var rgb:Object = getRGB(color);
            for (var ele in rgb){
                rgb[ele] += (255 - rgb[ele]) * ratio;
            }
            return getHex(rgb.r, rgb.g, rgb.b);
		}
		
		public static function darken(color:Number, ratio:Number) {
			var rgb:Object = getRGB(color);
            for (var ele in rgb){
                rgb[ele] = rgb[ele] * (1-ratio);
            }
            return (getHex(rgb.r, rgb.g, rgb.b));
		}
		
		public static function desaturate(color:Number, ratio:Number) {
			
		}
		
		public static function saturate(color:Number, ratio:Number) {
			
		}
		
		public static function fadeOut(color:Number, ratio:Number) {
			
		}
		
		public static function fadeIn(color:Number, ratio:Number) {
			
		}
		
		public static function grayscale(color:Number) {
			
		}
		
		public static function complement(color:Number) {
				var r = initialColor >>> 16 & 0xFF,
				g = initialColor >>> 8 & 0xFF,
				b = initialColor & 0xFF,
				rc = r ^ 0xFF,
				gc = g ^ 0xFF,
				bc = b ^ 0xFF;

				return rc << 16 | gc << 8 | bc
		}
		
		public static function getHex(r:Number, g:Number, b:Number):Number{
            var rgb:String = "0x" + (r<16?"0":"") + r.toString(16) + (g<16?"0":"") + g.toString(16) + (b<16?"0":"") + b.toString(16);
            return Number(rgb);
        }

        public static function getRGB(color:Number):Object{
            var r = color >> 16 & 0xFF,
				g = color >> 8 & 0xFF,
				b = color & 0xFF;
            return {r:r, g:g, b:b};
        }
		
	}

}