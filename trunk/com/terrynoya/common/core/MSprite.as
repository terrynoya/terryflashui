package com.terrynoya.common.core
{
	import flash.display.Sprite;

	public class MSprite extends Sprite implements IMDisplayObject
	{
		protected var _toolTip:String;
		
		public function MSprite()
		{
			super();
		}
		
		public function get toolTip():String
		{
			return this._toolTip;
		}
		
		public function set toolTip(value:String):void
		{
			this._toolTip = value;
		}
	}
}