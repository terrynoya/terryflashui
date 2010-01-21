package com.terrynoya.common.control.scrollClasses
{
	import com.terrynoya.common.control.MButton;
	import com.terrynoya.common.core.MUIComponent;
	import com.terrynoya.common.skins.halo.scrollSkin.MScrollDownArrowSkin;
	import com.terrynoya.common.skins.halo.scrollSkin.MScrollThumbSkin;
	import com.terrynoya.common.skins.halo.scrollSkin.MScrollTrackSkin;
	import com.terrynoya.common.skins.halo.scrollSkin.MScrollUpArrowSkin;
	
	public class MScrollBar extends MUIComponent
	{
		protected var upArrow:MButton;
		
		protected var downArrow:MButton;
		
		protected var track:MButton;
		
		protected var thumb:MButton;
		
		private var _minimun:Number;
		
		private var _maximun;
		
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
			
			this.thumb = new MButton();
			this.thumb.buttonSkin = new MScrollThumbSkin();
			
			this.addChild(this.upArrow);
			this.addChild(this.downArrow);
			this.addChild(this.track);
			this.addChild(this.thumb);
			 
			this.layoutUI();
		}
		
		override public function set width(value:Number):void
		{
			
		}
		
		override public function set height(value:Number):void
		{
			this.track.height = value - this.upArrow.height - this.downArrow.height;
			this.layoutUI();
		}
		
		private function layoutUI():void
		{
			this.track.y = this.upArrow.height;
			this.downArrow.y = this.track.y + this.track.height;
		}
	}
}