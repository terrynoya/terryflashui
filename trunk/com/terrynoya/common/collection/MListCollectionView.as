package com.terrynoya.common.collection
{
	

	public class MListCollectionView implements IMCollectionView, IMList
	{
		private var _list:IMList;

		private var _filteredList:Array;

		private var _filterFunction:Function;

		private var _sort:MSort;

		public function MListCollectionView()
		{
			this._list = new MArrayList();
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
			if(this.sort)
			{
				sort.sort(tmp);
				this._filteredList = tmp;
				return true;
			}
			return false;
		} 

		public function addItem(item:Object):void
		{
			this._list.addItem(item);
		} 

		public function addItemAt(item:Object, index:int):void
		{
			this._list.addItemAt(item,index);
		}

		public function getItemAt(index:int, prefetch:int=0):Object
		{
			return this._list.getItemAt(index,prefetch);
		}

		public function getItemIndex(item:Object):int
		{
			return this._list.getItemIndex(item);
		}

		public function removeAll():void
		{
			this._list.removeAll();
		}

		public function removeItemAt(index:int):Object
		{
			return this._list.removeItemAt(index);
		}

		public function setItemAt(item:Object, index:int):Object
		{
			return this._list.setItemAt(item,index);
		}

		public function toArray():Array
		{
			if(this._filteredList)
			{
				return this._filteredList.concat();
			}
			else
			{	
				return this._list.toArray();
			}
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
				var item:* = this._list.getItemAt(i);
				if (this._filterFunction(item))
				{
					tmp.push(item);
				}
			}
			return tmp;
		}
	}
}