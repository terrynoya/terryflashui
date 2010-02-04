package com.terrynoya.common.control.sliderClasses
{
	import com.terrynoya.common.control.MButton;
	import com.terrynoya.common.core.MUIComponent;
	import com.terrynoya.common.util.MNumberUtil;
	import com.terrynoya.manager.MSkinManager;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	public class MSlider extends MUIComponent
	{
		private var _thumb:MButton;
		private var _track:DisplayObject;

		private var _mouseDownPoint:Point;
		private var _offsetPoint:Point;
		private var _lstBarPoint:Point;

		private var _thumbOffsetX:Number = 6;

		private var _minimum:Number = 0;

		private var _maximum:Number = 10;

		protected var direction:String;

		private var _snapInterval:Number = 0;

		private var _value:Number = 0;

		public function MSlider()
		{
			super();
		}
		
		public function get snapInterval():Number
		{
			return this._snapInterval;
		}
		
		public function set snapInterval(value:Number):void
		{
			this._snapInterval = value;
		}
		
		override protected function createChildren():void
		{
			this._track = MSkinManager.sliderTrackSkin;
			this.addChild(this._track);

			this._thumb = new MButton();
			this._thumb.buttonSkin = MSkinManager.sliderThumbSkin;
			this.addChild(this._thumb);

			this._lstBarPoint = new Point(0,0);

			this.addListeners();
		}

		private function addListeners():void
		{
			this._thumb.addEventListener(MouseEvent.MOUSE_DOWN, onThumbPressHandler);

		}

		private function onThumbPressHandler(e:MouseEvent):void
		{
			this._mouseDownPoint = this.globalToLocal(new Point(e.stageX, e.stageY));
			this.addDragListener();
		}

		private function addDragListener():void
		{
			this.stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			this.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}

		private function removeDragListener():void
		{
			this.stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			this.stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}

		private function onMouseMove(e:MouseEvent):void
		{
			var p:Point = this.globalToLocal(new Point(e.stageX,e.stageY));
			var dp:Point = p.subtract(this._mouseDownPoint);

			this._offsetPoint = dp;

			var dx:Number = this._lstBarPoint.x + this._offsetPoint.x;

			this._thumb.x = this._offsetPoint.x + this._lstBarPoint.x;

			var point:Point = new Point(this._thumb.x, this._thumb.y);

			if(point.x < -_thumbOffsetX)
			{
				point.x = -_thumbOffsetX;
			}
			else if(point.x > this._track.width - _thumbOffsetX)
			{
				point.x = this._track.width - _thumbOffsetX;
			}

			this._thumb.x = point.x;

			this.getValueByPos();

		}

		protected function getValueByPos():void
		{
			var minX:Number = this._track.x - this._thumbOffsetX;
			var maxX:Number = this._track.width + this._track.x - this._thumbOffsetX;
			var totalX:Number = maxX + this._thumbOffsetX;
			var currentX:Number = this._thumb.x + this._thumbOffsetX;
			var v:Number = currentX / totalX * (this._maximum - this._minimum) + this._minimum;
			if(isNaN(this._snapInterval) || this._snapInterval <= 0)
			{
				this._value = v;
			}
			else if(this._snapInterval > 0 && this._snapInterval < 1)
			{
				var pow:Number = Math.pow(10, MNumberUtil.getPrecision(this._snapInterval));
				var snap:Number = _snapInterval * pow;
				var rounded:Number = Math.round(v * pow);
				var snapped:Number = Math.round(rounded / snap) * snap;
				var val:Number = snapped / pow;
				_value = Math.max(this._minimum, Math.min(this._maximum, val));
			}
			else if(this._snapInterval >= 1)
			{
				v = Math.round((v - _minimum) / _snapInterval) * _snapInterval + this._minimum;
				this._value = v;
			}

			this._thumb.x = this.getXByValue(this._value);
			
			trace(this._value);
		}
		
		/**
         * value -> x
         * @private
         */
        private function getXByValue(value:Number):Number
        {
            if (value > this._maximum)
            {
                this._value = value = this._maximum;

            }
            else if (value < this._minimum)
            {
                this._value = value = this._minimum;
            }

            var minX:Number = this._track.x - this._thumbOffsetX;
			var maxX:Number = this._track.width + this._track.x - this._thumbOffsetX;
			var totalX:Number = maxX + this._thumbOffsetX;
			var currentX:Number = (value - this._minimum) * totalX / (this._maximum - this._minimum);
            return currentX - this._track.x - this._thumbOffsetX;
        }

		private function onMouseUp(e:MouseEvent):void
		{
			this.removeDragListener();
			this._lstBarPoint = new Point(this._thumb.x, this._thumb.y);
		}
	}
}
