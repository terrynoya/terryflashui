package com.terrynoya.common.skins.halo
{
	import flash.display.DisplayObject;
	import flash.display.GradientType;

	public class MButtonSkin extends MSkin
	{
		private var cr:Number=4;
		private var cr1:Number=Math.max(0, cornerRadius - 1);
		private var cr2:Number=Math.max(0, cornerRadius - 2);

		public function MButtonSkin()
		{
			super();
			this.w=100;
			this.h=30;
		}

		public function get upSkin():DisplayObject
		{
			this.graphics.clear();
			var upFillColors:Array=[fillColors[0], fillColors[1]];

			var upFillAlphas:Array=[fillAlphas[0], fillAlphas[1]];
			var emph:Boolean=false;

			// button border/edge
			drawRoundRect(
				0, 0, w, h, cr,
				[ borderColor, borderColorDrk1 ], 1,
				verticalGradientMatrix(0, 0, w, h ),
				GradientType.LINEAR, null, 
				{ x: 1, y: 1, w: w - 2, h: h - 2, r: cornerRadius - 1 });

			// button fill
			drawRoundRect(
				1, 1, w - 2, h - 2, cr1,
				upFillColors, upFillAlphas,
				verticalGradientMatrix(1, 1, w - 2, h - 2));

			// top highlight
			drawRoundRect(
				1, 1, w - 2, (h - 2) / 2,
				{ tl: cr1, tr: cr1, bl: 0, br: 0 },
				[ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
				verticalGradientMatrix(1, 1, w - 2, (h - 2) / 2));

			return this;
		}

		public function get downSkin():DisplayObject
		{
			var upFillColors:Array=[fillColors[0], fillColors[1]];

			var upFillAlphas:Array=[fillAlphas[0], fillAlphas[1]];

			this.graphics.clear();


			// button border/edge
			drawRoundRect(
				0, 0, w, h, cr,
				[ borderColor, borderColorDrk1 ], 1,
				verticalGradientMatrix(0, 0, w, h ));

			// button fill
			drawRoundRect(
				1, 1, w - 2, h - 2, cr1,
				[ derStyles.fillColorPress1, derStyles.fillColorPress2], 1,
				verticalGradientMatrix(1, 1, w - 2, h - 2));

			// top highlight
			drawRoundRect(
				2, 2, w - 4, (h - 4) / 2,
				{ tl: cr2, tr: cr2, bl: 0, br: 0 },
				[ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
				verticalGradientMatrix(1, 1, w - 2, (h - 2) / 2));

			return this;
		}

		public function get overSkin():DisplayObject
		{
			this.graphics.clear();
			var themeColor:uint=0x9dff;
			var themeColorDrk1:uint=0x75df;

			var overFillColors:Array;
			if(fillColors.length > 2)
				overFillColors=[fillColors[2], fillColors[3]];
			else
				overFillColors=[fillColors[0], fillColors[1]];

			var overFillAlphas:Array;
			if(fillAlphas.length > 2)
				overFillAlphas=[fillAlphas[2], fillAlphas[3]];
			else
				overFillAlphas=[fillAlphas[0], fillAlphas[1]];

			overFillAlphas=[0.75,0.65];
			// button border/edge
			drawRoundRect(
				0, 0, w, h, cr,
				[ themeColor, themeColorDrk1  ], 1,
				verticalGradientMatrix(0, 0, w, h),
				GradientType.LINEAR, null, 
				{ x: 1, y: 1, w: w - 2, h: h - 2, r: cornerRadius - 1 });

			// button fill
			drawRoundRect(
				1, 1, w - 2, h - 2, cr1,
				overFillColors, overFillAlphas,
				verticalGradientMatrix(1, 1, w - 2, h - 2));

			// top highlight
			drawRoundRect(
				1, 1, w - 2, (h - 2) / 2,
				{ tl: cr1, tr: cr1, bl: 0, br: 0 },
				[ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
				verticalGradientMatrix(1, 1, w - 2, (h - 2) / 2));

			return this;
		}

		public function get disabledSkin():DisplayObject
		{
			this.graphics.clear();
			var disFillColors:Array=[fillColors[0], fillColors[1]];

			var disFillAlphas:Array=[Math.max( 0, fillAlphas[0] - 0.15),
				Math.max( 0, fillAlphas[1] - 0.15)];

			// button border/edge
			drawRoundRect(
				0, 0, w, h, cr,
				[ borderColor, borderColorDrk1 ], 0.5,
				verticalGradientMatrix(0, 0, w, h ),
				GradientType.LINEAR, null, 
				{ x: 1, y: 1, w: w - 2, h: h - 2, r: cornerRadius - 1 });

			// button fill
			drawRoundRect(
				1, 1, w - 2, h - 2, cr1,
				disFillColors, disFillAlphas,
				verticalGradientMatrix(1, 1, w - 2, h - 2));

			return this;
		}
		
		override protected function draw():void
		{
			this.upSkin;
		}
	}
}