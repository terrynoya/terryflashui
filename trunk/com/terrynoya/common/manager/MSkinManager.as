package com.terrynoya.common.manager
{
	
	import com.terrynoya.common.skins.halo.MButtonSkin;
	import com.terrynoya.common.skins.halo.MCheckBoxSkin;
	import com.terrynoya.common.skins.halo.MRadioButtonSkin;
	import com.terrynoya.common.skins.halo.MSliderSkin;
	
	import flash.events.EventDispatcher;

	public class MSkinManager extends EventDispatcher
	{
		private static var _instance:MSkinManager;
		public function MSkinManager()
		{
			super();
		}
		
		public static function getInstance():MSkinManager
		{
			if(null == _instance)
			{
				_instance = new MSkinManager();
			}
			
			return _instance;
		}
		
		public static function get buttonSkin():MButtonSkin
		{
			var bskin:MButtonSkin = new MButtonSkin();
			return bskin;
		}
		
		public static function get checkBoxSkin():MCheckBoxSkin
		{
			var skin:MCheckBoxSkin = new MCheckBoxSkin();
			return skin;
		}
		
		public static function get radioButtonSkin():MRadioButtonSkin
		{
			var skin:MRadioButtonSkin = new MRadioButtonSkin();
			return skin;
		}
		
		public static function get sliderSkin():MSliderSkin
		{
			var skin:MSliderSkin = new MSliderSkin();
			return skin; 
		}
		
		
//		public static function get sliderThumbSkin():MSliderThumbSkin
//		{
//			var skin:MSliderThumbSkin = new MSliderThumbSkin();
//			return skin;
//		}
//		
//		public static function get sliderTrackSkin():MSliderTrackSkin
//		{
//			var skin:MSliderTrackSkin = new MSliderTrackSkin();
//			return skin;
//		}
	}
}