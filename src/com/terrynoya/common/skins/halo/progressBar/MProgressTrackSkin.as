package com.terrynoya.common.skins.halo.progressBar
{
	import com.terrynoya.common.skins.halo.MSkin;

	public class MProgressTrackSkin extends MSkin
	{
		public function MProgressTrackSkin()
		{
			super();
			this.w=100;
			this.h=30;
			this.draw();
		}
		
		override protected function draw():void
		{
			// User-defined styles
			var borderColor:uint = 0xb7babc;
			var fillColors:Array = [0xe7e7e7,0xffffff];
//			var borderColor:uint = getStyle("borderColor");
//			var fillColors:Array = getStyle("trackColors") as Array;
//			StyleManager.getColorNames(fillColors);
			
			var borderColorDrk1:Number = 0x8082083;
			// ProgressTrack-unique styles
//			var borderColorDrk1:Number =
//				ColorUtil.adjustBrightness2(borderColor, -30);
			
			graphics.clear();
			
			drawRoundRect(
				0, 0, w, h, 0, 
				[ borderColorDrk1, borderColor ], 1,
				verticalGradientMatrix(0, 0, w, h));
			
			drawRoundRect(
				1, 1, w - 2, h - 2, 0,
				fillColors, 1,
				verticalGradientMatrix(1, 1, w - 2, h - 2));
		}
	}
}