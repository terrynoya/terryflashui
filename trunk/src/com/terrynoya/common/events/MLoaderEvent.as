package com.terrynoya.common.events
{
	import flash.events.Event;
	
	public class MLoaderEvent extends Event
	{
		public static const MLOADER_COMP:String = "mloader_comp";
		
		public static const MLOADER_PROGRESS:String = "mloader_progress";
		
		public function MLoaderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}