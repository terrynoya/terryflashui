package com.terrynoya.common.skins.halo.scrollSkin
{
	import com.terrynoya.common.skins.halo.MButtonSkin;

	import flash.display.DisplayObject;
	import flash.display.GradientType;

	public class MScrollTrackSkin extends MButtonSkin
	{

		public function MScrollTrackSkin()
		{
			super();
			this.w = 15;
			this.h = 10;
			
			
		}

		override public function get upSkin():DisplayObject
		{
			this.graphics.clear();
			var fillColors:Array = [0x94999b,0xe7e7e7];

			graphics.clear(); 

			var fillAlpha:Number = 1;
			
			drawRoundRect(
				0, 0, w, h, 0,
				[ borderColor, borderColorDrk1 ], fillAlpha,
				verticalGradientMatrix(0, 0, w, h),
				GradientType.LINEAR, null,
				{ x: 1, y: 1, w: w - 2, h: h - 2, r: 0 });

			// fill
			drawRoundRect(
				1, 1, w - 2, h - 2, 0,
				fillColors, fillAlpha, 
				horizontalGradientMatrix(1, 1, w / 3 * 2, h - 2));
			return this;
		}

		override public function get downSkin():DisplayObject
		{
			return this;
		}

		override public function get overSkin():DisplayObject
		{
			return this;
		}

		override public function get disabledSkin():DisplayObject
		{
			return this;
		}

	}
}