package com.terrynoya.common.loader
{
	import flash.events.Event;

	public class MLoaderCore implements IMLoader
	{
		private var _url:String;
		
		private var _data:Object;
		
		private var _status:int;
		
		public function MLoaderCore()
		{
			
		}
		
		public function get url():String
		{
			return _url;
		}
		
		public function set url(value:String):void
		{
			this._url = value;
		}
		
		public function set data(value:Object):void
		{
			this._data = value;
		}
		
		public function get data():Object
		{
			return this._data;
		}
		
		
		public function load():void
		{
			
		}
		
		public function get status():int
		{
			return _status;
		}
		
		public function set status(value:int):void
		{
			_status = value;
		}
		
		protected function onLoadComplete(e:Event):void
		{
			this._status = MLoaderStatus.COMPLETE;
		}
		
		protected function onIoError(e:Event):void
		{
			this._status = MLoaderStatus.IO_ERROR;
		}
	}
}