package com.terrynoya.common.control
{
	import com.terrynoya.common.skins.halo.IMSkin;

	public class MLabelButton extends MButton
	{
		private var _label:MLabel;
		
		public function MLabelButton()
		{
			super();
		}
		
		override protected function createChildren():void
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
			this._label.width = this.width;
			this.centerLabel();
		}
		
		override protected function updateView():void
		{
			super.updateView();
			this.setChildIndex(this._label, this.numChildren -1);
			this.centerLabel();
		} 
		
		private function centerLabel():void
		{
			this._label.x = (this.width - this._label.width) / 2;
			this._label.y = (this.height - this._label.height) / 2;
		} 
	}
}