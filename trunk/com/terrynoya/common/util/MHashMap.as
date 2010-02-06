package com.terrynoya.common.util
{
	import flash.utils.Dictionary;
	
	public class MHashMap
	{
		private var _dic:Dictionary;
		private var _replaceFormer:Boolean = true;
		private var _keyArr:Array;
		public function MHashMap()
		{
			this._dic = new Dictionary();
			this._keyArr = [];
		}
		
		public function put(key:*,value:*):Boolean
		{
			
			if(this.containsKey(key) == true)
			{
				
				return false;
			}
			else
			{
				this._dic[key] = value;
				this._keyArr.push(key);
				return true;
			}
		}
		
		public function getValue(key:*):*
		{
			return this._dic[key];
		}
		
		public function set replaceFormer(value:Boolean):void
		{
			if(this._replaceFormer == value)
			{
				return;
			}
			this._replaceFormer = value;
		}
		
		public function get replaceFormer():Boolean
		{
			return this._replaceFormer;
		}
		
		public function containsKey(key:*):Boolean
		{
			for(var i:int = 0; i < this._keyArr.length; i++)
			{
				if(this._keyArr[i] == key)
				{
					return true;
				}
			}
 			return false;
			
		}
		
		public function remove(key:*):Boolean
		{
			if(!this.containsKey(key))
			{
				return false;
			}
			var value:* = this._dic[key];
			delete this._dic[key];
			
			var index:int = this._keyArr.indexOf(key);
			this._keyArr.splice(index,1);
			return true;
		}
		
		public function get length():int
		{
			return this._keyArr.length;
		}
		
		
	}
}