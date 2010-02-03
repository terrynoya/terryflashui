package com.terrynoya.common.util
{
	public class MObjectPool
	{
		private static var _pool:MObjectPool;
		
		private var _classType:Class;
		
		private var _arr:Array;
		
		private var _maxSize:int;
		
		private var _classChanged:Boolean = false;
		
		public function MObjectPool(classType:Class)
		{
			this._classType = classType;	
			this._arr = new Array();
		}
		
		public function get classType():Class
		{
			return this._classType;
		}
		
		public function set classType(value:Class):void
		{
			this._classType = value;
			this._classChanged = true;
			this._arr = [];
		}
		
		public function set maxSize(value:int):void
		{
			this._maxSize = value;
		}
		
		private function create():*
		{
			var obj:Object = new _classType();
			this._arr.push(obj);
			return obj;
		}
		
		public function getObject():*
		{
			if(this._arr.length == 0)
			{
				this.create();
			}
			return this._arr.pop(); 
		}
		
		public function recycleObject(object:*):void
		{
			if(!this._classChanged)
			{
				this._arr.push(object);
			} 
			else
			{
				this.create();
			}
		}
	}
}