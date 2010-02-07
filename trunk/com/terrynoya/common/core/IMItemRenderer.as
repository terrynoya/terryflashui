package com.terrynoya.common.core
{
	import flash.events.IEventDispatcher;
	public interface IMItemRenderer extends IEventDispatcher,IMDisplayObject
	{
		function get data():Object;
		function set data(value:Object):void;
		function get selected():Boolean;
		function set selected(value:Boolean):void;
	}
}