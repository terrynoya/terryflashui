package com.terrynoya.common.core
{
	import flash.events.IEventDispatcher;
	public interface IMItemRenderer extends IEventDispatcher,IMDisplayObject
	{
		function get data():Object;
		function set data(value:Object):void;
	}
}