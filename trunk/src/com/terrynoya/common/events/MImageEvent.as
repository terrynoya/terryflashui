package com.terrynoya.common.events
{
	import flash.events.Event;
	
	public class MImageEvent extends Event
	{
		public static const MIMAGE_LOAD_COMPLET:String = "mimage_load_complet";
		
		public function MImageEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}