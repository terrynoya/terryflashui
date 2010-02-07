package com.terrynoya.common.collection
{
	public interface IMCollectionView
	{
		
		function get length():int;

		function get filterFunction():Function;
		
		function set filterFunction(value:Function):void;
		
		function get sort():MSort;
		
		function set sort(value:MSort):void;
		
//		function createCursor():IViewCursor;
		

		function contains(item:Object):Boolean;
		

		function disableAutoUpdate():void;
		

		function enableAutoUpdate():void;
		

		function itemUpdated(item:Object, property:Object = null,
							 oldValue:Object = null, newValue:Object = null):void;

		function refresh():Boolean;
	}
}