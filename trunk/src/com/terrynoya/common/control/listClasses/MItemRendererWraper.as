package com.terrynoya.common.control.listClasses
{
	import com.terrynoya.common.core.IMItemRenderer;
	import com.terrynoya.common.core.MSkinableComponent;
	import com.terrynoya.common.core.MUIComponent;
	import com.terrynoya.common.core.melon_internal;

	import flash.display.DisplayObject;
	import flash.events.MouseEvent;

	public class MItemRendererWraper extends MSkinableComponent
	{
		private var _itemRender:IMItemRenderer;
		private var _rowno:int;

		private var _selected:Boolean;

		private var _hovered:Boolean=false;

		public function MItemRendererWraper(itemRender:IMItemRenderer=null)
		{
			this._itemRender=itemRender;
		}

		/**
		 * 该单元格渲染器在所有数据中为哪一行数据
		 * @private
		 */
		melon_internal function get rowNO():int
		{
			return this._rowno;
		}

		melon_internal function set rowNO(value:int):void
		{
			this._rowno=value;
		}

		public function get data():Object
		{
			return this._itemRender.data;
		}

		public function set data(value:*):void
		{
			this._itemRender.data=value;
			this.addListeners();
		}

		override public function get selected():Boolean
		{
			return this.selected;
		}

		override public function set selected(value:Boolean):void
		{
			this._selected=value;
//			this.setCurrentState(null);
		}

		public function set itemRender(value:IMItemRenderer):void
		{
			this._itemRender=value;
			this.addChild(DisplayObject(this._itemRender));
		}

		public function get itemRender():IMItemRenderer
		{
			return this._itemRender;
		}

		private function addListeners():void
		{
			this.addEventListener(MouseEvent.ROLL_OVER, itemRenderer_rollOverHandler);
			this.addEventListener(MouseEvent.ROLL_OUT, itemRenderer_rollOutHandler);
			this.addEventListener(MouseEvent.CLICK, itemRenderer_selectedHandler);
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
			this.selected=true;
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