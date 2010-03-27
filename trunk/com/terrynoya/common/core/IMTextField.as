package com.terrynoya.common.core
{
	public interface IMTextField
	{
		function get color():uint;
		function set color(value:uint):void
		
		function set font(value:String):void
		function get font():String
		
		function set fontSize(value:int):void
		function get fontSize():int;
		
		function set border(value:Boolean):void
		function get border():Boolean;
	}
}