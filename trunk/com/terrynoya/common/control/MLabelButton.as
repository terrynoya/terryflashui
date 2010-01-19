package com.terrynoya.common.control
{
	public class MLabelButton extends MButton
	{
		private var _label:MLabel;
		
		public function MLabelButton()
		{
			super();
		}
		
		override protected function addChildren():void
		{
			this._label = new MLabel();
			this.addChild(this._label);
			
		}
		
		override public function set width(value:Number):void
		{
			super.width = value;
			this._label.width = value;
			this.centerLabel();
		} 
		
		override public function set height(value:Number):void
		{
			super.height = value;
			this.centerLabel();
		} 
		
		
		public function set text(value:String):void
		{
			this._label.text = value;
			this._label.width = this.buttonSkin.width;
			this.centerLabel();
		}
		
		override protected function updateSkin():void
		{
			super.updateSkin();
			this.setChildIndex(this._label, this.numChildren -1);
			this.centerLabel();
		}
		
		private function centerLabel():void
		{
			this._label.x = (this.buttonSkin.width - this._label.width) / 2;
			this._label.y = (this.buttonSkin.height - this._label.height) / 2;
		}
	}
}