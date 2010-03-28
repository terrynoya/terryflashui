package com.terrynoya.common.control
{
    import com.terrynoya.common.core.MButtonPhase;
    import com.terrynoya.common.core.MSkinableComponent;
    import com.terrynoya.common.events.MButtonEvent;
    import com.terrynoya.common.manager.MSkinManager;
    import com.terrynoya.common.skins.halo.MButtonSkin;

    import flash.display.DisplayObject;
    import flash.events.MouseEvent;

    [Event(name="button_down", type="com.terrynoya.common.events.MButtonEvent")]

    [Event(name="button_over", type="com.terrynoya.common.events.MButtonEvent")]

    [Event(name="button_click", type="com.terrynoya.common.events.MButtonEvent")]

    /**
     *
     * @author TerryYao
     */
    public class MButton extends MSkinableComponent
    {
        private var _buttnPhase:String = MButtonPhase.UP;

        private var _currentSkin:DisplayObject;

        private var _isMouseOver:Boolean = false;

        /**
         *
         */
        public function MButton()
        {
            super();
            this.addEventListener(MouseEvent.ROLL_OVER, onRollOver);
            this.addEventListener(MouseEvent.ROLL_OUT, onRollOut);
            this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
            this.addEventListener(MouseEvent.CLICK, onMouseClick);

        }

        /**
         * @private
         */
        override public function set width(value:Number):void
        {
            this.skin.width = value;
            this.updateView();
        }

        /**
         * @private
         */
        override public function set height(value:Number):void
        {
            this._currentSkin.height = value;
        }

        /**
         * @private
         */
        override protected function createSkin():void
        {
            this.skin = MSkinManager.buttonSkin;
        }

        /**
         * @private
         */
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

        /**
         *
         * @return
         */
        protected function get currentSkin():DisplayObject
        {
            return this._currentSkin;
        }

        /**
         *
         * @param phase
         * @return
         */
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
            this._isMouseOver = true;

            var evt:MButtonEvent = new MButtonEvent(MButtonEvent.BUTTON_OVER);
            this.dispatchEvent(evt);
        }

        private function onRollOut(e:MouseEvent):void
        {
            this.phase = MButtonPhase.UP;
            this._isMouseOver = false;

            var evt:MButtonEvent = new MButtonEvent(MButtonEvent.BUTTON_OUT);
            this.dispatchEvent(evt);
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

        private function onMouseClick(e:MouseEvent):void
        {
            var evt:MButtonEvent = new MButtonEvent(MButtonEvent.BUTTON_CLICK);
            this.dispatchEvent(evt);
        }

        private function getphase():String
        {
            return this._buttnPhase;
        }

        private function onMouseDown(e:MouseEvent):void
        {
            this.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
            this.phase = MButtonPhase.DOWN;

            var evt:MButtonEvent = new MButtonEvent(MButtonEvent.BUTTON_DOWN);
            this.dispatchEvent(evt);
        }

        private function onMouseUp(e:MouseEvent):void
        {
            this.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
            this.phase = this._isMouseOver ? MButtonPhase.OVER : MButtonPhase.UP;
        }

    }
}