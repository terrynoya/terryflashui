package com.terrynoya.common.control.alertClasses
{
	import com.terrynoya.common.control.MAlert;
	import com.terrynoya.common.control.MButton;
	import com.terrynoya.common.control.MHBox;
	import com.terrynoya.common.control.MLabel;
	import com.terrynoya.common.control.MLabelButton;
	import com.terrynoya.common.control.MPanel;
	import com.terrynoya.common.core.MUIComponent;
	import com.terrynoya.common.model.IMAlertLocalModel;
	import com.terrynoya.common.model.MAlertLocalModel;
	
	import flash.display.DisplayObject;

	public class MAlertForm extends MPanel
	{
		private var _label:MLabel;
		
		private var _buttons:Array;
		
		private var _local:IMAlertLocalModel;
		
		private var _buttonBox:MHBox;
		
		private var _buttonFlags:uint;
		
		private var _title:String;
		
		private var _text:String;
		
		public function MAlertForm(title:String,msg:String,flags:uint,local:IMAlertLocalModel = null)
		{
			this._buttonFlags = flags;
			if(local == null)
			{
				local = new MAlertLocalModel();
			}
			this._local = local;
			super();
			this.width = 300;
			this.height = 200;
		}
		
		public function get text():String
		{
			return _text;
		}

		public function set text(value:String):void
		{
			_text = value;
		}

		public function get title():String
		{
			return _title;
		}

		public function set title(value:String):void
		{
			_title = value;
		}

		protected function get buttons():Array
		{
			return _buttons;
		}

		protected function set buttons(value:Array):void
		{
			_buttons = value;
		}

		override protected function createChildren():void
		{
			super.createChildren();
			this._buttons = new Array();
			this._label = new MLabel();
			var flag:uint = this._buttonFlags; 
			if(flag & MAlert.OK)
			{
				this._buttons.push(this.createButton(this._local.okLabel));
			}
			if(flag & MAlert.CANCEL)
			{
				this._buttons.push(this.createButton(this._local.cancelLabel));
			}
			if(flag & MAlert.YES)
			{
				this._buttons.push(this.createButton(this._local.yesLabel));
			}
			if(flag & MAlert.NO)
			{
				this._buttons.push(this.createButton(this._local.noLabel));
			}
			
			this._buttonBox = new MHBox();
			this.render();
		}
		
		private function render():void
		{
			for(var i:int = 0;i<this._buttons.length;i++)
			{
				var disp:DisplayObject = DisplayObject(this._buttons[i]);
				this._buttonBox.addChild(disp);
			}
			this.addChild(this._buttonBox);
		}
		
		override protected function updateView():void
		{
			super.updateView();
			this._buttonBox.centerToParent();
			this._buttonBox.y = this.height - this._buttonBox.height - 10; 
		}
		
		private function createButton(label:String):MUIComponent
		{
			var btn:MLabelButton = new MLabelButton();
			btn.text = label;
			return btn;
		}
		
	}
}