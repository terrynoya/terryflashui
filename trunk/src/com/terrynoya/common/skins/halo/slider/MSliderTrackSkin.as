package com.terrynoya.common.skins.halo.slider
{
	import com.terrynoya.common.skins.halo.MButtonSkin;
	import com.terrynoya.common.util.MColorUtil;
	
	import flash.display.DisplayObject;
	import flash.display.GradientType;
	
	import mx.utils.ColorUtil;

	public class MSliderTrackSkin extends MButtonSkin
	{
		public function MSliderTrackSkin()
		{
			super();
			this.w = 200;
			this.h = 4;
			var borderColorDrk:Number =
			MColorUtil.adjustBrightness2(borderColor, -50);
			graphics.clear();

			drawRoundRect(0,0,w,h,0,0,0); // Draw a transparent rect to fill the entire space

			drawRoundRect(
				1, 0, w, h - 1, 1.5,
				borderColorDrk, 1, null,
				GradientType.LINEAR, null,
				{ x: 2, y: 1, w: w - 2, h: 1, r: 0 });

			drawRoundRect(
				2, 1, w - 2, h - 2, 1,
				borderColor, 1, null,
				GradientType.LINEAR, null,
				{ x: 2, y: 1, w: w - 2, h: 1, r: 0 });

			drawRoundRect(
				2, 1, w - 2, 1, 0,
				fillColors, Math.max(fillAlphas[1] - 0.3, 0),
				horizontalGradientMatrix(2, 1, w - 2, 1));
		}
		 
		override public function get upSkin():DisplayObject
		{
			return this;
		}
		
		override public function get overSkin():DisplayObject
		{
			return this;
		}
		
		override public function get downSkin():DisplayObject
		{
			return this;
		}
		
		override public function get disabledSkin():DisplayObject
		{
			return this;
		}

	}
}