package com.terrynoya.common.model
{
	public class MProgressModel extends MComponentModel
	{
		private var _maximum:Number;
		
		private var _minimun:Number;
		
		private var _value:int;
		
		private var _width:int;
		
		private var _height:int;
		
		public function MProgressModel(min:Number = 0,max:Number = 100,w:int = 100,h:int = 30)
		{
			super(w,h);
			this._maximum = max;
			this._minimun = min;
		}

		public function get value():int
		{
			return _value;
		}

		public function set value(value:int):void
		{
			_value = value;
		}

		public function get minimun():Number
		{
			return _minimun;
		}

		public function set minimun(value:Number):void
		{
			_minimun = value;
		}

		public function get maximum():Number
		{
			return _maximum;
		}

		public function set maximum(value:Number):void
		{
			_maximum = value;
		}

	}
}