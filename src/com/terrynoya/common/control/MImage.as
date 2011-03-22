package com.terrynoya.common.control
{
	import com.terrynoya.common.core.MUIComponent;
	
	import flash.display.Bitmap;
	
	[Event(name="mimage_load_complet",type="com.terrynoya.common.events.MImageEvent")]
	
	public class MImage extends MUIComponent
	{
		private var _url:String;
		
		private var _source:Bitmap;
		
		public function MImage()
		{
			super();
		}
		
		public function get source():Bitmap
		{
			return _source;
		}

		public function set source(value:Bitmap):void
		{
			_source = value;
		}

		public function get url():String
		{
			return _url;
		}

		public function set url(value:String):void
		{
			if(this._url == value)
			{
				return;			
			}
			_url = value;
			
		}

	}
}