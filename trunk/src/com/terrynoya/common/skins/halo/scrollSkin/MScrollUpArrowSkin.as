package com.terrynoya.common.skins.halo.scrollSkin
{
	import com.terrynoya.common.skins.halo.MButtonSkin;

	import flash.display.DisplayObject;
	import flash.display.GradientType;
	import flash.display.Graphics;

	public class MScrollUpArrowSkin extends MButtonSkin
	{
		private var horizontal:Boolean = true;

		public function MScrollUpArrowSkin()
		{
			super();
			this.w = 15;
			this.h = 15;
		}

		override public function get upSkin():DisplayObject
		{

			this.graphics.clear();

			drawRoundRect(
				0, 0, w, h, 0,
				0xFFFFFF, 1);

			var upFillColors:Array = [fillColors[0], fillColors[1]];
			var upFillAlphas:Array = [fillAlphas[0], fillAlphas[1]];

			// border
			drawRoundRect(
				0, 0, w, h, 0,
				borderColors, 1,
				horizontal ?
				horizontalGradientMatrix(0, 0, w, h) :
				verticalGradientMatrix(0, 0, w, h),
				GradientType.LINEAR, null, 
				{ x: 1, y: 1, w: w - 2, h: h - 2, r: 0 });

			// fill
			drawRoundRect(
				1, 1, w - 2, h - 2, 0,
				upFillColors, upFillAlphas,
				horizontal ?
				horizontalGradientMatrix(0, 0, w - 2, h - 2) :
				verticalGradientMatrix(0, 0, w - 2, h - 2 / 2));

			// top highlight
			drawRoundRect(
				1, 1, w - 2, h - 2 / 2, 0,
				[ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
				horizontal ?
				horizontalGradientMatrix(0, 0, w - 2, h - 2) :
				verticalGradientMatrix(0, 0, w - 2, h - 2 / 2));
			this.drawArrow();
			return this;
		}

		override public function get downSkin():DisplayObject
		{
			this.graphics.clear();
			drawRoundRect(
				0, 0, w, h, 0,
				[ themeColor, derStyles.themeColDrk1 ], 1,
				horizontal ?
				horizontalGradientMatrix(0, 0, w, h) :
				verticalGradientMatrix(0, 0, w, h),
				GradientType.LINEAR, null, 
				{ x: 1, y: 1, w: w - 2, h: h - 2, r: 0 });

			// fill
			drawRoundRect(
				1, 1, w - 2, h - 2, 0,
				[ derStyles.fillColorPress1,
				derStyles.fillColorPress2 ], 1,
				horizontal ?
				horizontalGradientMatrix(0, 0, w - 2, h - 2) :
				verticalGradientMatrix(0, 0, w - 2, h - 2));

			// top highlight
			drawRoundRect(
				1, 1, w - 2, h -2 / 2, 0,
				[ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
				horizontal ?
				horizontalGradientMatrix(0, 0, w - 2, h - 2) :
				verticalGradientMatrix(0, 0, w - 2, h - 2 / 2));
			this.drawArrow();
			return this;
		}

		override public function get overSkin():DisplayObject
		{
			this.graphics.clear();
			var overFillColors:Array;
			if(fillColors.length > 2)
				overFillColors = [fillColors[2], fillColors[3]];
			else
				overFillColors = [fillColors[0], fillColors[1]];

			var overFillAlphas:Array;
			if(fillAlphas.length > 2)
				overFillAlphas = [fillAlphas[2], fillAlphas[3]];
			else
				overFillAlphas = [fillAlphas[0], fillAlphas[1]];

			// white backing to force the scroll elements
			// to match other components by default
			drawRoundRect(
				0, 0, w, h, 0,
				0xFFFFFF, 1);

			// border
			drawRoundRect(
				0, 0, w, h, 0,
				[ themeColor, derStyles.themeColDrk1 ], 1,
				horizontal ?
				horizontalGradientMatrix(0, 0, w, h) :
				verticalGradientMatrix(0, 0, w, h),
				GradientType.LINEAR, null, 
				{ x: 1, y: 1, w: w - 2, h: h - 2, r: 0});

			// fill
			drawRoundRect(
				1, 1, w - 2, h - 2, 0,
				overFillColors, overFillAlphas,
				horizontal ?
				horizontalGradientMatrix(0, 0, w - 2, h - 2) :
				verticalGradientMatrix(0, 0, w - 2, h - 2));

			// top highlight
			drawRoundRect(
				1, 1, w - 2, h -2 / 2, 0,
				[ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
				horizontal ?
				horizontalGradientMatrix(0, 0, w - 2, h - 2) :
				verticalGradientMatrix(0, 0, w - 2, h - 2 / 2));
			this.drawArrow();
			return this;
		}

		override public function get disabledSkin():DisplayObject
		{
			return this;
		}

		private function drawArrow():void
		{
			var g:Graphics = this.graphics;
			g.beginFill(0x000000);
			g.moveTo(w / 2, 6);
			g.lineTo(w - 5, h - 6);
			g.lineTo(5, h - 6);
			g.lineTo(w / 2, 6);
			g.endFill();
		}
	}
}