package com.terrynoya.common.collection
{
	public class MArraySortOption extends Object
	{
		private var _fields:Array;
		private var _options:Array;
		
		public function MArraySortOption()
		{
			this._fields = new Array();
			this._options = new Array();
			super();
		}
		
		public function get fields():Array
		{
			return this._fields;
		}
		
		public function get options():Array
		{
			return this._options;
		}
		
		public function get hasFields():Boolean
		{
			return this._fields.length > 0;
		}
	}
}