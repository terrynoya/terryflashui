 package com.terrynoya.common.skins.halo.slider
{
	import com.terrynoya.common.skins.halo.MButtonSkin;
	
	import flash.display.DisplayObject;
	import flash.display.GradientType;
	import flash.display.Graphics;

	public class MSliderThumbSkin extends MButtonSkin
	{
		public function MSliderThumbSkin()
		{
			super();
			this.w = 12;
			this.h = 12;
		}

		override public function get upSkin():DisplayObject
		{
			this.graphics.clear();
			drawThumbState(w, h, 
				[ borderColor, derStyles.borderColorDrk1 ], 
				[ fillColors[0], fillColors[1] ], 
				[ fillAlphas[0], fillAlphas[1] ], 
				true,
				true);
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

			drawThumbState(w, h, 
				[ derStyles.themeColDrk2, derStyles.themeColDrk1 ], 
				overFillColors, 
				overFillAlphas, 
				true,
				true);
			return this;
		}

		override public function get downSkin():DisplayObject
		{
			this.graphics.clear();
			drawThumbState(w, h, 
				[ derStyles.themeColDrk2, derStyles.themeColDrk1 ], 
				[ derStyles.fillColorPress1, derStyles.fillColorPress2 ],
				[ 1.0, 1.0 ],
				true,
				false);
			return this;
		}

		override public function get disabledSkin():DisplayObject
		{
			this.graphics.clear();
			drawThumbState(w, h,
				[ borderColor, derStyles.borderColorDrk1 ],
				[ fillColors[0], fillColors[1] ],
				[ Math.max(0, fillAlphas[0] - 0.15), Math.max(0, fillAlphas[1] - 0.15) ],
				false,
				false);
			return this;
		}
		
		protected function drawThumbState(w:Number, h:Number, borderColors:Array, fillColors:Array, fillAlphas:Array, drawBacking:Boolean, drillHole:Boolean):void
		{
			var g:Graphics = graphics;

			var down:Boolean = false;

			var h0:Number = down ? h : 0;
			var h1:Number = down ? h - 1 : 1;
			var h2:Number = down ? h - 2 : 2;
			var hhm2:Number = down ? 2 : h - 2;
			var hhm1:Number = down ? 1 : h - 1;
			var hh:Number = down ? 0 : h;

			// if we are inverting, then swap the direction of the colors
			if(down)
			{
				borderColors = [borderColors[1], borderColors[0]];
				fillColors = [fillColors[1], fillColors[0]];
				fillAlphas = [fillAlphas[1], fillAlphas[0]];
			}

			// backing - for opacity
			if(drawBacking)
			{
				g.beginGradientFill(GradientType.LINEAR,
					[ 0xFFFFFF, 0xFFFFFF ],
					[ 0.6, 0.6 ], 
					[ 0, 0xFF ],
					verticalGradientMatrix(0, 0, w, h));
				g.moveTo(w / 2, h0);
				g.curveTo(w / 2, h0, w / 2 - 2, h2);
				g.lineTo(0, hhm2);
				g.curveTo(0, hhm2, 2, hh);
				g.lineTo(w - 2, hh);
				g.curveTo(w - 2, hh, w, hhm2);
				g.lineTo(w / 2 + 2, h2);
				g.curveTo(w / 2 + 2, h2, w / 2, h0);
				g.endFill();
			}

			// border 
			g.beginGradientFill(GradientType.LINEAR,
				borderColors,
				[ 1.0, 1.0 ], 
				[ 0, 0xFF ],
				verticalGradientMatrix(0, 0, w, h));
			g.moveTo(w / 2, h0);
			g.curveTo(w / 2, h0, w / 2 - 2, h2);
			g.lineTo(0, hhm2);
			g.curveTo(0, hhm2, 2, hh);
			g.lineTo(w - 2, hh);
			g.curveTo(w - 2, hh, w, hhm2);
			g.lineTo(w / 2 + 2, h2);
			g.curveTo(w / 2 + 2, h2, w / 2, h0);

			if(drillHole)
			{
				// drillhole
				g.moveTo(w / 2, h1);
				g.curveTo(w / 2, h0, w / 2 - 1, h2);
				g.lineTo(1, hhm1);
				g.curveTo(1, hhm1, 1, hhm1);
				g.lineTo(w - 1, hhm1);
				g.curveTo(w - 1, hhm1, w - 1, hhm2);
				g.lineTo(w / 2 + 1, h2);
				g.curveTo(w / 2 + 1, h2, w / 2, h1);
				g.endFill();
			}

			// fill
			g.beginGradientFill(GradientType.LINEAR,
				fillColors,
				fillAlphas, 
				[ 0, 0xFF ],
				verticalGradientMatrix(0, 0, w, h));
			g.moveTo(w / 2, h1);
			g.curveTo(w / 2, h0, w/2 - 1, h2);
			g.lineTo(1, hhm1);
			g.curveTo(1, hhm1, 1, hhm1);
			g.lineTo(w - 1, hhm1);
			g.curveTo(w - 1, hhm1, w - 1, hhm2);
			g.lineTo(w / 2 + 1, h2);
			g.curveTo(w / 2 + 1, h2, w / 2, h1);
			g.endFill();
		}

	}
}