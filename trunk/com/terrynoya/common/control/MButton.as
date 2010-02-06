package com.terrynoya.common.control
{
	import com.terrynoya.common.core.MButtonPhase;
	import com.terrynoya.common.core.MUIComponent;
	import com.terrynoya.common.skins.halo.MButtonSkin;
	import com.terrynoya.common.manager.MSkinManager;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;

	public class MButton extends MUIComponent
	{
		private var _buttnPhase:String;
		private var _buttonSkin:MButtonSkin;
		private var _currentSkin:DisplayObject;

		public function MButton()
		{
			super();
			this.addEventListener(MouseEvent.ROLL_OVER,onRollOver);
			this.addEventListener(MouseEvent.ROLL_OUT,onRollOut);
			this.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			this.phase=MButtonPhase.UP;
		}
		
		override public function set width(value:Number):void
		{
			this._buttonSkin.width = value;
		} 
		
		override public function set height(value:Number):void
		{
			this._buttonSkin.height = value;
		} 
		
		private function onRollOver(e:MouseEvent):void
		{
			this.phase=MButtonPhase.OVER;
		}

		private function onRollOut(e:MouseEvent):void
		{
			this.phase=MButtonPhase.UP;
		}

		private function set phase(value:String):void
		{
			if(value == this.getphase())
			{
				return;
			}
			this._buttnPhase=value;
			this.updateSkin();
		}

		private function getphase():String
		{
			return this._buttnPhase;

		}

		private function onMouseDown(e:MouseEvent):void
		{
			this.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			this.phase=MButtonPhase.DOWN;
		}

		private function onMouseUp(e:MouseEvent):void
		{
			this.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			this.phase=MButtonPhase.UP;
		}

		protected function updateSkin():void
		{
			var skin:DisplayObject
			if(null == this._currentSkin)
			{
				skin=this.buttonSkin.upSkin;
				this.addChild(skin);
				this._currentSkin=skin;
			}
			else
			{
				this.removeChild(this._currentSkin);
				skin=this.getSkinByPhase(this.getphase());
				this.addChild(skin);
				this._currentSkin=skin;
			}

		}

		public function get buttonSkin():MButtonSkin
		{
			var skin:MButtonSkin;
			if(null == this._buttonSkin)
			{
				skin=MSkinManager.buttonSkin;
				this._buttonSkin=skin;
			}
			else
			{
				return skin=this._buttonSkin;
			}
			return skin;
		}
		
		public function set buttonSkin(value:MButtonSkin):void
		{
			this._buttonSkin = value;
			this.updateSkin();
		} 
 
		protected function getSkinByPhase(phase:String):DisplayObject
		{
			var rlt:DisplayObject;
			switch(phase)
			{
				case MButtonPhase.UP:
					rlt=this._buttonSkin.upSkin;
					break;
				case MButtonPhase.OVER:
					rlt=this._buttonSkin.overSkin;
					break;
				case MButtonPhase.DOWN:
					rlt=this._buttonSkin.downSkin;
					break;
				case MButtonPhase.DISABLED:
					rlt=this._buttonSkin.disabledSkin;
					break;
			}

			return rlt;
		}
	}
}