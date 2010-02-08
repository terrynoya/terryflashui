package com.terrynoya.common.control
{
	import com.terrynoya.common.core.MUIComponent;
	import com.terrynoya.common.core.melon_internal;
	import flash.text.TextFieldAutoSize;
	use namespace melon_internal;

	public class MLabel extends MUIComponent
	{
		protected var _textField:MTextField;

		public function MLabel()
		{
			super();
		}

		public function set text(value:String):void
		{

			this._textField.text=value;
		}

		public function get text():String
		{
			return this._textField.text;
		}

		public function set htmlText(value:String):void
		{
			this._textField.htmlText=value;
		}

		public function get htmlText():String
		{
			return this._textField.htmlText;
		}

		override protected function createChildren():void
		{
			this._textField=new MTextField();
			this._textField.autoSize=TextFieldAutoSize.LEFT;
			this._textField.multiline=false;
			this._textField.selectable=false;
			this._textField.wordWrap=false;
			this.addChild(this._textField);
		}


		override public function set width(value:Number):void
		{
			if(this.width == value)
			{
				return;
			}
			this._textField.explicitWidth=value;
//			this._textField.truncateToFit();
			super.width=value;
		}
		
		override public function set height(value:Number):void
		{
			this._textField.height = value;
			super.height=value;
		}
		
		melon_internal function get textField():MTextField
		{
			return this._textField;
		}
		
	}
}