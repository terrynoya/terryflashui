package com.terrynoya.common.control
{
    import com.terrynoya.common.events.MCheckBoxEvent;
    import com.terrynoya.common.manager.MSkinManager;
    import com.terrynoya.common.skins.halo.MCheckBoxSkin;
    
    import flash.display.DisplayObject;
    import flash.events.MouseEvent;
    import flash.text.TextFormat;
	
	
	
	[Event(name="change",type="com.terrynoya.common.events.MCheckBoxEvent")]
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
        
        override public function set width(value:Number):void
        {
        	
        }
        
        override public function set height(value:Number):void
        {
        	
        }
        
        /**
         * 设置Label的宽度
         */
        public function set labelWidth(value:Number):void
        {
        	this._label.width = value;
        	this.updateView();
        }
        
        public function set textFormat(value:TextFormat):void
		{
			this._label.textFormat = value;	
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
            var evt:MCheckBoxEvent = new MCheckBoxEvent(MCheckBoxEvent.CHANGE,this.checked);
            this.dispatchEvent(evt);
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