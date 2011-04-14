package com.terrynoya.common.control
{
	import com.terrynoya.common.core.MUIComponent;
	
	import flash.display.DisplayObject;
	
	public class MBox extends MUIComponent
	{
		private var _gap:int;
		
		public function MBox()
		{
			super();
		}

		public function get gap():int
		{
			return _gap;
		}

		public function set gap(value:int):void
		{
			_gap = value;
		}
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			super.addChild(child);
			this.updateView();
			return child;
		}
		
		override public function addChildAt(child:DisplayObject, index:int):DisplayObject
		{
			var chd:DisplayObject = super.addChildAt(child,index);
			this.updateView();
			return chd;
		}

		override protected function updateView():void
		{
			
		}
	}
}