package com.terrynoya.common.control
{
	import com.terrynoya.common.core.MScrollControlBase;

	public class MTextArea extends MScrollControlBase
	{
		private var _label:MLabel;
		private var _defaultWidth:Number = 100;
		
		public function MTextArea(w:Number,h:Number)
		{
			super(w,h);
		}
		
		override public function set width(value:Number):void
		{
			super.width = value;
			this._label.width = value;
		}
		
		public function set text(value:String):void
		{
			this._label.text = value;
			this.updateView();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			this._label = new MLabel();
			this._label.multiLine = true;
			this._label.width = this._defaultWidth;
			
			this.addChild(this._label);
		}
		
		override protected function updateView():void
		{
			super.updateView();
		}
	}
}