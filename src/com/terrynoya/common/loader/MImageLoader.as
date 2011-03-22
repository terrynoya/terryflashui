package com.terrynoya.common.loader
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	
	public class MImageLoader extends MDisplayLoader
	{
		private var _bmp:Bitmap;
		
		public function MImageLoader()
		{
			super();
		}
		
		private function onLdComp(e:Event):void
		{
			this.status = MLoaderStatus.COMPLETE;
		}
		
		override protected function onLoadComplete(e:Event):void
		{
			super.onLoadComplete(e);
			this._bmp = Bitmap(LoaderInfo(e.currentTarget).content);	
		}
	}
}