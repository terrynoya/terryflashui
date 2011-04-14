package com.terrynoya.common.model
{
	import flash.text.TextFormat;

	public class MLabelModel
	{
		private var _text:String;
		
		private var _txtFormat:TextFormat;
		
		public function MLabelModel()
		{
			
		}

		public function get txtFormat():TextFormat
		{
			return _txtFormat;
		}

		public function set txtFormat(value:TextFormat):void
		{
			_txtFormat = value;
		}

		public function get text():String
		{
			return _text;
		}

		public function set text(value:String):void
		{
			_text = value;
		}

	}
}