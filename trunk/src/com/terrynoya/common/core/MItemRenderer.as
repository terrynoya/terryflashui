package com.terrynoya.common.core
{
	
	use namespace melon_internal;

	public class MItemRenderer extends MUIComponent implements IMItemRenderer
	{
		private var _data:Object;
		private var _selected:Boolean;
		
		private var _hovered:Boolean=false;

		public function MItemRenderer()
		{
			super();
		}
		
		public function get hovered():Boolean
		{
			return this._hovered;
		}
		
		public function set hovered(value:Boolean):void
		{
			this._hovered = value;
			this.updateView();
		}
		
		public function get data():Object
		{
			return this._data;
		}

		public function set data(value:Object):void
		{
			this._data=value;
			this.updateView();
		}

		public function get selected():Boolean
		{
			return this._selected;
		}

		public function set selected(value:Boolean):void
		{
			this._selected=value;
			this.updateView();
		}
	}
}