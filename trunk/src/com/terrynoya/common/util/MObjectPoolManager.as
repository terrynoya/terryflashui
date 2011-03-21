package com.terrynoya.common.util
{
	public class MObjectPoolManager
	{
		
		private static var s_instance:MObjectPoolManager;
		private static var s_singleton:Boolean;
		private var _poolMap:MHashMap;
		
		public function MObjectPoolManager()
		{
			if (!s_singleton)
			{
				throw new Error("不允许实例化静态类");
			}
			_poolMap = new MHashMap();
		}
		
		private static function get instance():MObjectPoolManager
		{
			if (!s_instance)
			{
				s_singleton = true;
				s_instance = new MObjectPoolManager();
				s_singleton = false;
			}
			return s_instance;
		}
		
		/**
		 * 根据指定的类型,获得对象
		 * @param classType 指定的类型
		 * @return 该类型的对象
		 */
		public static function getObject(classType:Class):*
		{
			return instance.getObjectImpl(classType);
		}
		
		/**
		 * 回收对象
		 * @param classType 对象的类型
		 * @param object 对象实例
		 */
		public static function recycleObject(classType:Class, object:*):void
		{
			instance.recycleObjectImpl(classType, object);
		}
		
		/**
		 * 清空指定类型的对象
		 * @param classType 对象的类型
		 */
		public static function clearObject(classType:Class):void
		{
			instance.clearObject(classType);
		}
		
		private function getObjectImpl(classType:Class):*
		{
			var pool:MObjectPool = null;
			
			if (!_poolMap.containsKey(classType))
			{
				pool = new MObjectPool(classType);
				_poolMap.put(classType, pool);
			}
			
			pool = _poolMap.getValue(classType);
			
			return pool.getObject();
		}
		
		private function recycleObjectImpl(classType:Class, object:*):void
		{
			if (_poolMap.containsKey(classType))
			{
				var pool:MObjectPool = _poolMap.getValue(classType);
				
				pool.recycleObject(object);
			}
		}
		
		private function clearObject(classType:Class):void
		{
			if (_poolMap.containsKey(classType))
			{
				var pool:MObjectPool = _poolMap.getValue(classType);
				
				pool.clear();
			}
		}
	}
} 