package com.terrynoya.common.control
{
	import flash.text.TextField;
	import flash.text.TextFormat;

	/**
	 * 文本框
	 * @author TerryYao
	 */
	public class MTextField extends TextField
	{
		private var _txtFormat:TextFormat;
		
		/**
		 * 
		 */
		public function MTextField()
		{
			super();
			this.createChildren();
		}
		
		public function get textFormat():TextFormat
		{
			return this._txtFormat;
		}
		
		override public function set text(value:String):void
		{
			super.text = value;
			this.updateView();
		}
		
		/**
		 * 字体颜色
		 * @return 
		 */
		public function get color():uint
		{
			return uint(this._txtFormat.color);
		}
		
		/**
		 * 
		 * @param value
		 */
		public function set color(value:uint):void
		{
			this._txtFormat.color = value;
			this.updateView();
		}
		
		/**
		 * 字体
		 * @param value
		 */
		public function set font(value:String):void
		{
			this._txtFormat.font = value;
			this.updateView();
		}
		
		/**
		 * 
		 * @return 
		 */
		public function get font():String
		{
			return this._txtFormat.font;
		}  
		
		/**
		 * 字体大小
		 * @param value
		 */
		public function set fontSize(value:int):void
		{
			this._txtFormat.size = value;
			this.updateView();
		}
		
		/**
		 * 
		 * @return 
		 */
		public function get fontSize():int
		{
			return int(this._txtFormat.size);
		}
		
		/**
		 * 是否有下划线
		 * @return 
		 */
		public function get underline():Boolean
		{
			return this._txtFormat.underline;
		}
		
		/**
		 * 
		 * @param value
		 */
		public function set underline(value:Boolean):void
		{
			this._txtFormat.underline = value;
			this.updateView();
		}
		
		/**
		 * 
		 */
		protected function createChildren():void
		{
			this._txtFormat = this.getTextFormat();
		}
		
		/**
		 * 
		 */
		protected function updateView():void
		{
			this.setTextFormat(this._txtFormat);
		}
		
	}
}