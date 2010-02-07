package com.terrynoya.common.control.sliderClasses
{
	import com.terrynoya.common.control.MButton;
	import com.terrynoya.common.core.MUIComponent;
	import com.terrynoya.common.events.MSliderEvent;
	import com.terrynoya.common.manager.MSkinManager;
	import com.terrynoya.common.util.MNumberUtil;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	[Event(name="change",type="com.terrynoya.common.events.MSliderEvent")]
	
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
		
		private var _isDragging:Boolean = false;
		
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
		
		public function get maximum():Number
		{
			return this._maximum;
		}
		
		public function set maximum(value:Number):void
		{
			if(this.maximum == value)
			{
				return;
			}
			this._maximum = value;
			this.updateView();
		}
		
		public function get minimun():Number
		{
			return this._minimum;
		}
		
		public function set minimun(value:Number):void
		{
			if(this.minimun == value)
			{
				return;
			}
			this._minimum = value;
			this.updateView();
		}
		
		public function set value(value:Number):void
		{
			if(this.maximum < value)
			{
				value = this.maximum;
			}
			else if(this.minimun > value)
			{
				value = this.minimun;;	
			}
			if(this._value == value)
			{
				return;
			}
			this._value = value;
			
			this.updateView();
			this.dispatchChangeEvent();
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
			
		private function updateView():void
		{
			if(this._isDragging)
			{
				return;
			}
			this._thumb.x = this.getXByValue(this._value);
			this._lstBarPoint = new Point(this._thumb.x, this._thumb.y);
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
			this._isDragging = true;
		}

		private function removeDragListener():void
		{
			this.stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			this.stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			this._isDragging = false;
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

			var value:Number = this.getValueByPos(point);
			
			if(this._value != value)
			{
				this._value = value;
				this.dispatchChangeEvent();
			}
		}

		protected function getValueByPos(point:Point):Number
		{
			var rlt:Number;
			var minX:Number = this._track.x - this._thumbOffsetX;
			var maxX:Number = this._track.width + this._track.x - this._thumbOffsetX;
			var totalX:Number = maxX + this._thumbOffsetX;
			var currentX:Number = point.x + this._thumbOffsetX;
			var v:Number = currentX / totalX * (this._maximum - this._minimum) + this._minimum;
			if(isNaN(this._snapInterval) || this._snapInterval <= 0)
			{
				rlt = v;
			}
			else if(this._snapInterval > 0 && this._snapInterval < 1)
			{
				var pow:Number = Math.pow(10, MNumberUtil.getPrecision(this._snapInterval));
				var snap:Number = _snapInterval * pow;
				var rounded:Number = Math.round(v * pow);
				var snapped:Number = Math.round(rounded / snap) * snap;
				var val:Number = snapped / pow;
				rlt = Math.max(this._minimum, Math.min(this._maximum, val));
			}
			else if(this._snapInterval >= 1)
			{
				v = Math.round((v - _minimum) / _snapInterval) * _snapInterval + this._minimum;
				rlt = v;
			}
			
			point.x = this.getXByValue(rlt);
			
			return rlt;
		}
		
		/**
         * value -> x
         * @private
         */
        private function getXByValue(value:Number):Number
        {
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
		
		private function dispatchChangeEvent():void
		{
			var evt:MSliderEvent = new MSliderEvent(MSliderEvent.CHANGE,this._value);
			this.dispatchEvent(evt);
		}
	}
}
