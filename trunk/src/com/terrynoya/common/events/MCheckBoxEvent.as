package com.terrynoya.common.events
{
	import flash.events.Event;

	public class MCheckBoxEvent extends Event
	{
		public static const CHANGE:String = "change";
		
		private var _checked:Boolean;
		
		public function MCheckBoxEvent(type:String,checked:Boolean, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._checked = checked;
		}
		
		public function get checked():Boolean
		{
			return this._checked;
		}
		
		override public function clone():Event
		{
			return new MCheckBoxEvent(this.type,this._checked,this.bubbles,this.cancelable);
		}
		
	}
}