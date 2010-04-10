package com.terrynoya.common.skins.halo
{
	import flash.display.DisplayObject;
	import flash.display.GradientType;
	import flash.display.Graphics;

	public class MCheckBoxSkin extends MButtonSkin
	{
		public function MCheckBoxSkin()
		{
			super();
			this.w = 15;
			this.h = 15;
		}

		override public function get upSkin():DisplayObject
		{
			graphics.clear();
			var upFillColors:Array = [fillColors[0], fillColors[1]];
			var upFillAlphas:Array = [fillAlphas[0], fillAlphas[1]];

			// border
			drawRoundRect(
				0, 0, w, h, 0,
				[ borderColor, borderColorDrk1 ], 1,
				verticalGradientMatrix(0, 0, w, h ),
				GradientType.LINEAR, null, 
				{ x: 1, y: 1, w: w - 2, h: h - 2, r: 0 });


			// box fill
			drawRoundRect(
				1, 1, w - 2, h - 2, 0,
				upFillColors, upFillAlphas,
				verticalGradientMatrix(1, 1, w - 2, h - 2));

			// top highlight
			drawRoundRect(
				1, 1, w - 2, (h - 2) / 2, 0,
				[ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
				verticalGradientMatrix(1, 1, w - 2, (h - 2) / 2));


			return this;
		}

		override public function get downSkin():DisplayObject
		{
			graphics.clear();
			drawRoundRect(
				0, 0, w, h, 0,
				[ themeColor, themeColorDrk1 ], 1,
				verticalGradientMatrix(0, 0, w, h));

			// box fill
			drawRoundRect(
				1, 1, w - 2, h - 2, 0,
				[ derStyles.fillColorPress1,
				derStyles.fillColorPress2 ], 1,
				verticalGradientMatrix(1, 1, w - 2, h - 2));

			// top highlight
			drawRoundRect(
				1, 1, w - 2, (h - 2) / 2, 0,
				[ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
				verticalGradientMatrix(1, 1, w - 2, (h - 2) / 2));

			return this;
		}

		override public function get overSkin():DisplayObject
		{
			graphics.clear();
			var overFillColors:Array;
			var overFillAlphas:Array;

			if(fillColors.length > 2)
				overFillColors = [fillColors[2], fillColors[3]];
			else
				overFillColors = [fillColors[0], fillColors[1]];

			if(fillAlphas.length > 2)
				overFillAlphas = [fillAlphas[2], fillAlphas[3]];
			else
				overFillAlphas = [fillAlphas[0], fillAlphas[1]];

			// border
			drawRoundRect(
				0, 0, w, h, 0,
				[ themeColor, themeColorDrk1 ], 1,
				verticalGradientMatrix(0, 0, w, h),
				GradientType.LINEAR, null, 
				{ x: 1, y: 1, w: w - 2, h: h - 2, r: 0 });

			// box fill
			drawRoundRect(
				1, 1, w - 2, h - 2, 0,
				overFillColors, overFillAlphas,
				verticalGradientMatrix(1, 1, w - 2, h - 2));

			// top highlight
			drawRoundRect(
				1, 1, w - 2, (h - 2) / 2, 0,
				[ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
				verticalGradientMatrix(1, 1, w - 2, (h - 2) / 2));

			return this;
		}

		override public function get disabledSkin():DisplayObject
		{
			return this;
		}

		public function get selectedSkin():DisplayObject
		{
			graphics.clear();
			var bDrawCheck:Boolean = true;

			var upFillColors:Array = [fillColors[0], fillColors[1]];
			var upFillAlphas:Array = [fillAlphas[0], fillAlphas[1]];

			// border
			drawRoundRect(
				0, 0, w, h, 0,
				[ borderColor, borderColorDrk1 ], 1,
				verticalGradientMatrix(0, 0, w, h),
				GradientType.LINEAR, null, 
				{ x: 1, y: 1, w: w - 2, h: h - 2, r: 0 });

			// box fill
			drawRoundRect(
				1, 1, w - 2, h - 2, 0,
				upFillColors, upFillAlphas,
				verticalGradientMatrix(1, 1, w - 2, h - 2));

			// top highlight
			drawRoundRect(
				1, 1, w - 2, (h - 2) / 2, 0,
				[ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
				verticalGradientMatrix(1, 1, w - 2, (h - 2) / 2));
				
			var g:Graphics = this.graphics;
			g.beginFill(0x000000);
			g.moveTo(3, 5);
			g.lineTo(5, 10);
			g.lineTo(7, 10);
			g.lineTo(12, 2);
			g.lineTo(13, 1);
			g.lineTo(11, 1);
			g.lineTo(6.5, 7);
			g.lineTo(5, 5);
			g.lineTo(3, 5);
			g.endFill();
			return this;
		}
	}
}