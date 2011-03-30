package com.terrynoya.common.manager
{
	import flash.display.DisplayObjectContainer;
	import com.terrynoya.common.control.IMPopup;

	public class MPopupManager
	{
		private static var _imp:MPopUpManagerImpl
		
		public function MPopupManager()
		{
		}
		
		private static function get impl():MPopUpManagerImpl
		{
			if(_imp == null)
			{
				_imp = new MPopUpManagerImpl();
			}
			return _imp;
		}
		
		public static function addPopUp(value:IMPopup,parent:DisplayObjectContainer,model:Boolean = false):void
		{
			impl.addPopUp(value,parent,model);
		}
	}
}