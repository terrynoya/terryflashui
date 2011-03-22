package com.terrynoya.common.loader
{
	public class MLoaderSystem
	{
		private static var _instance:MLoaderSystem;
		
		private var _stack:Array;
		
		public function MLoaderSystem()
		{
			this._stack = new Array();
		}
		
		private static function get instance():MLoaderSystem
		{
			if(_instance == null)
			{
				_instance = new MLoaderSystem();
			}
			return _instance;
		}
		
		public static function addLoader(value:IMLoader):void
		{
			instance._stack.push(value);
		}
		
		private function loadNext():void
		{
			
		}
	}
}