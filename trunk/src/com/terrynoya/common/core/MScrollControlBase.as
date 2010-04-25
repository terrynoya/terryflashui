package com.terrynoya.common.core
{
	import com.terrynoya.common.control.MHScrollBar;
	import com.terrynoya.common.control.MVScrollBar;
	import com.terrynoya.common.control.scrollClasses.MScrollBarPolicy;
	import com.terrynoya.common.events.MScrollEvent;
	
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	
	/**
	 * 
	 * @author TerryYao
	 */
	public class MScrollControlBase extends MUIComponent
	{
		private var vScrollBar:MVScrollBar;
		
		private var hScrollBar:MHScrollBar;
		
		/**
		 * 纵向滚动策略
		 * @default 
		 */
		protected var _vScrollPolicy:String = MScrollBarPolicy.AUTO;
		
		/**
		 * 横向滚动策略
		 * @default 
		 */
		protected var _hScrollPolicy:String = MScrollBarPolicy.OFF;
		
		/**
		 * 
		 * @default 
		 */
		protected var maskShape:Shape;
		
		private var _visualWidth:Number = 100;
		
		private var _visualHeight:Number = 100;
		
		private var _vScroll_Maximum:Number;
		
		private var _vScroll_pageSize:Number;
		
		/**
		 * 
		 * @param w
		 * @param h
		 */
		public function MScrollControlBase(w:Number,h:Number)
		{
			super();
			this.addListeners();
			this.width = w; 
			this.height = h;
		} 
		
		
		/**
		 * 
		 * @param value
		 */
		public function set vScrollPolicy(value:String):void
		{
			this._vScrollPolicy = value;	
			this.vScrollBar.visible = this.vScrollShouldVisible;
		}
		
		/**
		 * 
		 * @param value
		 */
		public function set hScrollPolicy(value:String):void
		{
			this._hScrollPolicy = value;	
			this.hScrollBar.visible = this.hScrollShouldVisible;
		}
		
		/**
		 * 
		 * @param value
		 */
		protected function set vScroll_Maximum(value:Number):void
		{
			this.vScrollBar.maximum = value;		
		}
		
		/**
		 * 
		 * @param value
		 */
		protected function set vScroll_pageSize(value:Number):void
		{
			this.vScrollBar.pageSize = value;		
		}
		
		/**
		 * 
		 * @param value
		 */
		protected function set vScroll_snapInerval(value:Number):void
		{
			this.vScrollBar.snapInerval = value;	
		}
		
		/**
		 * 
		 * @return 
		 */
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
		
		/**
		 * 
		 * @param e
		 */
		protected function onMouseWheel(e:MouseEvent):void
		{
			var direction:int = e.delta > 0 ? -1 : 1;
			this.vScrollBar.scrollPosition = this.vScrollBar.snapInerval * direction;
			this.updateView();
		}
		
		/**
		 * 
		 * @param e
		 */
		protected function scrollHandler(e:MScrollEvent):void
		{
			this.updateView();
		}
		
		/**
		 * 
		 * @param w
		 * @param h
		 */
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
		
		/**
		 * 
		 */
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
			return this._vScrollPolicy == MScrollBarPolicy.ON ||
				(this._vScrollPolicy == MScrollBarPolicy.AUTO && this.vScrollBar.maximum > 0);
		}
		
		private function get hScrollShouldVisible():Boolean
		{
			return this._hScrollPolicy == MScrollBarPolicy.ON ||
				(this._hScrollPolicy == MScrollBarPolicy.AUTO && this.vScrollBar.maximum > 0);
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
