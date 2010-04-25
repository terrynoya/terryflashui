package com.terrynoya.common.control.scrollClasses
{
	import com.terrynoya.common.control.MButton;
	import com.terrynoya.common.core.MSkinableComponent;
	import com.terrynoya.common.events.MScrollEvent;
	import com.terrynoya.common.skins.halo.scrollSkin.MScrollDownArrowSkin;
	import com.terrynoya.common.skins.halo.scrollSkin.MScrollThumbSkin;
	import com.terrynoya.common.skins.halo.scrollSkin.MScrollTrackSkin;
	import com.terrynoya.common.skins.halo.scrollSkin.MScrollUpArrowSkin;
	import com.terrynoya.common.util.MNumberUtil;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;

	[Event(name="scroll", type="com.terrynoya.common.events.MScrollEvent")]

	/**
	 * 滚动条
	 * @author TerryYao
	 */
	public class MScrollBar extends MSkinableComponent
	{
		/**
		 * 向上箭头
		 * @default
		 */
		protected var upArrow:MButton;

		/**
		 * 向下箭头
		 * @default
		 */
		protected var downArrow:MButton;

		/**
		 * 轨道
		 * @default
		 */
		protected var track:MSkinableComponent;

		/**
		 * 拖动块
		 * @default
		 */
		protected var thumb:MButton;

		private var _minimun:Number=0;

		private var _maximun:Number=10;

		private var _direction:String;

		private var _mousedownPoint:Point;

		private var _lstBarPoint:Point;

		private var _offsetPoint:Point;

		private var _pageSize:Number=5;

		private var _value:Number=0;

		private var _snapInterval:Number;

		/**
		 *
		 */
		public function MScrollBar()
		{
			super();
			this.addListeners();
			this._lstBarPoint=new Point(0, 0);
		}

		/**
		 *
		 * @return
		 */
		public function get scrollPosition():Number
		{
			return this._value;
		}

		/**
		 *
		 * @param value
		 */
		public function set scrollPosition(value:Number):void
		{
			if (this.maximum < value)
			{
				value = this.maximum;
			}
			else if (this.minimun > value)
			{
				value = this.minimun;
				;
			}
			if (this._value == value)
			{
				return;
			}
			this.value = value;

			this.thumb.y = getXByValue(this._value);
			this._lstBarPoint=new Point(this.thumb.x, this.thumb.y);
		}

		/**
		 *
		 * @return
		 */
		public function get direction():String
		{
			return this._direction;
		}

		/**
		 *
		 * @return
		 */
		public function get snapInerval():Number
		{
			return this._snapInterval;
		}

		/**
		 *
		 * @param value
		 */
		public function set snapInerval(value:Number):void
		{
			this._snapInterval=value;
		}

		/**
		 *
		 * @param value
		 */
		public function set direction(value:String):void
		{
			this._direction=value;
		}

		/**
		 *
		 * @param value
		 */
		public function set pageSize(value:Number):void
		{
			if(value <= 0)
			{
				value = 1;
			}
			else if(value > this._maximun)
			{
				value = this._maximun;
			}
			else if (value == this.pageSize)
			{
				return;
			}
			this._pageSize=value;
			this.updateView();
		}

		/**
		 *
		 * @return
		 */
		public function get pageSize():Number
		{
			return this._pageSize;
		}

		override protected function createChildren():void
		{
			this.upArrow=new MButton();
			this.upArrow.skin=new MScrollUpArrowSkin();

			this.downArrow=new MButton();
			this.downArrow.skin=new MScrollDownArrowSkin();

			this.track=new MButton();
			this.track.skin = new MScrollTrackSkin();

			this.thumb=new MButton();
			this.thumb.skin=new MScrollThumbSkin();
			this.thumb.minHeight=20;
			this.addChild(this.upArrow);
			this.addChild(this.downArrow);
			this.addChild(this.track);
			this.addChild(this.thumb);

		}

		/**
		 *
		 * @param value
		 */
		public function set maximum(value:Number):void
		{
			if (this._minimun == value)
			{
				return;
			}
			this._maximun=value;

			if (this.scrollPosition > value)
			{
				this.scrollPosition = value;
			}

			this.updateView();
		}

		/**
		 *
		 * @return
		 */
		public function get maximum():Number
		{
			return this._maximun;
		}

		/**
		 *
		 * @param value
		 */
		public function set minimun(value:Number):void
		{
			if (this._maximun == value)
			{
				return;
			}
			this._minimun=value;

			if (this.scrollPosition < value)
			{
				this.scrollPosition = value;
			}

			this.updateView();
		}

		/**
		 *
		 * @return
		 */
		public function get minimun():Number
		{
			return this._minimun;
		}

		override public function set width(value:Number):void
		{

		}

		override protected function updateView():void
		{
			super.updateView();

			if (this.maximum <= 0 || this.pageSize >= this.maximum)
			{
				this.enabled = false;
				return;
			}
			
			var totalpage:Number=Math.ceil((this._maximun - this.minimun) / this._pageSize);

			var th:Number=this.track.height / totalpage;
			
			if (th < this.thumb.minHeight)
			{
				th=this.thumb.minHeight;
			}
			
			this.thumb.height=th;
		}
		
		override public function set enabled(value:Boolean):void
		{
			super.enabled = value;
			
			this.thumb.visible=value;
			this.upArrow.enabled = value;
			this.downArrow.enabled = value;
			if(value)
			{
				this.addListeners();
			}
			else
			{
				this.removeListeners();
			}
		}

		override public function set height(value:Number):void
		{
			this.track.height=value - this.upArrow.height - this.downArrow.height;
			this.layoutUI();
			this.updateView();
		}

		private function addListeners():void
		{
			this.thumb.addEventListener(MouseEvent.MOUSE_DOWN, onThumbPressHandler);
			this.track.addEventListener(MouseEvent.MOUSE_DOWN,onTrackMouseDown);
		}
		
		private function removeListeners():void
		{
			this.thumb.removeEventListener(MouseEvent.MOUSE_DOWN, onThumbPressHandler);
			this.track.removeEventListener(MouseEvent.MOUSE_DOWN,onTrackMouseDown);
		}

		private function onThumbPressHandler(e:MouseEvent):void
		{
			this._mousedownPoint=this.globalToLocal(new Point(e.stageX, e.stageY));
			this.addThumbDragListener();
		}

		private function addThumbDragListener():void
		{
			this.stage.addEventListener(MouseEvent.MOUSE_MOVE, onThumbMove);
			this.stage.addEventListener(MouseEvent.MOUSE_UP, onThumbUp);
		}

		private function removeThumbDragListener():void
		{
			this.stage.removeEventListener(MouseEvent.MOUSE_MOVE, onThumbMove);
			this.stage.removeEventListener(MouseEvent.MOUSE_UP, onThumbUp);
		}

		private function onThumbMove(e:MouseEvent):void
		{
			//当前鼠标的位置
			var p:Point=this.globalToLocal(new Point(e.stageX, e.stageY));
			
			//当前鼠标位置和鼠标按下时的差值
			var dp:Point=p.subtract(this._mousedownPoint);
			
			//和鼠标移动的位置对应的拖动条的位置
			var ty:Number=dp.y + this._lstBarPoint.y;
			
			var maxlen:Number=this.track.height + this.track.y - this.thumb.height;

			if (ty < this.track.y)
			{
				ty=this.track.y;
			}
			else if (ty > maxlen)
			{
				ty=maxlen;
			}
			
			this.thumb.y=ty;

			var val:Number=this.getValueByPos();

			this.value = val;
		}
		
		private function set value(value:Number):void
		{
			if (value == this._value)
			{
				return;		
			}
			this._value = value;
			var evt:MScrollEvent=new MScrollEvent(MScrollEvent.SCROLL, value, this.direction);
			this.dispatchEvent(evt);
		}

		private function getValueByPos():Number
		{
			var offsetX:Number=thumb.y - this.track.y;
			var val:Number=offsetX / (this.track.height - this.thumb.height) * (this.maximum - this.minimun);
			var rlt:Number=val + this.minimun;
			
			//calulate snapInterval
			if (isNaN(this._snapInterval) || this._snapInterval <= 0)
			{
				return rlt;
			}
			else if (this._snapInterval > 0 && this._snapInterval < 1)
			{
				var pow:Number=Math.pow(10, MNumberUtil.getPrecision(this._snapInterval));
				var snap:Number=_snapInterval * pow;
				var rounded:Number=Math.round(rlt * pow);
				var snapped:Number=Math.round(rounded / snap) * snap;
				var v:Number=snapped / pow;
				rlt=Math.max(this._minimun, Math.min(this._maximun, v));
			}
			else if (this._snapInterval >= 1)
			{
				rlt=Math.round((rlt - this._minimun) / _snapInterval) * _snapInterval + this._minimun;
			}
			return rlt;
		}

		/**
		 * value -> x
		 * @private
		 */
		private function getXByValue(value:Number):Number
		{
			var offsetY:Number = (value - this.minimun) * (this.track.height - this.thumb.height) / (this.maximum - this.minimun);
			var y:Number = offsetY + this.track.y;
			return y;
		}

		private function onThumbUp(e:MouseEvent):void
		{
			this.removeThumbDragListener();
			this._lstBarPoint=new Point(this.thumb.x, this.thumb.y);
		}

		private function onTrackMouseDown(e:MouseEvent):void
		{
			var thumbPoint:Point = this.track.globalToLocal(new Point(this.thumb.x,this.thumb.y));
			var mousePoint:Point = new Point(e.localX,e.localY);
			var flipPageDown:int = mousePoint.subtract(thumbPoint).y < 0 ? -1:1;
			this.scrollPosition += flipPageDown * this.pageSize;
		}

		private function layoutUI():void
		{
			this.track.y=this.upArrow.height;
			this.downArrow.y=this.track.y + this.track.height;
			this.thumb.y=this.track.y;
			this._lstBarPoint=new Point(this.thumb.x, this.thumb.y);
		}
	}
}