package com.terrynoya.common.core
{
	import flash.display.DisplayObject;
	
	public class MSkinStatus
	{
		private var _name:String;
		private var _skin:DisplayObject;
		
		public function MSkinStatus(name:String,skin:DisplayObject)
		{
			this._name = name;
			this._skin = skin;
		}

		public function get skin():DisplayObject
		{
			return _skin;
		}

		public function set skin(value:DisplayObject):void
		{
			_skin = value;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

	}
}