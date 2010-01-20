package com.terrynoya.common.control.scrollClasses
{
	import com.terrynoya.common.control.MButton;
	import com.terrynoya.common.core.MUIComponent;
	import com.terrynoya.common.skins.halo.scrollSkin.MScrollDownArrowSkin;
	import com.terrynoya.common.skins.halo.scrollSkin.MScrollTrackSkin;
	import com.terrynoya.common.skins.halo.scrollSkin.MScrollUpArrowSkin;
	
	public class MScrollBar extends MUIComponent
	{
		protected var upArrow:MButton;
		
		protected var downArrow:MButton;
		
		protected var track:MButton;
		
		protected var thumb:MButton;
		
		public function MScrollBar()
		{
			super();
		}
		
		override protected function addChildren():void
		{
			this.upArrow = new MButton();
			this.upArrow.buttonSkin = new MScrollUpArrowSkin();
			
			this.downArrow = new MButton();
			this.downArrow.buttonSkin = new MScrollDownArrowSkin();
			
			this.track = new MButton();
			this.track.buttonSkin = new MScrollTrackSkin();
			
//			this.addChild(this.upArrow);
//			this.addChild(this.downArrow);
			this.addChild(this.track);
			
			
		}
	}
}