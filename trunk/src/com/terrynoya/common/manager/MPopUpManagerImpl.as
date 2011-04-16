package com.terrynoya.common.manager
{
	import com.terrynoya.common.control.IMPopup;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;

	public class MPopUpManagerImpl
	{
		public function MPopUpManagerImpl()
		{
		}
		
		public function addPopUp(value:IMPopup,parent:DisplayObjectContainer,model:Boolean):void
		{
			if(parent == null)
			{
				parent = MSystemManager.stage;
			}
			parent.addChild(DisplayObject(value));
			value.centerToParent();
		}
	}
}