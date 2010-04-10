package com.terrynoya.common.skins.halo
{
	import com.terrynoya.common.skins.halo.slider.MSliderThumbSkin;
	import com.terrynoya.common.skins.halo.slider.MSliderTrackSkin;

	public class MSliderSkin implements IMSliderSkin
	{
		private var _thumbSkin:IMButtonSkin;
		
		private var _trackSkin:IMButtonSkin;
		
		public function MSliderSkin()
		{
			this._thumbSkin = new MSliderThumbSkin();
			this._trackSkin = new MSliderTrackSkin();
		}
		
		public function set width(value:Number):void
		{
		
		}
		
		public function set height(value:Number):void
		{
		
		}
		
		public function get height():Number
		{
			return 0;
		}
		
		public function get width():Number
		{
			return 0;
		}
		
		public function get thumbSkin():IMButtonSkin
		{
			return this._thumbSkin;
		}
		
		public function get trackSkin():IMButtonSkin
		{
			return this._trackSkin;
		}
	}
}