package com.terrynoya.common.control
{
	import com.terrynoya.common.skins.halo.MCheckBoxSkin;
	import com.terrynoya.common.manager.MSkinManager;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	public class MCheckBox extends MButton
	{
		private var _ischecked:Boolean;
		
		public function MCheckBox()
		{
			super();
			this.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function get checked():Boolean
		{
			return this._ischecked;
		}
		
		public function set checked(value:Boolean):void
		{
			this._ischecked = value;
		}
		
		override protected function createSkin() : void
		{
			this.skin = MSkinManager.checkBoxSkin;
		}
		
		private function toggle():void
		{
			this.checked = !this.checked;
			this.updateView();
		}
		
		private function onClick(e:MouseEvent):void
		{
			this.toggle();
		}
		
		override protected function getSkinByPhase(phase:String):DisplayObject
		{
			if(this.checked)
			{
				return MCheckBoxSkin(this.skin).selectedSkin;
			}
			return super.getSkinByPhase(phase);
		}
		
	}
}