package com.terrynoya.common.collection
{

	public class MListCollectionView implements IMCollectionView, IMList
	{
		private var _list:IMList;

		private var _filteredList:Array;

		private var _filterFunction:Function;

		private var _sort:MSort;

		public function MListCollectionView(list:IMList=null)
		{
			this._list=list;
		}

		public function get length():int
		{
			if (_filteredList)
			{
				return _filteredList.length;
			}
			else if (_list)
			{
				return _list.length;
			}
			else
			{
				return 0;
			}
		}

		public function get filterFunction():Function
		{
			return this._filterFunction;
		}

		public function set filterFunction(value:Function):void
		{
			if (this._filterFunction != value)
			{
				return;
			}
			this._filterFunction=value;
		}

		public function get sort():MSort
		{
			return this._sort;
		}

		public function set sort(value:MSort):void
		{
			if (this._sort == value)
			{
				return;
			}
			this._sort=value;
		}

		public function contains(item:Object):Boolean
		{
			return false;
		}

		public function disableAutoUpdate():void
		{
		}

		public function enableAutoUpdate():void
		{
		}

		public function itemUpdated(item:Object, property:Object=null, oldValue:Object=null, newValue:Object=null):void
		{
		}

		public function refresh():Boolean
		{
			var tmp:Array = this.getFilteredList();
			sort.sort(tmp);
			return false;
		}

		public function addItem(item:Object):void
		{

		}

		public function addItemAt(item:Object, index:int):void
		{
		}

		public function getItemAt(index:int, prefetch:int=0):Object
		{
			return null;
		}

		public function getItemIndex(item:Object):int
		{
			return 0;
		}

		public function removeAll():void
		{

		}

		public function removeItemAt(index:int):Object
		{
			return null;
		}

		public function setItemAt(item:Object, index:int):Object
		{
			return null;
		}

		public function toArray():Array
		{
			return null;
		}
		
		
		
		private function getFilteredList():Array
		{
			if (this._filterFunction == null)
			{
				return this._list.toArray().concat();	
			}
			
			var tmp:Array = [];
			
			for (var i:int=0; i < this._list.length; i++)
			{
				if (this._filterFunction(this._list[i]))
				{
					tmp.push(this._list[i]);
				}
			}
			
			return tmp;
		}
	}
}