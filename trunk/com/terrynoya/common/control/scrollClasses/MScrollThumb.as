package com.terrynoya.common.control.scrollClasses
{
	import com.terrynoya.common.control.MButton;
	import com.terrynoya.common.skins.halo.scrollSkin.MScrollThumbSkin;
	
	public class MScrollThumb extends MButton
	{
		public function MScrollThumb()
		{
			super();
			this.buttonSkin=new MScrollThumbSkin();
		}
	}
}