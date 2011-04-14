package com.terrynoya.common.model
{
	public class MComponentModel implements IMComponentModel
	{
		private var _width:Number;
		
		private var _height:Number;
		
		public function MComponentModel(w:Number = 100,h:Number = 30)
		{
			this._width = w;
			this._height = h;
		}
		
		public function get height():Number
		{
			return _height;
		}
		
		public function set height(value:Number):void
		{
			_height = value;
		}
		
		public function get width():Number
		{
			return _width;
		}
		
		public function set width(value:Number):void
		{
			_width = value;
		}
	}
}