package com.terrynoya.common.core
{
	import com.terrynoya.common.control.MHScrollBar;
	import com.terrynoya.common.control.MVScrollBar;
	import com.terrynoya.common.control.scrollClasses.MScrollBarPolicy;
	import com.terrynoya.common.events.MScrollEvent;
	
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	
	public class MScrollControlBase extends MUIComponent
	{
		private var vScrollBar:MVScrollBar;
		
		private var hScrollBar:MHScrollBar;
		
		protected var vScrollPolicy:String = MScrollBarPolicy.AUTO;
		
		protected var hScrollPolicy:String = MScrollBarPolicy.OFF;
		
		protected var maskShape:Shape;
		
		private var _visualWidth:Number = 100;
		
		private var _visualHeight:Number = 100;
		
		private var _vScroll_Maximum:Number;
		
		private var _vScroll_pageSize:Number;
		
		public function MScrollControlBase()
		{
			super();
			this.addListeners();
		} 
		
		protected function set vScroll_Maximum(value:Number):void
		{
			this.vScrollBar.maximum = value;		
		}
		
		protected function set vScroll_pageSize(value:Number):void
		{
			this.vScrollBar.pageSize = value;		
		}
		
		protected function set vScroll_snapInerval(value:Number):void
		{
			this.vScrollBar.snapInerval = value;	
		}
		
		protected function get vScroll_scrollPosition():Number
		{
			return this.vScrollBar.scrollPosition;	
		}
			
		override public function set width(value:Number) : void
		{
			this._visualWidth = value;
			this.layoutBar(this.width,this.height);
		}
		
		override public function set height(value:Number) : void
		{
			this._visualHeight = value;
			this.layoutBar(this.width,this.height);
		}
		
		override public function get width() :Number
		{
			return this._visualWidth;
		}
		
		override public function get height() :Number
		{
			return this._visualHeight;
		}
		
		override protected function createChildren() : void
		{
			
			maskShape = new Shape();
			maskShape.name = "mask";
			this.updateMsk(100, 100);
			this.addChild(maskShape);
			
			this.vScrollBar = new MVScrollBar();
			this.hScrollBar = new MHScrollBar();
			this.addChild(this.vScrollBar);
			this.addChild(this.hScrollBar);
			
		}
		
		private function addListeners():void
		{
			this.vScrollBar.addEventListener(MScrollEvent.SCROLL,scrollHandler);
			this.hScrollBar.addEventListener(MScrollEvent.SCROLL,scrollHandler);
			this.addEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel);
		}
		
		
		private function removeListeners():void
		{
			this.vScrollBar.removeEventListener(MScrollEvent.SCROLL,scrollHandler);
			this.hScrollBar.removeEventListener(MScrollEvent.SCROLL,scrollHandler);
			this.removeEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel);
		}
		
		protected function onMouseWheel(e:MouseEvent):void
		{
			var direction:int = e.delta > 0 ? -1 : 1;
			this.vScrollBar.scrollPosition = this.vScrollBar.snapInerval * direction;
			this.updateView();
		}
		
		protected function scrollHandler(e:MScrollEvent):void
		{
			this.updateView();
		}
		
		protected function layoutBar(w:Number,h:Number):void
		{
			
			this.updateScrollVisible();
			if(this.vScrollShouldVisible && this.hScrollShouldVisible)
			{
				w -= this.vScrollBar.width;	
				h -= this.vScrollBar.width;
			}
			
			this.vScrollBar.height = h;
			this.hScrollBar.width = w; 
			
			this.vScrollBar.x = w;
			this.hScrollBar.y = h;
			
			this.updateMsk(w,h);
		}
		
		protected function updateScrollVisible():void
		{
			this.vScrollBar.visible = this.vScrollShouldVisible;
			this.hScrollBar.visible = this.hScrollShouldVisible;
		}
		
		/**
		 *	ON始终可见
		 *  AUTO当最大滚动距离大于可视距离时可见
		 *  OFF永远不可见
		 */
		private function get vScrollShouldVisible():Boolean
		{
			return this.vScrollPolicy == MScrollBarPolicy.ON ||
				(this.vScrollPolicy == MScrollBarPolicy.AUTO && this.vScrollBar.maximum > 0);
		}
		
		private function get hScrollShouldVisible():Boolean
		{
			return this.hScrollPolicy == MScrollBarPolicy.ON ||
				(this.hScrollPolicy == MScrollBarPolicy.AUTO && this.vScrollBar.maximum > 0);
		}
		
		private function updateMsk(w:Number, h:Number):void
		{
			var g:Graphics = maskShape.graphics;
			g.clear();
			g.beginFill(0xFFFFFF);
			g.drawRect(0, 0, w, h);
			g.endFill();
		}
	}
}
