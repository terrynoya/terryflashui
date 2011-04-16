package com.terrynoya.common.control
{
	import com.terrynoya.common.control.alertClasses.MAlertForm;
	import com.terrynoya.common.core.MUIComponent;
	import com.terrynoya.common.manager.MPopupManager;
	
	import flash.display.DisplayObjectContainer;

	public class MAlert
	{
		public static const OK:uint = 0x0001;
		
		public static const CANCEL:uint = 0x0002;
		
		public static const YES:uint = 0x0004;
		
		public static const NO:uint = 0x0008;
		
		public static var okLabel:String;
		
		public static var cancelLabel:String;
		
		public static var yesLabel:String;
		
		public static var noLabel:String;
		
		private var _title:String;
		
		private var _text:String;
		
		public var buttonFlags:uint = OK;
		
		public function MAlert()
		{
			super();
		}
		
		public function get title():String
		{
			return _title;
		}

		public function set title(value:String):void
		{
			_title = value;
		}

		public function get text():String
		{
			return _text;
		}

		public function set text(value:String):void
		{
			_text = value;
		}

		public static function show(title:String,message:String,
									flags:uint = 0x4 /* Alert.OK */, 
									closeHandler:Function = null, 
									parent:DisplayObjectContainer = null, 
									iconClass:Class = null, 
									defaultButtonFlag:uint = 0x4 /* Alert.OK */
								):void
		{
			var alert:MAlert = new MAlert();
			alert.text = message;
			alert.title = title;
			alert.buttonFlags = flags;
			var alertForm:MAlertForm = new MAlertForm(title,message,flags);
			MPopupManager.addPopUp(alertForm,parent);
		}
	}
}