package com.terrynoya.common.control
{
	import com.terrynoya.manager.MSkinManager;
	
	public class MRadioButton extends MCheckBox
	{
		public function MRadioButton()
		{
			super();
			this.buttonSkin = MSkinManager.radioButtonSkin;
		}
	}
}