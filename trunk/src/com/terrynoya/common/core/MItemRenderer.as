package com.terrynoya.common.core
{
	import com.terrynoya.common.control.MLabel;
	
	use namespace melon_internal;

	public class MItemRenderer extends MLabel implements IMItemRenderer
	{
		private var _data:Object;
		
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
			this.text = this._data.toString();
		} 
	}
}