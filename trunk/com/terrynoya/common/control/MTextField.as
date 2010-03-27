package com.terrynoya.common.control
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextLineMetrics;

	public class MTextField extends TextField
	{
		private var _txtFormat:TextFormat;
		
		public function MTextField()
		{
			super();
			this.createChildren();
		}
		
		override public function set text(value:String):void
		{
			super.text = value;
			this.updateView();
		}
		
		public function get color():uint
		{
			return uint(this._txtFormat.color);
		}
		
		public function set color(value:uint):void
		{
			this._txtFormat.color = value;
			this.updateView();
		}
		
		public function set font(value:String):void
		{
			this._txtFormat.font = value;
			this.updateView();
		}
		
		public function get font():String
		{
			return this._txtFormat.font;
		}  
		
		public function set fontSize(value:int):void
		{
			this._txtFormat.size = value;
			this.updateView();
		}
		
		public function get fontSize():int
		{
			return int(this._txtFormat.size);
		}
		
		public function get underline():Boolean
		{
			return this._txtFormat.underline;
		}
		
		public function set underline(value:Boolean):void
		{
			this._txtFormat.underline = value;
			this.updateView();
		}
		
		protected function createChildren():void
		{
			this._txtFormat = this.getTextFormat();
		}
		
		protected function updateView():void
		{
			this.setTextFormat(this._txtFormat);
		}
		
	}
}