package com.terrynoya.common.control
{
	import flash.display.DisplayObject;

	public class MHBox extends MBox
	{
		public function MHBox()
		{
			super();
		}
		
		override protected function updateView():void
		{
			var offset:Number = 0;
			for(var i:int = 0;i<this.numChildren;i++)
			{
				var child:DisplayObject = this.getChildAt(i);
				child.x = offset;
				offset += child.width;
				offset += this.gap;
			}
		}
	}
}