package com.terrynoya.common.manager
{
	import flash.display.Stage;
	import flash.events.EventDispatcher;

	public class MSystemManager extends EventDispatcher
	{
		private var _stage:Stage;
		
		private static var _instance:MSystemManager;
		
		private static function get instance():MSystemManager
		{
			if(_instance == null)
			{
				_instance = new MSystemManager();
			}
			return _instance;
		}
		
		public function MSystemManager()
		{
			super();
		}
		
		public static function get stage():Stage
		{
			return instance.stage;
		}
		
		public static function set stage(value:Stage):void
		{
			instance.stage = value;
		}
		
		private function get stage():Stage
		{
			return _stage;
		}

		private function set stage(value:Stage):void
		{
			_stage = value;
		}

	}
}