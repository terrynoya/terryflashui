package com.terrynoya.common.control
{
	import com.terrynoya.common.control.scrollClasses.MScrollBar;
	import com.terrynoya.common.control.scrollClasses.MScrollDirection;
	
	public class MVScrollBar extends MScrollBar
	{
		public function MVScrollBar()
		{
			super();
			this.direction = MScrollDirection.VERTICAL
		}
	}
}