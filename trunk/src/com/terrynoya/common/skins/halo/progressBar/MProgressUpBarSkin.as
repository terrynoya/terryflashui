package com.terrynoya.common.skins.halo.progressBar
{
	import com.terrynoya.common.skins.halo.MSkin;
	
	public class MProgressUpBarSkin extends MSkin
	{
		public function MProgressUpBarSkin()
		{
			super();
			this.w = 100;
			this.h = 30;
			this.draw();
		}
		
		override protected function draw():void
		{
			// User-defined styles
//			var barColorStyle:* = getStyle("barColor");
//			var barColor:uint = StyleManager.isValidStyleValue(barColorStyle) ?
//				barColorStyle :
//				getStyle("themeColor");
			var barColor:uint = 0x9dff;
			var barColor0:Number = 0x66c4ff;
//			var barColor0:Number = ColorUtil.adjustBrightness2(barColor, 40);
			
			// default fill color for halo uses theme color
			var fillColors:Array = [ barColor0, barColor ]; 
			
			graphics.clear();
			
			// glow
			drawRoundRect(
				0, 0, w, h, 0,
				fillColors, 0.5,
				verticalGradientMatrix(0, 0, w - 2, h - 2));
			
			// fill
			drawRoundRect(
				1, 1, w - 2, h - 2, 0,
				fillColors, 1,
				verticalGradientMatrix(0, 0, w - 2, h - 2));
		}
	}
}