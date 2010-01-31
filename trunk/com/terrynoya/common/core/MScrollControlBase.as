package com.terrynoya.common.core
{
	import com.terrynoya.common.control.MHScrollBar;
	import com.terrynoya.common.control.MVScrollBar;
	import com.terrynoya.common.control.scrollClasses.MScrollBarPolicy;
	import com.terrynoya.common.events.MScrollEvent;
	
	public class MScrollControlBase extends MUIComponent
	{
		protected var vScrollBar:MVScrollBar;
		
		protected var hScrollBar:MHScrollBar;
		
		protected var visualWidth:Number;
		
		protected var visualHeight:Number;
		
		protected var vScrollPolicy:String = MScrollBarPolicy.AUTO;
		
		protected var hScrollPolicy:String = MScrollBarPolicy.AUTO;
		
		public function MScrollControlBase()
		{
			super();
			this.addListeners();
		}
		
		override public function set width(value:Number) : void
		{
			this.hScrollBar.width = value;
			this.vScrollBar.x = value - this.vScrollBar.width;
		}
		
		override public function set height(value:Number) : void
		{
			this.vScrollBar.width = height;
			this.vScrollBar.height = value;
			this.hScrollBar.y = value - this.hScrollBar.height;
		}
		
		override protected function createChildren() : void
		{
			this.vScrollBar = new MVScrollBar();
			this.hScrollBar = new MHScrollBar();
			this.addChild(this.vScrollBar);
			this.addChild(this.hScrollBar);
		}
		
		private function addListeners():void
		{
			this.vScrollBar.addEventListener(MScrollEvent.SCROLL,scrollHandler);
			this.hScrollBar.addEventListener(MScrollEvent.SCROLL,scrollHandler);
		}
		
		protected function scrollHandler(e:MScrollEvent):void
		{
			trace(e.scrollPosition ,e.direction);
		}
		
		private function get vScrollShouldVisible():Boolean
		{
			return false;
		}
		
		private function get hScrollShouldVisible():Boolean
		{
			return false;
		}
		
		
	}
}