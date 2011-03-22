package com.terrynoya.common.loader
{
	import com.terrynoya.common.control.MImage;
	import com.terrynoya.common.util.MHashMap;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	
	public class MImageLoader extends MDisplayLoader
	{
		private var _bmp:BitmapData;
		
		private var _imageList:Array;
		
		public function MImageLoader()
		{
			super();
			this._imageList = new Array();
		}
		
		
		public function addImage(img:MImage):void
		{
			if(this._imageList.indexOf(img)!=-1)
			{
				return;
			}
			this._imageList.push(img);
		}
		
		override protected function onLoadComplete(e:Event):void
		{
			super.onLoadComplete(e);
			this._bmp = Bitmap(LoaderInfo(e.currentTarget).content).bitmapData.clone();
			this.setImageSource();
		}
		
		private function setImageSource():void
		{
			while(this._imageList.length>0)
			{
				var img:MImage = this._imageList.pop();
				img.source = new Bitmap(this._bmp);
			}
		}
	}
}