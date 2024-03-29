package com.terrynoya.common.loader
{
	import flash.events.Event;
	import flash.events.ProgressEvent;

	public class MLoaderCore implements IMLoader
	{
		private var _url:String;
		
		private var _data:Object;
		
		private var _status:int;
		
		private var _bytesLoaded:int;
		
		private var _bytesTotal:int;
		
		public function MLoaderCore()
		{
			
		}
		
		public function get bytesTotal():int
		{
			return _bytesTotal;
		}

		public function set bytesTotal(value:int):void
		{
			_bytesTotal = value;
		}

		public function get bytesLoaded():int
		{
			return _bytesLoaded;
		}

		public function set bytesLoaded(value:int):void
		{
			_bytesLoaded = value;
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
		
		protected function onProgress(e:ProgressEvent):void
		{
			this._bytesLoaded = e.bytesLoaded;
			this._bytesTotal = e.bytesTotal;
		}
		
	}
}