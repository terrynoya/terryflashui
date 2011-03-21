package com.terrynoya.common.events
{
	import flash.events.Event;

	public class MRadioButtonEvent extends Event
	{
		
		public static const CHANGE:String = "change";
		
		public function MRadioButtonEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}