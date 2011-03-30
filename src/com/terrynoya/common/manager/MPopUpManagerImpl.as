package com.terrynoya.common.manager
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import com.terrynoya.common.control.IMPopup;

	public class MPopUpManagerImpl
	{
		public function MPopUpManagerImpl()
		{
		}
		
		public function addPopUp(value:IMPopup,parent:DisplayObjectContainer,model:Boolean):void
		{
			if(parent == null)
			{
				
			}
			parent.addChild(DisplayObject(value));
			value.centerToParent();
		}
	}
}