package com.terrynoya.common.skins.halo.scrollSkin
{
	import com.terrynoya.common.skins.halo.MButtonSkin;
	
	import flash.display.DisplayObject;

	public class MScrollThumbSkin extends MButtonSkin
	{
		public function MScrollThumbSkin()
		{
			super();
		}
		
		override public function get upSkin():DisplayObject
		{
			return this;
		}
		
		override public function get downSkin():DisplayObject
		{
			return this;
		}
		
		override public function get overSkin():DisplayObject
		{
			return this;
		}
		
		override public function get disabledSkin():DisplayObject
		{
			return this;
		}
		
	}
}