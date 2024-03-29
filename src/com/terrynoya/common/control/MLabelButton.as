package com.terrynoya.common.control
{
	import flash.text.TextFormat;

	public class MLabelButton extends MButton
	{
		private var _label:MLabel;
		
		public function MLabelButton()
		{
			super();
		} 
		
		public function set textFormat(value:TextFormat):void
		{
			this._label.textFormat = value;	
			this.updateView();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			this._label = new MLabel();
			this.addChild(this._label);
		} 
		
		override public function set width(value:Number):void
		{
			super.width = value;
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
			this._label.x = (super.width - this._label.width) / 2;
			this._label.y = (super.height - this._label.height) / 2;
		} 
	}
}