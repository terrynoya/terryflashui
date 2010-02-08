package com.terrynoya.common.core
{
	import flash.events.MouseEvent;
	use namespace melon_internal;

	public class MItemRenderer extends MUIComponent implements IMItemRenderer
	{
		private var _data:Object;
		private var _selected:Boolean;
		protected var hovered:Boolean=false;

		public function MItemRenderer()
		{
			super();
		}

		public function get data():Object
		{
			return this._data;
		}

		public function set data(value:Object):void
		{
			this._data=value;
		}

		public function get selected():Boolean
		{
			return this._selected;
		}

		public function set selected(value:Boolean):void
		{
			this._selected=value;
			this.setCurrentState(null);
		}

		/**
		 *	子类根据具体情况覆盖
		 */
		public function setCurrentState(stateName:String, playTransition:Boolean=true):void
		{

		}
	}
}