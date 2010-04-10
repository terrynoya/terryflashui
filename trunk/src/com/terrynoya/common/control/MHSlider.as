package com.terrynoya.common.control
{
	import com.terrynoya.common.control.sliderClasses.MSlider;
	import com.terrynoya.common.control.sliderClasses.MSliderDirection;
	
	public class MHSlider extends MSlider
	{
		public function MHSlider()
		{
			super();
			this.direction = MSliderDirection.HORIZONTAL;
		}
	}
}