package com.terrynoya.common.skins.halo.progressBar
{
	import com.terrynoya.common.core.MMaskSkin;
	import com.terrynoya.common.skins.halo.IMProgressBarSkin;
	import com.terrynoya.common.skins.halo.IMSkin;
	
	public class MProgressBarSkin implements IMProgressBarSkin
	{
		private var _barSkin:IMSkin;
		
		private var _trackSkin:IMSkin;
		
		private var _maskSkin:IMSkin;
		
		public function MProgressBarSkin()
		{
			this._barSkin = new MProgressUpBarSkin();
			this._trackSkin = new MProgressTrackSkin();
			this._maskSkin = new MMaskSkin();
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
		
		public function get barSkin():IMSkin
		{
			return this._barSkin;
		}
		
		public function get trackSkin():IMSkin
		{
			return this._trackSkin;
		}
		
		public function get maskSkin():IMSkin
		{
			return _maskSkin;
		}
	}
}