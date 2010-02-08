package com.terrynoya.common.control
{
	import flash.text.TextField;
	
	public class MTextField extends TextField
	{
		private var _explicitWidth:Number;
		private var _text:String;
		private var _htmlText:String;
		private var _explicitHTMLText:String = null; 
		public function MTextField()
		{
			super(); 
		}
		
		public function set explicitWidth(value:Number):void
    	{
    		this._explicitWidth = value;
    	}
		
		public function get explicitWidth():Number
    	{
    		return this._explicitWidth;
    	}
    	
    	public function truncateToFit():Boolean
    	{
    		if(isHtml)
    		{ 
    			return false;
    		}
    		var s:String = super.text = this._text;
    		while(s.length > 1 && this.textWidth > this.explicitWidth)
    		{
    			 s = s.slice(0, -1);
    			super.text = s + "...";
    		}
    		return true;
    	}
    	
    	override public function set text(value:String):void
		{
			this._text = value;
			this._htmlText = null;
			super.text = value;
		} 
		
		override public function get text():String
		{
			return this.text;
		}
		
		override public function set htmlText(value:String):void
		{
			this._htmlText = value;
			this._text = null;
			
			super.htmlText = value;
		}
		
		override public function get htmlText():String
		{
			return this.htmlText;
		}
		
		private function get isHtml():Boolean
		{
			return this._htmlText != null;
		}
		
		
	}
}