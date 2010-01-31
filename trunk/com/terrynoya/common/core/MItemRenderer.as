package com.terrynoya.common.core
{
	import flash.events.MouseEvent;
	use namespace melon_internal;

	public class MItemRenderer extends MUIComponent implements IMItemRenderer
	{
		private var _data:Object;
		private var _selected:Boolean;
		private var _rowNo:int;
		protected var hovered:Boolean=false;

		public function MItemRenderer()
		{
			super();
		}


		/**
		 * 该单元格渲染器在所有数据中为哪一行数据
		 * @private
		 */
		melon_internal function get rowNO():int
		{
			return this._rowNo
		}

		melon_internal function set rowNO(value:int):void
		{
			this._rowNo=value;
		}


		public function get data():Object
		{
			return this._data;
		}

		public function set data(value:Object):void
		{
			this._data=value;
//			var evt:UzItemRendererEvent = new UzItemRendererEvent(UzItemRendererEvent.DATA_CHANGE, this);
//			this.dispatchEvent(evt);
		}

		public function get selected():Boolean
		{
			return this._selected;
		}

		public function set selected(value:Boolean):void
		{
			this._selected=value;
			this.setCurrentState(null);
		}

		/**
		 * 鼠标悬停 事件
		 * @param event
		 */
		protected function itemRenderer_rollOverHandler(event:MouseEvent):void
		{
			if (!anyButtonDown(event))
			{
				this.hovered=true;
				this.setCurrentState(null);
			}
		}

		private function anyButtonDown(event:MouseEvent):Boolean
		{
			var type:String=event.type;
			return event.buttonDown || (type == "middleMouseDown") || (type == "rightMouseDown");
		}

		private function addHandlers():void
		{
			addEventListener(MouseEvent.ROLL_OVER, itemRenderer_rollOverHandler);
			addEventListener(MouseEvent.ROLL_OUT, itemRenderer_rollOutHandler);
			addEventListener(MouseEvent.CLICK, itemRenderer_selectedHandler);
		}

		/**
		 *	子类根据具体情况覆盖
		 */
		public function setCurrentState(stateName:String, playTransition:Boolean=true):void
		{

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
			this.hovered=false;
			this.setCurrentState(null);
		}
	}
}