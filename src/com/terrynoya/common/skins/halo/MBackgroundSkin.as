package com.terrynoya.common.skins.halo
{
	public class MBackgroundSkin extends MSkin
	{
		public function MBackgroundSkin()
		{
			super();
			this.w = 200;
			this.h = 100;
		}
		
		override protected function draw():void
		{
			this.graphics.clear();
			this.graphics.beginFill(0xff0000);
			this.graphics.drawRect(0,0,w,h);
			this.graphics.endFill();
		}
	}
}