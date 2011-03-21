package com.terrynoya.common.collection
{
	import com.terrynoya.common.core.melon_internal;
	import com.terrynoya.common.util.MCompareUtil;
	
	import flash.events.EventDispatcher;
	
	use namespace melon_internal;
	
	public class MSortField extends EventDispatcher
	{
		
		private var _caseInsensitive:Boolean;
		
		private var _compareFunction:Function;
		
		private var _name:String;
		
		private var _descending:Boolean;
		
		public function MSortField(name:String = null)
		{
			this._name = name;
			super();
		}
		
		public function get caseInsensitive():Boolean
		{
			return _caseInsensitive;
		}
		
		public function set caseInsensitive(value:Boolean):void
		{
			if (value != _caseInsensitive)
			{
				_caseInsensitive = value;
//				dispatchEvent(new Event("caseInsensitiveChanged"));
			}
		}
		
		public function get descending():Boolean
		{
			return _descending;
		}
		
		
		public function set descending(value:Boolean):void
		{
			if (_descending != value)
			{
				_descending = value;
//				dispatchEvent(new Event("descendingChanged"));
			}
		}
		
		public function get name():String
		{
			return _name;
		}
		
		/**
		 *  @private
		 */
		public function set name(n:String):void
		{
			_name = n;
//			dispatchEvent(new Event("nameChanged"));
		}
		
		public function get compareFunction():Function
		{
			return this._compareFunction;
		}
		
		public function reverse():void
		{
			descending = !descending;
		}
		
		melon_internal function initCompare(object:*):void
		{
			this._compareFunction = MCompareUtil.getFunctionByObjectType(object);
		}
		
		melon_internal function get sortOptions():int
		{
			var options:int = 0;
			if (caseInsensitive) options |= Array.CASEINSENSITIVE;
			if (descending) options |= Array.DESCENDING;
//			if (numeric == true || _compareFunction == numericCompare) options |= Array.NUMERIC;
			return options;
		}
	}
}