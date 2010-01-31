package com.terrynoya.common.events
{
	import flash.events.Event;
	
	public class MScrollEvent extends Event
	{
		
		public static const SCROLL:String = "scroll";
		
		
		public var scrollPosition:Number;
		
		public var direction:String;
		
		public function MScrollEvent(type:String, scrollValue:Number, direction:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.scrollPosition = scrollValue;
			this.direction = direction;
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new MScrollEvent(type,scrollPosition,direction);
		}
	}
}