package com.terrynoya.common.control
{
	import com.terrynoya.common.core.IMTextField;
	import com.terrynoya.common.core.MUIComponent;
	
	import flash.text.TextFormat;

	/**
	 * 
	 * @author TerryYao
	 */
	public class MLabel extends MUIComponent implements IMTextField
	{
		private var _txtField:MTextField;
		private var _isWidthSetted:Boolean = false;
		/**
		 * 
		 */
		public function MLabel()
		{
			super();
		}
		
		/**
		 * 
		 * @param value
		 */
		public function set text(value:String):void
		{
			this._txtField.text = value;
			this.updateView();
		}
		
		/**
		 * 
		 * @return 
		 */
		public function get text():String
		{
			return this._txtField.text;
		}
		
		/**
		 * 
		 * @return 
		 */
		public function get color():uint
		{
			return this._txtField.color;
		}
		
		/**
		 * 
		 * @param value
		 */
		public function set color(value:uint):void
		{
			this._txtField.color = value;
		}
		
		/**
		 * 
		 * @param value
		 */
		public function set font(value:String):void
		{
			this._txtField.font = value;
		}
		
		/**
		 * 
		 * @return 
		 */
		public function get font():String
		{
			return this._txtField.font;
		}
		
		/**
		 * 
		 * @param value
		 */
		public function set fontSize(value:int):void
		{
			this._txtField.fontSize = value;
		}
		
		/**
		 * 
		 * @return 
		 */
		public function get fontSize():int
		{
			return this._txtField.fontSize;
		}
		
		override public function set width(value:Number):void
		{
			this._txtField.width = value;
			this._isWidthSetted = true;
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			this._txtField = new MTextField();
			this._txtField.selectable = false;
			this.addChild(this._txtField);
		}
		
		/**
		 * 将行高和文字的行高设置为一致
		 * +4 因为txtField固定四周有2px的边框,貌似还不能去掉
		 * @see flash.text.TextLineMetrics 
		 */
		override protected function updateView():void
		{
			super.updateView();
			
			var lineHeight:Number = this._txtField.getLineMetrics(0).height;
			this._txtField.height = lineHeight + 4;
			
			if(this._isWidthSetted)
			{
				return;	
			}
			
			this._txtField.width = this._txtField.textWidth + 4;
		}
		
		override public function get height():Number
		{
			return this._txtField.height;
		}
		
		public function set border(value:Boolean):void
		{
			this._txtField.border = value;
		}
		
		public function get border():Boolean
		{
			return this._txtField.border;
		}
	}
}