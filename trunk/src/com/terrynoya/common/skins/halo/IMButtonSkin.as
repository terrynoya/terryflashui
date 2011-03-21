package com.terrynoya.common.skins.halo
{
	import flash.display.DisplayObject;

	public interface IMButtonSkin extends IMSkin
	{
		function get upSkin():DisplayObject;
		function get overSkin():DisplayObject;
		function get downSkin():DisplayObject;
		function get disabledSkin():DisplayObject;
	}
}