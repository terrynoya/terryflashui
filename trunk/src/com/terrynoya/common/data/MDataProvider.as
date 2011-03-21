package com.terrynoya.common.data
{
    import flash.events.EventDispatcher;

    /**
     * 数据提供者，为视图提供数据
     * @author yaojianzhou
     */
    public class MDataProvider extends EventDispatcher
    {
        /**
         *
         * @default
         */
        protected var data:Array;

        /**
         *
         * @param value
         */
        public function MDataProvider(value:Object = null)
        {
            super();
            if (value == null)
            {
                data = [];
            }
            else
            {
                data = getDataFromObject(value);
            }
        }

        /**
         *
         * @return
         */
        public function get length():uint
        {
            return data.length;
        }

        /**
         *
         * @param index
         * @return
         */
        public function getItemAt(index:uint):Object
        {
            checkIndex(index, data.length - 1);
            return data[index];
        }


        /**
         *
         * @param item
         * @return
         */
        public function getItemIndex(item:Object):int
        {
            return data.indexOf(item);
        }

        /**
         *
         * @param item
         */
        public function addItem(item:Object):void
        {
//			dispatchPreChangeEvent(DataChangeType.ADD,[item],data.length-1,data.length-1);
            data.push(item);
//			dispatchChangeEvent(DataChangeType.ADD,[item],data.length-1,data.length-1);
        }

        /**
         *
         * @param item
         * @param index
         */
        public function addItemAt(item:Object, index:uint):void
        {
            checkIndex(index, data.length);
//			dispatchPreChangeEvent(DataChangeType.ADD,[item],index,index);
            data.splice(index, 0, item);
//			dispatchChangeEvent(DataChangeType.ADD,[item],index,index);
        }

        /**
         *
         * @param item
         * @return
         */
        public function removeItem(item:Object):Object
        {
            var index:int = getItemIndex(item);
            if (index != -1)
            {
                return removeItemAt(index);
            }
            return null;
        }


        /**
         *
         * @param index
         * @return
         */
        public function removeItemAt(index:uint):Object
        {
            checkIndex(index, data.length - 1);
//			dispatchPreChangeEvent(DataChangeType.REMOVE, data.slice(index,index+1), index, index);
            var arr:Array = data.splice(index, 1);
//			dispatchChangeEvent(DataChangeType.REMOVE,arr,index,index);
            return arr[0];
        }

        /**
         *
         */
        public function removeAll():void
        {
            var arr:Array = data.concat();
//			dispatchPreChangeEvent(DataChangeType.REMOVE_ALL,arr,0,arr.length);
            data = [];
//			dispatchChangeEvent(DataChangeType.REMOVE_ALL,arr,0,arr.length);
        }

        override public function toString():String
        {
            return "DataProvider [" + data.join(" , ") + "]";
        }

        /**
         * 得到含有数据对象的数组
         * @return
         */
        public function toArray():Array
        {
            return data.concat();
        }

        /**
         * 格式化数据
         * @param obj
         * @return
         */
        protected function getDataFromObject(obj:*):Array
        {
            var rltArr:Array;
            if (obj is Array)
            {
                rltArr = arrFormat(obj);
            }
            else if (obj is XML)
            {
                rltArr = xmlFormat(obj);
            }
            else if (obj is MDataProvider)
            {
                rltArr = MDataProvider(obj).toArray();
            }
            else
            {
                throw new TypeError("Error: Type Coercion failed: cannot convert " + obj + " to Array or DataProvider.");
                return null;
            }
            return rltArr;
        }

        /**
         * 如果是xml数据则全部转换成Object
         * @private
         */
        private function xmlFormat(obj:Object):Array
        {
            var retArr:Array;
            var xml:XML = obj as XML;
            retArr = [];
            var nodes:XMLList = xml.*;
            for each (var node:XML in nodes)
            {
                var obj:Object = {};
                var attrs:XMLList = node.attributes();
                for each (var attr:XML in attrs)
                {
                    obj[attr.localName()] = attr.toString();
                }
                var propNodes:XMLList = node.*;
                for each (var propNode:XML in propNodes)
                {
                    if (propNode.hasSimpleContent())
                    {
                        obj[propNode.localName()] = propNode.toString();
                    }
                }
                retArr.push(obj);
            }
            return retArr;
        }

        /**
         * 如果是数组数据则全部转换成Object
         * @private
         */
        private function arrFormat(obj:Object):Array
        {
            var retArr:Array;
            var arr:Array = obj as Array;
            if (arr.length > 0)
            {
                if (arr[0] is String || arr[0] is Number)
                {
                    retArr = [];
                    // convert to object array.
                    for (var i:uint = 0; i < arr.length; i++)
                    {
                        var o:Object = { label: String(arr[i]), data: arr[i]}
                        retArr.push(o);
                    }
                    return retArr;
                }
            }
            return obj.concat();
        }
		 
		public function indexOf(item:Object):int
		{
			return this.data.indexOf(item);
		}
		
		public function replaceItemAt(newItem:Object,index:uint):Object {
			checkIndex(index,data.length-1);
			var arr:Array = [data[index]];
//			dispatchPreChangeEvent(DataChangeType.REPLACE,arr,index,index);
			this.data[index] = newItem;
//			dispatchChangeEvent(DataChangeType.REPLACE,arr,index,index);
			return arr[0];
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

    }
}