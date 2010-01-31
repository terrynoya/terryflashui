package com.terrynoya.common.core
{
	use namespace melon_internal;
	import com.terrynoya.manager.MStyleManager;

	public class MUIComponent extends MSprite
	{
		private var _color:uint;

		public function MUIComponent()
		{
			super();
			this.createChildren();
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