package com.terrynoya.common.control
{
	import flash.display.DisplayObject;

	public class MVBox extends MBox
	{
		public function MVBox()
		{
			super();
		}
		
		override protected function updateView():void
		{
			super.updateView();
			var offset:Number = 0;
			for(var i:int = 0;i<this.numChildren;i++)
			{
				var child:DisplayObject = this.getChildAt(i);
				child.y = offset;
				offset += child.height + this.gap; 
			}
		}
	}
}