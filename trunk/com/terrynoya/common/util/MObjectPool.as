package com.terrynoya.common.util
{

    /**
     * UzObjectPool,对象池
     * @author yaojianzhou, wengjiawei
     */
    public class MObjectPool
    {
        private var _classType:Class;
        private var _pool:Array;
 
        /**
         * 构造函数,创建一个新的UzObjectPool
         * @param classType 对象池中的对象的类型
         * @throws Error 如果 classType 为  null,引发异常
         */
        public function MObjectPool(classType:Class)
        {
            if (!classType)
            {
                throw new Error("对象池类型不能为空");
            }
            _classType = classType;
            _pool = new Array();
        }
 
        /**
         * 对象池中对象的类型
         * @return
         */
        public function get classType():Class
        {
            return _classType;
        }

        /**
         * @private
         * @param value
         */
        public function set classType(value:Class):void
        {
            if (_classType != value)
            {
                clear();
                _classType = value;
            }
        }

        /**
         * 获得对象
         * @return
         */
        public function getObject():*
        {
            if (_pool.length == 0)
            {
                var obj:* = new _classType();
                _pool.push(obj);
            }
            return _pool.pop();
        }

        /**
         * 回收对象
         * @param object
         */
        public function recycleObject(object:*):void
        {
            _pool.push(object);
        }

        /**
         * 清空 对象池
         */
        public function clear():void
        {
            _pool = new Array();
        }
    }
}