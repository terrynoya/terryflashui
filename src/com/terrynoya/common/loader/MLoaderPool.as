package com.terrynoya.common.loader
{
	import com.terrynoya.common.util.MHashMap;
	
	public class MLoaderPool
	{
		private var _loaderMap:MHashMap;
		
		public function MLoaderPool()
		{
			this._loaderMap = new MHashMap();
		}
		
		public function addLoader(loader:IMLoader,replace:Boolean = false):void
		{
			this._loaderMap.put(loader.url,loader);
		}
		
		public function getLoader(url:String):IMLoader
		{
			return this._loaderMap.getValue(url);
		}
		
		public function hasLoader(url:String):Boolean
		{
			return this._loaderMap.containsKey(url);
		}
	}
}