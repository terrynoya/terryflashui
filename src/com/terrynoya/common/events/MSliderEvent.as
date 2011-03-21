package com.terrynoya.common.events
{
	import flash.events.Event;
	
	public class MSliderEvent extends Event
	{
		public var value:Number;
		
		public static const CHANGE:String = "change";
		
		public function MSliderEvent(type:String,value:Number, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.value = value;
			super(type, bubbles, cancelable);
		}
	}
}