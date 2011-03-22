package com.terrynoya.common.loader
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;

	public class MDisplayLoader extends MLoaderCore
	{
		private var _loader:Loader;
		
		public function MDisplayLoader()
		{
			this._loader = new Loader();
			this.addListeners();
		}
		
		override public function load():void
		{
			this._loader.load(new URLRequest(this.url));
		}
		
		private function addListeners():void
		{
			this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoadComplete);
			this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onIoError);
		}
	}
}