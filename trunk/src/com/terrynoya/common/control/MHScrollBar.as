package com.terrynoya.common.control
{
	import com.terrynoya.common.control.scrollClasses.MScrollBar;
	import com.terrynoya.common.control.scrollClasses.MScrollDirection;
	
	public class MHScrollBar extends MScrollBar
	{
		public function MHScrollBar()
		{
			super();
			this.direction = MScrollDirection.HORIZONTAL;
			this.scaleX = -1;
			this.rotation = -90;
		}
		
		override public function set width(value:Number) : void
		{
			super.height = value;
		}
		
		override public function set height(value:Number) : void
		{
			super.width = value;
		}
		
		override public function get width() :Number
		{
			return super.height;
		}
		
		override public function get height() :Number
		{
			return super.width;
		}
	}
}