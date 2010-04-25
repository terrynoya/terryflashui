package com.terrynoya.common.control
{
	import com.terrynoya.common.control.scrollClasses.MScrollBarPolicy;
	import com.terrynoya.common.core.MScrollControlBase;
	import com.terrynoya.common.events.MScrollEvent;

	/**
	 * TextArea
	 * @author TerryYao
	 */
	public class MTextArea extends MScrollControlBase
	{
		private var _label:MLabel;
		private var _defaultWidth:Number = 100;
		
		/**
		 * 
		 * @param w
		 * @param h
		 */
		public function MTextArea(w:Number,h:Number)
		{
			super(w,h);
		}
		
		override public function set width(value:Number):void
		{
			this._label.width = value;
			super.width = value;
		}
		
		/**
		 * 
		 * @param value
		 */
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
			this._label.mask=this.maskShape;
		}
		
		override protected function vScrollHandler(e:MScrollEvent):void
		{
			var maxPos:Number = -e.scrollPosition + this.height
			this._label.y = -e.scrollPosition;
		}
		
		override protected function updateView():void
		{
			super.updateView();
			this.vScroll_Maximum = this._label.height - this.height;
		}
	}
}