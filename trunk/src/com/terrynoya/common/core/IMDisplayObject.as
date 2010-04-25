package com.terrynoya.common.core
{
	public interface IMDisplayObject
	{
		function set x(value:Number):void;
		function set y(value:Number):void;
		function set width(value:Number):void;
		function set height(value:Number):void;
		
		function get x():Number;
		function get y():Number;
		function get width():Number;
		function get height():Number;
		function set mouseChildren(value:Boolean):void;
		function set doubleClickEnabled(value:Boolean):void;
	} 
}