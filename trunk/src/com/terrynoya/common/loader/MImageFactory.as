package com.terrynoya.common.loader
{
	import com.terrynoya.common.control.MImage;
	import com.terrynoya.common.events.MImageEvent;
	import com.terrynoya.common.events.MLoaderEvent;
	import com.terrynoya.common.util.MHashMap;
	
	import flash.events.IOErrorEvent;

	public class MImageFactory
	{
		private static var _instance:MImageFactory;
		
		private var _loadMap:MHashMap;
		
		public function MImageFactory()
		{
			this._loadMap = new MHashMap();
		}
		
		private static function get instance():MImageFactory
		{
			if(_instance == null)
			{
				_instance = new MImageFactory();
			}
			return _instance;
		}
		
		public static function load(img:MImage):void
		{
			var url:String = img.url;
			var loadExist:Boolean = instance._loadMap.containsKey(url);
			if(loadExist)
			{
				var ld:IMLoader = instance._loadMap.getValue(url);
				switch(ld.status)
				{
					case MLoaderStatus.READY:
						ld.load();
						break;
					case MLoaderStatus.COMPLETE:
						img.dispatchEvent(new MImageEvent(MImageEvent.MIMAGE_LOAD_COMPLET));
						break;
					case MLoaderStatus.IO_ERROR:
						img.dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
						break;
				}
			}
			else
			{
				var loader:MImageLoader = new MImageLoader();
				loader.url = url;
				instance._loadMap.put(url,loader);
			}
		}
	}
}