package com.terrynoya.common.core
{
	import com.terrynoya.common.skins.halo.MSkin;
	
	public class MMaskSkin extends MSkin
	{
		public function MMaskSkin()
		{
			super();
			this.w = 100;
			this.h = 30;
			this.draw();
		}
		
		override protected function draw():void
		{
			graphics.clear();
			graphics.beginFill(0x0);
			graphics.drawRect(0,0,this.w,this.h);
			graphics.endFill();
		}
	}
}