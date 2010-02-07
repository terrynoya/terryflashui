package com.terrynoya.common.control.listClasses
{
	import com.terrynoya.common.core.IMItemRenderer;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;

	public class MItemRendererWraper
	{
		private var _itemRender:IMItemRenderer;
		private var _rowno:int;
		private var _hovered:Boolean;
		
		public function MItemRendererWraper(itemRender:IMItemRenderer = null)
		{
			this._itemRender=itemRender;
		}
		
		public function get width():Number
		{
			return DisplayObject(this._itemRender).width;
		}
		
		public function get data():Object
		{
			return this._itemRender.data;
		}
		
		public function set data(value:*):void
		{
			this._itemRender.data = value;
		}
		
		public function get selected():Boolean
		{
			return this._itemRender.selected;
		}
		
		public function set selected(value:Boolean):void
		{
			this._itemRender.selected=value;
//			this.setCurrentState(null);
		}
		
		public function set y(value:Number):void
		{
			this._itemRender.y = value;			
		}
		
		public function set itemRender(value:IMItemRenderer):void
		{
			this._itemRender = value;
		}
		
		public function get itemRender():IMItemRenderer
		{
			return this._itemRender;
		}
		
		private function addListeners():void
		{
			this._itemRender.addEventListener(MouseEvent.ROLL_OVER, itemRenderer_rollOverHandler);
			this._itemRender.addEventListener(MouseEvent.ROLL_OUT, itemRenderer_rollOutHandler);
			this._itemRender.addEventListener(MouseEvent.CLICK, itemRenderer_selectedHandler);
		}


		/**
		 * 鼠标悬停 事件
		 * @param event
		 */
		protected function itemRenderer_rollOverHandler(event:MouseEvent):void
		{
			if (!anyButtonDown(event))
			{
				this._hovered=true;
//				this.setCurrentState(null);
			}
		}

		/**
		 * 	单元格渲染器 选中事件
		 *  @private
		 *  selected event handler.
		 */
		protected function itemRenderer_selectedHandler(e:MouseEvent):void
		{
			this._itemRender.selected=true;
			//			var evt:UzItemRendererEvent = new UzItemRendererEvent(UzItemRendererEvent.ITEMRENDERER_SELECTED, this);
			//			this.dispatchEvent(evt);
		}

		/**
		 * 鼠标移出 事件
		 * @param event
		 */
		protected function itemRenderer_rollOutHandler(event:MouseEvent):void
		{
			this._hovered=false;
//			this.setCurrentState(null);
		}

		private function anyButtonDown(event:MouseEvent):Boolean
		{
			var type:String=event.type;
			return event.buttonDown || (type == "middleMouseDown") || (type == "rightMouseDown");
		}
	}
}