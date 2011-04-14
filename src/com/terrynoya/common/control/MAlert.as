package com.terrynoya.common.control
{
	import com.terrynoya.common.control.alertClasses.MAlertForm;
	import com.terrynoya.common.core.MUIComponent;
	import com.terrynoya.common.manager.MPopupManager;
	
	import flash.display.DisplayObjectContainer;

	public class MAlert extends MUIComponent
	{
		public static const OK:uint = 1;
		
		public static const CANCEL:uint = 2;
		
		public static const YES:uint = 4;
		
		public static const NO:uint = 8;
		
		private var _title:String;
		
		private var _text:String;
		
		private var _alertForm:MAlertForm;
		
		public function MAlert()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			this._alertForm = new MAlertForm();
			this.addChild(this._alertForm);
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
									parent:DisplayObjectContainer = null, 
									flags:uint = 0x4 /* Alert.OK */, 
									closeHandler:Function = null, 
									iconClass:Class = null, 
									defaultButtonFlag:uint = 0x4 /* Alert.OK */
								):void
		{
			var alert:MAlert = new MAlert();
			alert.text = message;
			alert.title = title;
			MPopupManager.addPopUp(alert,parent);
		}
	}
}