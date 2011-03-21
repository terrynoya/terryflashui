package com.terrynoya.common.control
{
	import com.terrynoya.common.control.sliderClasses.MSlider;
	import com.terrynoya.common.control.sliderClasses.MSliderDirection;
	
	/**
	 * 横向Slider
	 * @author TerryYao
	 */
	public class MHSlider extends MSlider
	{
		/**
		 * 
		 */
		public function MHSlider()
		{
			super();
			this.direction = MSliderDirection.HORIZONTAL;
		}
	}
}