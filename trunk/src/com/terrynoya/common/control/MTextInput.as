package com.terrynoya.common.control
{
	import com.terrynoya.common.core.MSkinableComponent;
	
	import flash.text.TextFieldType;

	public class MTextInput extends MSkinableComponent
	{
		private var _textField:MTextField;
		
		public function MTextInput()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			this._textField = new MTextField();
			this._textField.type = TextFieldType.INPUT;
			this.addChild(this._textField);
			this._textField.width = 100;
			this._textField.height = 30;
		}
	}
}