package com.terrynoya.common.control
{
	import flash.events.EventDispatcher;

	public class MButtonGroup extends EventDispatcher
	{
		private var _dataprovider:Object;
		
		public function MButtonGroup()
		{
			super();
		}

		public function get dataprovider():Object
		{
			return _dataprovider;
		}

		public function set dataprovider(value:Object):void
		{
			_dataprovider = value;
		}
	}
}