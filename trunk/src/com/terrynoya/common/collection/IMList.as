package com.terrynoya.common.collection
{
	public interface IMList
	{
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  length
		//----------------------------------
		
		function get length():int;
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		function addItem(item:Object):void;
		
		function addItemAt(item:Object, index:int):void;
		
		function getItemAt(index:int, prefetch:int = 0):Object;
		
		function getItemIndex(item:Object):int;
		
		function itemUpdated(item:Object, property:Object = null, 
							 oldValue:Object = null, 
							 newValue:Object = null):void;
		
		function removeAll():void;
		
		function removeItemAt(index:int):Object;
		
		function setItemAt(item:Object, index:int):Object;
		
		function toArray():Array;
	}
}