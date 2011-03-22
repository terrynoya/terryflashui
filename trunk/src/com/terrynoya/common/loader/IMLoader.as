package com.terrynoya.common.loader
{
	public interface IMLoader
	{
		function get url():String;
		function set url(value:String):void;
		function load():void;
		function get status():int;
		function set status(value:int):void;
		function set data(value:Object):void;
		function get data():Object;
	}	
}