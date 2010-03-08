package com.terrynoya.common.control
{
	import com.terrynoya.common.manager.MSkinManager;
	
	public class MRadioButton extends MCheckBox
	{
		public function MRadioButton()
		{
			super();
		}
		
		override protected function createSkin() : void
		{
			this.skin = MSkinManager.radioButtonSkin;
		}
	}
}