 package com.terrynoya.common.skins.halo.slider
{
	import com.terrynoya.common.skins.halo.MButtonSkin;

	import flash.display.DisplayObject;

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

	}
}