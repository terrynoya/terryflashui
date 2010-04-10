package com.terrynoya.common.skins.halo.scrollSkin
{
	import com.terrynoya.common.skins.halo.MButtonSkin;

	import flash.display.DisplayObject;
	import flash.display.GradientType;

	public class MScrollThumbSkin extends MButtonSkin
	{
		private var radius:Number = Math.max(cornerRadius - 1, 0);
		private var cr:Object = {tl: 0, tr: radius, bl: 0, br: radius};
		private var cr1:Object = {tl: 0, tr: radius, bl: 0, br: radius};
		private var horizontal:Boolean = false;

		public function MScrollThumbSkin()
		{
			radius = Math.max(radius - 1, 0);
			super();
			this.h = 34;
			this.w = 15;
		}

		override public function get upSkin():DisplayObject
		{
			this.graphics.clear();
			var upFillColors:Array = [fillColors[0], fillColors[1]];

			var upFillAlphas:Array = [fillAlphas[0], fillAlphas[1]];

			// positioning placeholder
			drawRoundRect(
				0, 0, w, h, 0,
				0xFFFFFF, 0);

			// shadow
			if(horizontal)
			{
				drawRoundRect(
					1, 0, w - 2, h, cornerRadius,
					[ derStyles.borderColorDrk1,
					derStyles.borderColorDrk1 ], [ 1, 0 ],
					horizontalGradientMatrix(2, 0, w, h),
					GradientType.LINEAR, null, 
					{ x: 1, y: 1, w: w - 4, h: h - 2, r: cr1 });
			}
			else
			{
				drawRoundRect(
					1, h - radius, w - 3, radius + 4,
					{ tl: 0, tr: 0, bl: 0, br: radius },
					[ derStyles.borderColorDrk1,
					derStyles.borderColorDrk1 ], [ 1, 0 ],
					horizontal ?
					horizontalGradientMatrix(0, h - 4, w - 3, 8) :
					verticalGradientMatrix(0, h - 4, w - 3, 8),
					GradientType.LINEAR, null, 
					{ x: 1, y: h-radius, w: w - 4, h: radius,
						r: { tl: 0, tr: 0, bl: 0, br: radius - 1 } });
			}
			// border
			drawRoundRect(
				1, 0, w - 3, h, cr,
				[ borderColor, derStyles.borderColorDrk1 ], 1,
				horizontal ?
				horizontalGradientMatrix(0, 0, w, h) :
				verticalGradientMatrix(0, 0, w, h),
				GradientType.LINEAR, null, 
				{ x: 1, y: 1, w: w - 4, h: h - 2, r: cr1 });

			// fill
			drawRoundRect(
				1, 1, w - 4, h - 2, cr1,
				upFillColors, upFillAlphas,
				horizontal ?
				horizontalGradientMatrix(1, 0, w - 2, h - 2) :
				verticalGradientMatrix(1, 0, w - 2, h - 2));

			// highlight
			if(horizontal)
			{
				drawRoundRect(
					1, 0, (w - 4) / 2, h - 2, 0,
					[ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
					horizontalGradientMatrix(1, 1, w - 4, (h - 2) / 2));
			}
			else
			{
				drawRoundRect(
					1, 1, w - 4, (h - 2) / 2, cr1,
					[ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
					horizontal ?
					horizontalGradientMatrix(1, 0, (w - 4) / 2, h - 2) :
					verticalGradientMatrix(1, 1, w - 4, (h - 2) / 2));
			}
			
			this.drawGrip();
			return this;
		}

		override public function get downSkin():DisplayObject
		{
			this.graphics.clear();
			// shadow
			if(horizontal)
			{
				drawRoundRect(
					1, 0, w - 2, h, cr,
					[ derStyles.borderColorDrk1,
					derStyles.borderColorDrk1 ], [1, 0],
					horizontalGradientMatrix(2, 0, w, h),
					GradientType.LINEAR, null, 
					{ x: 1, y: 1, w: w - 4, h: h - 2, r: cr1 });
			}
			else
			{
				drawRoundRect(
					1, h - radius, w - 3, radius + 4,
					{ tl: 0, tr: 0, bl: 0, br: radius },
					[ derStyles.borderColorDrk1,
					derStyles.borderColorDrk1 ], [ 1, 0 ],
					horizontal ?
					horizontalGradientMatrix(0, h - 4, w - 3, 8) :
					verticalGradientMatrix(0, h - 4, w - 3, 8),
					GradientType.LINEAR, null, 
					{ x: 1, y: h-radius, w: w - 4, h: radius,
						r: { tl: 0, tr: 0, bl: 0, br: radius - 1 } });
			}

			// border
			drawRoundRect(
				1, 0, w - 3, h, cr,
				[ themeColor, derStyles.themeColDrk2], 1,
				horizontal ?
				horizontalGradientMatrix(1, 0, w, h) :
				verticalGradientMatrix(0, 0, w, h),
				GradientType.LINEAR, null, 
				{ x: 1, y: 1, w: w - 4, h: h - 2, r: cr1});

			// fill
			drawRoundRect(
				1, 1, w - 4, h - 2, cr1,
				[ derStyles.fillColorPress1, derStyles.fillColorPress2 ], 1,
				horizontal ?
				horizontalGradientMatrix(1, 0, w, h) :
				verticalGradientMatrix(1, 0, w, h));
				
			this.drawGrip();
			
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

			// positioning placeholder
			drawRoundRect(
				0, 0, w, h, 0,
				0xFFFFFF, 0);

			// shadow
			if(horizontal)
			{
				drawRoundRect(
					1, 0, w - 2, h, cornerRadius,
					[ derStyles.borderColorDrk1,
					derStyles.borderColorDrk1 ], [ 1, 0 ],
					horizontalGradientMatrix(2, 0, w, h),
					GradientType.LINEAR, null, 
					{ x: 1, y: 1, w: w - 4, h: h - 2, r: cr1 });
			}
			else
			{
				drawRoundRect(
					1, h - radius, w - 3, radius + 4,
					{ tl: 0, tr: 0, bl: 0, br: radius },
					[ derStyles.borderColorDrk1,
					derStyles.borderColorDrk1 ], [ 1, 0 ],
					horizontal ?
					horizontalGradientMatrix(0, h - 4, w - 3, 8) :
					verticalGradientMatrix(0, h - 4, w - 3, 8),
					GradientType.LINEAR, null, 
					{ x: 1, y: h-radius, w: w - 4, h: radius,
						r: { tl: 0, tr: 0, bl: 0, br: radius - 1 } });
			}

			// border
			drawRoundRect(
				1, 0, w - 3, h, cr,
				[ themeColor, derStyles.themeColDrk1], 1,
				horizontal ?
				horizontalGradientMatrix(1, 0, w, h) :
				verticalGradientMatrix(0, 0, w, h),
				GradientType.LINEAR, null, 
				{ x: 1, y: 1, w: w - 4, h: h - 2, r: cr1 });

			// fill
			drawRoundRect(
				1, 1, w - 4, h - 2, cr1,
				overFillColors, overFillAlphas,
				horizontal ?
				horizontalGradientMatrix(1, 0, w, h) :
				verticalGradientMatrix(1, 0, w, h));
			
			this.drawGrip();
			
			return this;
		}

		override public function get disabledSkin():DisplayObject
		{
			this.graphics.clear();
			drawRoundRect(
				0, 0, w, h, 0,
				0xFFFFFF, 0);

			// border
			drawRoundRect(
				1, 0, w - 3, h, cr,
				0x999999, 0.5);

			// fill
			drawRoundRect(
				1, 1, w - 4, h - 2, cr1,
				0xFFFFFF, 0.5);
				
			this.drawGrip();
			
			return this;
		}

		private function drawBorder():void
		{
			drawRoundRect(
				1, 0, w - 3, h, cr,
				0xFFFFFF, 1);
		}

		private function drawGrip():void
		{

			var gripW:Number = Math.floor(w / 2 - 4);

			drawRoundRect(
				gripW, Math.floor(h / 2 - 4), 5, 1, 0,
				0x000000, 0.4);

			drawRoundRect(
				gripW, Math.floor(h / 2 - 2), 5, 1, 0,
				0x000000, 0.4);

			drawRoundRect(
				gripW, Math.floor(h / 2), 5, 1, 0,
				0x000000, 0.4);

			drawRoundRect(
				gripW, Math.floor(h / 2 + 2), 5, 1, 0,
				0x000000, 0.4);

			drawRoundRect(
				gripW, Math.floor(h / 2 + 4), 5, 1, 0,
				0x000000, 0.4);
		}
	}
}