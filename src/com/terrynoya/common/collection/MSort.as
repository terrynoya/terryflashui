package com.terrynoya.common.collection
{
	import com.terrynoya.common.core.melon_internal;
	
	import flash.events.EventDispatcher;
	
	use namespace melon_internal;
	
	public class MSort extends EventDispatcher
	{
		private var _sortFields:Array;
		
		private var _noFieldsDescending:Boolean = false;
		
		private var _defaultEmptyField:MSortField;
		
		public function MSort()
		{
			super();
			this._sortFields = new Array();
		}
		
		public function sort(items:Array):void
		{
			if(items.length <=1)
			{
				return;
			}
			var sortOpts:MArraySortOption = this.getSortOptions(items[0]);
			
			if(sortOpts.hasFields)
			{
				try
				{
					items.sortOn(sortOpts.fields,sortOpts.options);
				}
				catch(error:Error)
				{
					trace(error.message);
				}
			}
			else
			{
				items.sort(noFieldsCompare);
			}
		}
		
		public function addField(value:MSortField):void
		{
			this._sortFields.push(value);
		}
		
		public function reverse():void
		{
			if (this._sortFields)
			{
				for (var i:int = 0; i < this._sortFields.length; i++)
				{
					MSortField(this._sortFields[i]).reverse();
				}
			}
			this._noFieldsDescending = !this._noFieldsDescending;
		}
		
		private function noFieldsCompare(a:Object, b:Object, fields:Array = null):int
		{
			if (!this._defaultEmptyField)
			{
				this._defaultEmptyField = new MSortField();
			}
			this._defaultEmptyField.initCompare(a);
			
			var result:int = this._defaultEmptyField.compareFunction(a,b);
			
			if (this._noFieldsDescending)
			{
				result *= -1;
			}
			return result;
		}
		
//		public function set sortFields(value:Array):void
//		{
//			this._sortFields = value;
//		}
		
		
		private function getSortOptions(item:Object, buildArraySortArgs:Boolean = false):MArraySortOption
		{
			var sortOpt:MArraySortOption  = new MArraySortOption();
			
			for(var i:int = 0;i<this._sortFields.length;i++)
			{
				var sortField:MSortField = this._sortFields[i];
				sortField.initCompare(item);
				sortOpt.fields.push(sortField.name);
				sortOpt.options.push(sortField.sortOptions);
			}
			
			return sortOpt;
		}
	}
}