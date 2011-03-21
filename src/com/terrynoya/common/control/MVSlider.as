package com.terrynoya.common.control
{
	import com.terrynoya.common.control.sliderClasses.MSlider;
	import com.terrynoya.common.control.sliderClasses.MSliderDirection;

	public class MVSlider extends MSlider
	{
		public function MVSlider()
		{
			super();
			this.direction = MSliderDirection.VERTICAL;
			
			this.rotation = -90;
			this.scaleX = -1;
		}
	}
}