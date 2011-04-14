package com.terrynoya.common.control.alertClasses
{
	import com.terrynoya.common.control.MButton;
	import com.terrynoya.common.control.MLabel;
	import com.terrynoya.common.core.MUIComponent;

	public class MAlertForm extends MUIComponent
	{
		
		private var _label:MLabel;
		
		private var _button:MButton;
		
		public function MAlertForm()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			this._label = new MLabel();
			this._button = new MButton();
			this.addChild(this._label);
			this.addChild(this._button);
		}
		
		
	}
}