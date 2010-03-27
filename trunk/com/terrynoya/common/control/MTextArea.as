package com.terrynoya.common.control
{
	import com.terrynoya.common.core.MScrollControlBase;

	public class MTextArea extends MScrollControlBase
	{
		private var _label:MLabel;
		
		public function MTextArea()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			this._label = new MLabel();
			this.addChild(this._label);
		}
	}
}