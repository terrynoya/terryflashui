package com.terrynoya.common.control
{
	import com.terrynoya.common.collection.MArrayCollection;
	import com.terrynoya.common.control.listClasses.MItemRendererWraper;
	import com.terrynoya.common.core.MItemRenderer;
	import com.terrynoya.common.core.MScrollControlBase;
	import com.terrynoya.common.core.MSprite;
	import com.terrynoya.common.core.MUIComponent;
	import com.terrynoya.common.events.MScrollEvent;
	import com.terrynoya.common.util.MObjectPoolManager;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;

	/**
	 * 
	 * @author TerryYao
	 */
	public class MList extends MScrollControlBase
	{
		private var _dataProvider:MArrayCollection;

		private var _rowCount:int;

		private var _rowHeight:Number=30;

		private var _contentHolder:MSprite;

		private var _visualWidth:Number;

		private var _visualHeight:Number;
		
		//wrappers which added child to MList
		private var _renderedWrappers:Array;
		
		/**
		 * 用户没有设置width时按照itemrenderer中的最大值设定宽度
		 */
		protected var maxRendererWidth:Number;

		/**
		 * 
		 * @param w
		 * @param h
		 */
		public function MList(w:Number,h:Number)
		{
			this._renderedWrappers = new Array();
			super(w,h);
			this.rowCount = 3;
		}

		/**
		 * 得到可以显示的行数
		 * @return
		 */
		public function get rowCount():int
		{
			return this._rowCount;
		}
	
		/**
		 * 
		 * @param value
		 */
		public function set rowCount(value:int):void
		{
			if(this._rowCount == value)
			{
				return;
			}
			this.adjustWraperNum(value - this._rowCount);
			this.addWrapperToContentHolder();
			this._rowCount = value;
		}
		
		/**
		 * 
		 * @return 
		 */
		public function get rowHeight():Number
		{
			return this._rowHeight;
		}
		
		/**
		 * 设置单元格高度
		 * @param value
		 */
		public function set rowHeight(value:Number):void
		{
			if(this.rowHeight == value)
			{
				return;
			}
			this._rowHeight = value;
			this.updateView();
		}
		
		/**
		 * 
		 * @param value
		 */
		public function set dataProvider(value:MArrayCollection):void
		{
			this._dataProvider=value;
			this.layoutBar(rendererWidth,Math.min(this.length , this.rowCount) * this._rowHeight);
			this.vScrollBar.maximum = this._dataProvider.length - this.rowCount;
			this.updateData();
		}

		/**
		 * 
		 * @return 
		 */
		public function get dataProvider():MArrayCollection
		{
			return this._dataProvider;
		}

		override protected function createChildren():void
		{
			super.createChildren();
			this._contentHolder=new MSprite();
			this._contentHolder.mask=this.maskShape;
			this.addChild(this._contentHolder);
			
		}
		
		override public function set width(value:Number) : void
		{
			this._visualWidth = value;
			this.layoutBar(rendererWidth,this.rowCount * this._rowHeight);
			this.ajustRendererWidth();			
		}
		
		override public function set height(value:Number) : void
		{
			this._visualHeight = value;
			this.updateView();
		}
		
		/**
		 * 
		 * @param e
		 */
		override protected function onMouseWheel(e:MouseEvent):void
		{
			var direction:int = e.delta > 0 ? -1 : 1;
			this.vScrollBar.scrollPosition += this.vScrollBar.snapInerval * direction;
			this.updateData();
		}

		/**
		 * 得到数据长度
		 * @return
		 */
		public function get length():uint
		{
			if(!this._dataProvider)
			{
				return 0;
			}
			return this._dataProvider.length;
		}
		
		override protected function updateView():void
		{
			if (null == this._dataProvider)
			{
				return;
			}
			
			this.vScrollBar.pageSize= this.rowCount * this.rowHeight;
			this.vScrollBar.snapInerval = this.rowHeight;
			
			this.updateScrollVisible();
		}
		
		/**
		 *	调整所有单元格渲染器的宽度
		 *	@private
		 */
		private function ajustRendererWidth():void
		{
			
			for (var i:int=0; i < this._renderedWrappers.length; ++i)
			{
				var render:MItemRendererWraper=this._renderedWrappers[i];
				render.width=rendererWidth;
				render.height = this._rowHeight;
			}
		}
		
		/**
		 * 
		 * 响应滚动事件
		 * */
		override protected function vScrollHandler(e:MScrollEvent):void
		{
			this.updateData();
		}
		
		protected function updateData():void
		{
			var currCol:int= this.vScrollBar.scrollPosition;
			var maxCol:Number=Math.min(currCol + this.rowCount, this.length);
			for (var i:int=0; i <this.rowCount; i++)
			{ 
				var wraper:MItemRendererWraper = this._renderedWrappers[i];
				wraper.data=this._dataProvider.getItemAt(currCol+i);
				this.maxRendererWidth=Math.max(this.maxRendererWidth, wraper.width);
				
			}
		}
		
		//如果用户设置了width，则按用户的width显示，否则按照单元格中的最大宽度绘制
		private function get rendererWidth():Number
		{
			if(isNaN(this._visualWidth) && isNaN(this.maxRendererWidth))
			{
				return 100;	
			}
			else
			{ 
				return isNaN(this._visualWidth) ? this.maxRendererWidth : this._visualWidth;	
			}
		}
		
		/**
		 * adjustWraper by rowcount
		 * if new rowcount is larger than the old
		 * add them vise the versa
		 * */
		private function adjustWraperNum(offset:int):void
		{
			var tmpLen:int = Math.abs(offset);
			
			if(offset>0)
			{
				while(tmpLen>0)
				{
					var wraper:MItemRendererWraper = MObjectPoolManager.getObject(MItemRendererWraper)
					wraper.itemRender = MObjectPoolManager.getObject(MItemRenderer);
					this._renderedWrappers.push(wraper);
					wraper.height = this.rowHeight;
					wraper.width = this.width;
					this._contentHolder.addChild(wraper);
					tmpLen --;
				}
			}
			else
			{
				while(tmpLen>0)
				{
					MObjectPoolManager.recycleObject(MItemRendererWraper,this._contentHolder.removeChild(this._renderedWrappers.pop()));
					tmpLen --;
				}
			}
		}
		
		private function addWrapperToContentHolder():void
		{
			for (var i:int=0; i < this._renderedWrappers.length; ++i)
			{
				var wrapper:MUIComponent = this._renderedWrappers[i];
				wrapper.y = i * this.rowHeight;
			}
		}
	}
}