package com.terrynoya.common.events
{
	import flash.events.Event;

	/**
	 * MButton Event
	 * @author TerryYao
	 */
	public class MButtonEvent extends Event
	{
		/**
		 * 
		 * @default 
		 */
		public static const BUTTON_DOWN:String = "button_down";
		
		/**
		 * 
		 * @default 
		 */
		public static const BUTTON_OVER:String = "button_over";
		
		/**
		 * 
		 * @default 
		 */
		public static const BUTTON_CLICK:String = "button_click";

        /**
         * 
         * @default 
         */
        public static const BUTTON_OUT:String = "button_out";
		
		/**
		 * 
		 * @param type
		 * @param bubbles
		 * @param cancelable
		 */
		public function MButtonEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}