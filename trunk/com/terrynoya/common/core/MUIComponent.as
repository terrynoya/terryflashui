package com.terrynoya.common.core
{
	use namespace melon_internal;
	import com.terrynoya.common.manager.MStyleManager;

	public class MUIComponent extends MSprite
	{
		private var _color:uint;
		
		private var _minWidth:Number;
		
		private var _minHeight:Number;
		
		public function MUIComponent()
		{
			super();
			this.createChildren();
		}
		
		public function get minWidth():Number
		{
			return this._minWidth;
		}
		
		public function set minWidth(value:Number):void
		{
			this._minWidth = value;
			this.updateView();
		}
		
		public function set minHeight(value:Number):void
		{
			this._minHeight = value;
			this.updateView();
		}
		
		public function get minHeight():Number
		{
			return this._minHeight;
		}
		
		
		protected function updateView():void
		{
			
		}
		
		protected function createChildren():void
		{
			
		}
		
		public function set color(value:uint):void
		{
			this._color=value;
			update();
		}

		public function setStyle(styleProp:String, newValue:*):void
		{
			MStyleManager.setStyle(styleProp, this);
		}

		private function update():void
		{
			this.graphics.beginFill(this._color);
			this.graphics.drawRect(0, 0, this.width, this.height);
			this.graphics.endFill();
		}
	}
}