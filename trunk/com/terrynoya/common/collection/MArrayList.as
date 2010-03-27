package com.terrynoya.common.collection
{
	import com.terrynoya.common.util.MObjectType;
	import com.terrynoya.common.util.MObjectUtil;
	

	public class MArrayList implements IMList
	{
		/**
		 * 数据集合
		 * @default
		 */
		protected var data:Array;

		public function MArrayList()
		{
			this.data=new Array();
		}

		public function get length():int
		{
			return data.length;
		} 
 
		public function addItem(item:Object):void
		{
//			this.data.push(item);
			if(this.isBasicType(item)
			{
				this.data.push(item);
			}	
			else
			{
				this.getDataFromObject(item);
			}
//			var startIndex:int=this.data.length;
//			var endIndex:int=this.data.length + newArr.length - 1;
//			this.data=this.data.concat(newArr);
//			this.dispatchDataChangeEvent(UzDataProviderChangeType.ADD, startIndex, endIndex);
		}

		public function addItemAt(item:Object, index:int):void
		{
			checkIndex(index, data.length);
			var newArr:Array = insertItemAt(item, index);
//			this.dispatchDataChangeEvent(UzDataProviderChangeType.ADD, index, index + newArr.length - 1);
		}

		public function getItemAt(index:int, prefetch:int=0):Object
		{
			checkIndex(index, data.length - 1);
			return data[index];
		}

		public function getItemIndex(item:Object):int
		{
			return data.indexOf(item);
		}

		public function itemUpdated(item:Object, property:Object=null, oldValue:Object=null, newValue:Object=null):void
		{
		}

		public function removeAll():void
		{
			var arr:Array = data.concat();
//			this.dispatchDataChangeEvent(UzDataProviderChangeType.REMOVE_ALL, 0, arr.length);
			data = [];
		}

		public function removeItemAt(index:int):Object
		{
			checkIndex(index, data.length - 1);
			var arr:Array = data.splice(index, 1);
//			this.dispatchDataChangeEvent(UzDataProviderChangeType.REMOVE, index, index);
			return arr[0];
		}

		public function setItemAt(item:Object, index:int):Object
		{
			checkIndex(index, data.length - 1);
			var newArr:Array = this.getDataFromObject(item);
			
			if (!newArr[0])
			{
				return null;
			}
			var arr:Array = data.splice(index, 1);
			this.insertItemAt(newArr,index);
//			this.dispatchDataChangeEvent(UzDataProviderChangeType.REPLACE, index, index + newArr.length - 1);
			return newArr;
		}

		public function toArray():Array
		{
			return this.data.concat();
		}

		/**
		 * 格式化数据
		 * @param obj
		 * @return
		 */
		private	var rltArr:Array=[];
		
		protected function getDataFromObject(obj:*):Array
		{
			rltArr = [];
			if (obj is Array)
			{
				rltArr=obj;
			}
			else if (obj is XML)
			{
				rltArr=xmlFormat(obj);
			}
			else if (obj is MArrayList)
			{
				rltArr=MArrayList(obj).toArray();
			}
			
			return rltArr;
		}
		
		private function isBasicType(obj:*):Boolean
		{
			var rlt:Boolean = obj is Number || obj is String 
			return  rlt;
		}

		/**
		 * 如果是xml数据则全部转换成Object
		 * @private
		 */
		private function xmlFormat(obj:Object):Array
		{
			var retArr:Array;
			var xml:XML=obj as XML;
			retArr=[];
			var nodes:XMLList=xml.*;
			for each (var node:XML in nodes)
			{
				var obj:Object={};
				var attrs:XMLList=node.attributes();
				for each (var attr:XML in attrs)
				{
					obj[attr.localName()]=attr.toString();
				}
				var propNodes:XMLList=node.*;
				for each (var propNode:XML in propNodes)
				{
					if (propNode.hasSimpleContent())
					{
						obj[propNode.localName()]=propNode.toString();
					}
				}
				retArr.push(obj);
			}
			return retArr;
		}

		/**
		 * 如果是数组数据则全部转换成Object(此接口函数留作今后使用)
		 * @private
		 */
		private function arrFormat(obj:Object):Array
		{
			var retArr:Array;
			var arr:Array=obj as Array;
			if (arr.length > 0)
			{
				if (arr[0] is String || arr[0] is Number)
				{
					retArr=[];
					// convert to object array.
					for (var i:uint=0; i < arr.length; i++)
					{
						var o:Object={label: String(arr[i]), data: arr[i]}
						retArr.push(o);
					}
					return retArr;
				}
			}
			return obj.concat();
		}

		/**
		 *
		 * @param index
		 * @param maximum
		 * @throws RangeError
		 */
		protected function checkIndex(index:int, maximum:int):void
		{
			if (index > maximum || index < 0)
			{
				throw new RangeError("DataProvider index (" + index + ") is not in acceptable range (0 - " + maximum + ")");
			}
		}

		/**
		 * 插入事件的内部实现，不引起Change事件，其他函数也会用到
		 */
		private function insertItemAt(item:Object, index:uint):Array
		{
			var newArr:Array=this.getDataFromObject(item);
			var before:Array=data.slice(0, index);
			var after:Array=data.splice(index);
			data=before.concat(newArr).concat(after);
			return newArr;
		}
	}
}