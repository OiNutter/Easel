package oinutter.easel {
	/**
	 * ...
	 * @author Will McKenzie
	 */
	public class Easel{
		
		public static function mix(color1:Number, color2:Number,weight:Number = 0.5) {
			 var rgb1 = getRGB(color1),
				  rgb2 = getRGB(color2),
				  p = weight,
				  w = p * 2 - 1,
				  a = 0;// color1.alpha - color2.alpha

				  var w1 = (((w * a == -1) ? w : (w + a) / (1 + w * a)) + 1) / 2.0
				  var w2 = 1 - w1,
					r = (rgb1.r * w1) + (rgb2.r * w2),
					g = (rgb1.g * w1) + (rgb2.g * w2),
					b = (rgb1.b * w1) + (rgb2.b * w2);
        
					//alpha = color1.alpha*p + color2.alpha*(1-p)
      			
            return getHex(r, g, b);
		}
		
		public static function lighten(color:Number, ratio:Number) {
			var hsl:Object = getHSL(color);
			hsl.l += (100 * ratio);
			if (hsl.l > 100)
				hsl.l = 100;
			var rgb = hslToRgb(hsl);
            return (getHex(rgb.r, rgb.g, rgb.b));
		}
		
		public static function darken(color:Number, ratio:Number) {
			var hsl:Object = getHSL(color);
			hsl.l -= (100 * ratio);
			if (hsl.l < 0)
				hsl.l = 0;
			var rgb = hslToRgb(hsl);
            return (getHex(rgb.r, rgb.g, rgb.b));
		}
		
		public static function desaturate(color:Number, ratio:Number) {
			var hsl:Object = getHSL(color);
			hsl.s -= (100 * ratio);
			if (hsl.s < 0)
				hsl.s = 0;
			var rgb = hslToRgb(hsl);
			return getHex(rgb.r, rgb.g,rgb.b);
		}
		
		public static function saturate(color:Number, ratio:Number) {
			var hsl:Object = getHSL(color);
			hsl.s += (100 * ratio);
			if (hsl.s > 100)
				hsl.s = 100;
			var rgb = hslToRgb(hsl);
			return getHex(rgb.r, rgb.g,rgb.b);
		}
				
		public static function grayscale(color:Number) {
			return desaturate(color, 1);		
		}
		
		public static function complement(color:Number) {
			var hsl:Object = getHSL(color);
			
			hsl.h += 180;
			var rgb:Object = hslToRgb(hsl);
						
			return (getHex(rgb.r, rgb.g, rgb.b));
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
		
		public static function getHSL(color:Number):Object {
			//Algorithm from http://en.wikipedia.org/wiki/HSL_and_HSV#Conversion_from_RGB_to_HSL_or_HSV
			var rgb = getRGB(color),
				r = rgb.r/255,
				g = rgb.g/255,
				b = rgb.b/255,
				max = Math.max(r, g, b),
				min = Math.min(r, g, b),
				d = max - min,
				h, s, l;
		
			switch(max) {
				case min : h = 0; break;
				case r : h =  60 * (g - b) / d; break;
				case g :h= 60 * (b - r) / d + 120 ; break;
				case b: h = 60 * (r - g) / d + 240; break;
			}
							
			l = (max + min) / 2;

			if (max == min)
				s = 0;
			else if(l < 0.5)
				s = d / (2 * l);
			else
				s = d / (2 - 2 *l );
				
			return { h:(h % 360), s:(s * 100), l:(l * 100) };
      
		}
		
		public static function hslToRgb(hsl:Object) {
			//Algorithm from the CSS3 spec: http://www.w3.org/TR/css3-color/#hsl-color.
			var h = hsl.h / 360,
				 s = hsl.s / 100,
				 l = hsl.l / 100,
				m2 = l <= 0.5 ? l * (s + 1) : l + s - l * s,
				m1 = l * 2 - m2,
				r = Math.round(hueToRgb(m1, m2, h + (1 / 3))*0xFF),
				g = Math.round(hueToRgb(m1, m2, h)*0xFF),
				b = Math.round(hueToRgb(m1, m2, h - (1 / 3))*0xFF);
				
			  return {r:r,g:g,b:b}
		}
		
		private static function hueToRgb(m1:Number,m2:Number,h:Number) {
			if(h<0)
				h += 1;
				
			if (h > 1)
				h -= 1;
			
			if ( h * 6 < 1) 
				return m1 + (m2 - m1) * h * 6;
			else if (h * 2 < 1)
				return m2;
			else if (h * 3 < 2)
				return m1 + (m2 - m1) * ((2.0 / 3) - h) * 6;
			else
				return m1;
		}
		
	}
}