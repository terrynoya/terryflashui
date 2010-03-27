package com.terrynoya.common.control
{
    import com.terrynoya.common.manager.MSkinManager;
    import com.terrynoya.common.skins.halo.MCheckBoxSkin;

    import flash.display.DisplayObject;
    import flash.events.MouseEvent;

    /**
     * 
     * @author TerryYao
     */
    public class MCheckBox extends MButton
    {
        private var _ischecked:Boolean;

        private var _label:MLabel;

        private var _gap:Number = 20;

        /**
         * 
         */
        public function MCheckBox()
        {
            super();
            this.addEventListener(MouseEvent.CLICK, onClick);
        }


        /**
         * 按钮和文字之间的间隔
         * @param value
         */
        public function set gap(value:Number):void
        {
            this._gap = value;
        }

        /**
         * 设置文字
         * @return 
         */
        public function get text():String
        {
            return this._label.text;
        }

        /**
         * 
         * @param value
         */
        public function set text(value:String):void
        {
            this._label.text = value;
            this.updateView();
        }

        /**
         * 是否打钩
         * @return 
         */
        public function get checked():Boolean
        {
            return this._ischecked;
        }

        /**
         * 
         * @param value
         */
        public function set checked(value:Boolean):void
        {
            this._ischecked = value;
        }

        override protected function createChildren():void
        {
            super.createChildren();
            this._label = new MLabel();
            this.addChild(this._label);
        }

        override protected function createSkin():void
        {
            this.skin = MSkinManager.checkBoxSkin;
        }

        private function toggle():void
        {
            this.checked = !this.checked;
            this.updateView();
        }

        private function onClick(e:MouseEvent):void
        {
            this.toggle();
        }

        override protected function getSkinByPhase(phase:String):DisplayObject
        {
            if (this.checked)
            {
                return MCheckBoxSkin(this.skin).selectedSkin;
            }
            return super.getSkinByPhase(phase);
        }

        override protected function updateView():void
        {
            super.updateView();
            this._label.x = this.currentSkin.x + 20;
            this._label.y = (this.currentSkin.height - this._label.height) / 2;
        }

    }
}