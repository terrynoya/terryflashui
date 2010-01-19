package com.terrynoya.common.skins.halo
{
	import flash.display.DisplayObject;
	import flash.display.GradientType;
	import flash.display.Graphics;

	public class MRadioButtonSkin extends MCheckBoxSkin
	{
		private var r:Number = 7;

		public function MRadioButtonSkin()
		{
			super();
		}

		override public function get upSkin():DisplayObject
		{
			var g:Graphics = this.graphics;
			g.clear();
			var upFillColors:Array = [fillColors[0], fillColors[1]];
			var upFillAlphas:Array = [fillAlphas[0], fillAlphas[1]];

			// border
			g.beginGradientFill(GradientType.LINEAR, 
				[ borderColor, borderColorDrk1 ],
				[100, 100], [ 0, 0xFF],
				verticalGradientMatrix(0, 0, w, h));
			g.drawCircle(r, r, r);
			g.drawCircle(r, r, (r - 1));
			g.endFill();

			// radio fill
			g.beginGradientFill(GradientType.LINEAR, 
				upFillColors,
				upFillAlphas, [ 0, 0xFF ],
				verticalGradientMatrix(1, 1, w - 2, h - 2));
			g.drawCircle(r, r, (r - 1));
			g.endFill();

			// top highlight
			drawRoundRect(
				1, 1, w - 2, (h - 2) / 2, 
				{ tl: r, tr: r, bl: 0, br: 0 },
				[ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
				verticalGradientMatrix(0, 0, w - 2, (h - 2) / 2 ));

			return this;
		}

		override public function get downSkin():DisplayObject
		{
			var g:Graphics = this.graphics;
			g.clear();
			// border
			g.beginGradientFill(
				GradientType.LINEAR,
				[ themeColor, themeColorDrk1 ], [ 100, 100 ], [ 0, 0xFF ],
				verticalGradientMatrix(0, 0, w, h));
			g.drawCircle(r, r, r);
			g.endFill();

			// radio fill
			g.beginGradientFill(
				GradientType.LINEAR,
				[ derStyles.fillColorPress1, derStyles.fillColorPress2 ],
				[ 100, 100 ], [ 0, 0xFF ],
				verticalGradientMatrix(1, 1, w - 2, h - 2));
			g.drawCircle(r, r, (r - 1));
			g.endFill();

			// top highlight
			drawRoundRect(
				1, 1, w - 2, (h - 2) / 2, 
				{ tl: r, tr: r, bl: 0, br: 0 },
				[ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
				verticalGradientMatrix(0, 0, w - 2, (h - 2) / 2));

			return this;
		}

		override public function get overSkin():DisplayObject
		{
			var g:Graphics = this.graphics;
			g.clear();
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

			// border
			g.beginGradientFill(
				GradientType.LINEAR, 
				[ themeColor, themeColorDrk1 ], [ 100, 100 ], [ 0, 0xFF ],
				verticalGradientMatrix(0, 0, w, h));
			g.drawCircle(r, r, r);
			g.drawCircle(r, r, r - 1);
			g.endFill();

			// radio fill
			g.beginGradientFill(
				GradientType.LINEAR,
				overFillColors, overFillAlphas, [ 0, 0xFF ],
				verticalGradientMatrix(1, 1, w - 2, h - 2));
			g.drawCircle(r, r, (r - 1));
			g.endFill();

			// top highlight
			drawRoundRect(
				1, 1, w - 2, (h - 2) / 2, 
				{ tl: r, tr: r, bl: 0, br: 0 },
				[ 0xFFFFFF, 0xFFFFFF ],
				highlightAlphas,
				verticalGradientMatrix(0, 0, w - 2, (h - 2) / 2));

			return this;
		}

		override public function get disabledSkin():DisplayObject
		{

			return this;
		}

		override public function get selectedSkin():DisplayObject
		{
			var g:Graphics = this.graphics;
			g.clear();
			var upFillColors:Array = [fillColors[0], fillColors[1]];
			var upFillAlphas:Array = [fillAlphas[0], fillAlphas[1]];

			// border
			g.beginGradientFill(
				GradientType.LINEAR,
				[ borderColor, borderColorDrk1 ], [ 100, 100 ], [ 0, 0xFF ],
				verticalGradientMatrix(0, 0, w, h));
			g.drawCircle(r, r, r);
			g.drawCircle(r, r, (r - 1));
			g.endFill();

			// radio fill
			g.beginGradientFill(
				GradientType.LINEAR, 
				upFillColors, upFillAlphas, [ 0, 0xFF],
				verticalGradientMatrix(1, 1, w - 2, h - 2));
			g.drawCircle(r, r, (r - 1));
			g.endFill();

			// top highlight
			drawRoundRect(
				1, 1, w - 2, (h - 2) / 2, 
				{ tl: r, tr: r, bl: 0, br: 0 },
				[0xFFFFFF, 0xFFFFFF], highlightAlphas,
				verticalGradientMatrix(0, 0, w - 2, (h - 2) / 2));

			// radio symbol
			g.beginFill(0x000000);
			g.drawCircle(r, r, 2);
			g.endFill();
			return this;
		}
	}
}