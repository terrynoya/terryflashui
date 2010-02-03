package com.terrynoya.common.control.scrollClasses
{
	import com.terrynoya.common.control.MButton;
	import com.terrynoya.common.core.MUIComponent;
	import com.terrynoya.common.events.MScrollEvent;
	import com.terrynoya.common.skins.halo.scrollSkin.MScrollDownArrowSkin;
	import com.terrynoya.common.skins.halo.scrollSkin.MScrollThumbSkin;
	import com.terrynoya.common.skins.halo.scrollSkin.MScrollTrackSkin;
	import com.terrynoya.common.skins.halo.scrollSkin.MScrollUpArrowSkin;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	[Event(name="scroll",type="com.terrynoya.common.events.MScrollEvent")]
	
	public class MScrollBar extends MUIComponent
	{
		protected var upArrow:MButton;

		protected var downArrow:MButton;

		protected var track:MButton;

		protected var thumb:MButton;

		private var _minimun:Number;

		private var _maximun:Number;
		
		private var _direction:String;
		
		private var _mousedownPoint:Point;

		private var _lstBarPoint:Point;

		private var _offsetPoint:Point;

		private var _pageSize:Number=10;
		
		private var _value:Number = 0;
		
		private var _snapInterval:Number = 1;
		
		public function MScrollBar()
		{
			super();
			this.addListeners();
			this._lstBarPoint=new Point(0, 0);
			this._minimun=1;
			this._maximun=70;
			this._pageSize=40;
		}
		
		public function scrollPosition():Number
		{
			return this._value;
		}
		
		public function get direction():String
		{
			return this._direction;
		}
		
		public function set direction(value:String):void
		{
			this._direction = value; 
		}
		
		public function set pageSize(value:Number):void
		{
			if(value == 0 || value == this.pageSize)
			{
				return;
			}
			this._pageSize = value;
			
			this.updateView();
		}
		
		public function get pageSize():Number
		{
			return this._pageSize;
		}
		
		override protected function createChildren():void
		{
			this.upArrow=new MButton();
			this.upArrow.buttonSkin=new MScrollUpArrowSkin();

			this.downArrow=new MButton();
			this.downArrow.buttonSkin=new MScrollDownArrowSkin();

			this.track=new MButton();
			this.track.buttonSkin=new MScrollTrackSkin();

			this.thumb=new MButton();
			this.thumb.buttonSkin=new MScrollThumbSkin();

			this.addChild(this.upArrow);
			this.addChild(this.downArrow);
			this.addChild(this.track);
			this.addChild(this.thumb);

			
		}

		public function set maximum(value:Number):void
		{
			if (this._minimun > value)
			{
				return;
			}
			this._maximun=value;
			
			this.updateView();
		}

		public function get maximum():Number
		{
			return this._maximun;
		}

		public function set minimun(value:Number):void
		{
			if (this._maximun < value)
			{
				return;
			}
			this._minimun=value;
			
			this.updateView();
		}


		public function get minimun():Number
		{
			return this._minimun;
		}

		override public function set width(value:Number):void
		{
			
		}
		
		private function updateView():void
		{
			var totalpage:Number=Math.round((this._maximun - this.minimun) / this._pageSize);
			this.thumb.height=this.track.height / totalpage;
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
			var p:Point=this.globalToLocal(new Point(e.stageX, e.stageY));
			var dp:Point=p.subtract(this._mousedownPoint);

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
			
			var val:Number = this.getColByY();
			
			if(val != this._value)
			{
				this._value = val;
				var evt:MScrollEvent = new MScrollEvent(MScrollEvent.SCROLL,val,this.direction);
				this.dispatchEvent(evt);
			}
		}
		
		
		private function getColByY():Number
		{
			var offsetX:Number = thumb.y - this.track.y;
			var val:Number = offsetX / this.track.height * (this.maximum - this.minimun);
			return val;
		}

		private function onThumbUp(e:MouseEvent):void
		{
			this.removeThumbDragListener();
			this._lstBarPoint=new Point(this.thumb.x, this.thumb.y);
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