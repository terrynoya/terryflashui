package com.terrynoya.common.control
{
    import com.terrynoya.common.core.MButtonPhase;
    import com.terrynoya.common.core.MSkinableComponent;
    import com.terrynoya.common.manager.MSkinManager;
    import com.terrynoya.common.skins.halo.MButtonSkin;
    
    import flash.display.DisplayObject;
    import flash.events.MouseEvent;

    public class MButton extends MSkinableComponent
    {
        private var _buttnPhase:String = MButtonPhase.UP;
        private var _currentSkin:DisplayObject;
		
        public function MButton()
        {
            super();
            this.addEventListener(MouseEvent.ROLL_OVER, onRollOver);
            this.addEventListener(MouseEvent.ROLL_OUT, onRollOut);
            this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
//            this.phase = MButtonPhase.UP;
        }

        override public function set width(value:Number):void
        {
			this._currentSkin.width = value;
        }
		
        override public function set height(value:Number):void
        {
			this._currentSkin.height = value;
        }
		
		override protected function createSkin() : void
		{
			this.skin = MSkinManager.buttonSkin; 	
		}
		 
		override protected function updateView():void
		{
			super.updateView();
			
			var skin:DisplayObject
			
			if (null == this._currentSkin)
			{
				skin = this.buttonSkin.upSkin;
				this.addChild(skin);
				this._currentSkin = skin;
			}
			else
			{
				this.removeChild(this._currentSkin);
				skin = this.getSkinByPhase(this.getphase());
				this.addChild(skin);
				this._currentSkin = skin;
			}
		}
		
		private function get buttonSkin():MButtonSkin
		{
			return MButtonSkin(this.skin);
		}
		
		private function set buttonSkin(value:MButtonSkin):void
		{
			this.skin = value;
		}
		
		protected function get currentSkin():DisplayObject
		{
			return this._currentSkin;
		}
		
		protected function getSkinByPhase(phase:String):DisplayObject
		{
			var rlt:DisplayObject;
			switch (phase)
			{
				case MButtonPhase.UP:
					rlt = this.buttonSkin.upSkin;
					break;
				case MButtonPhase.OVER:
					rlt = this.buttonSkin.overSkin;
					break;
				case MButtonPhase.DOWN:
					rlt = this.buttonSkin.downSkin;
					break;
				case MButtonPhase.DISABLED:
					rlt = this.buttonSkin.disabledSkin;
					break;
			} 
			
			return rlt;
		}

        private function onRollOver(e:MouseEvent):void
        {
            this.phase = MButtonPhase.OVER;
        }

        private function onRollOut(e:MouseEvent):void
        {
            this.phase = MButtonPhase.UP;
        }

        private function set phase(value:String):void
        {
            if (value == this.getphase())
            {
                return;
            }
            this._buttnPhase = value;
            this.updateView();
        }

        private function getphase():String
        {
            return this._buttnPhase;
        }

        private function onMouseDown(e:MouseEvent):void
        {
            this.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
            this.phase = MButtonPhase.DOWN;
        }

        private function onMouseUp(e:MouseEvent):void
        {
            this.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
            this.phase = MButtonPhase.UP;
        }

    }
}