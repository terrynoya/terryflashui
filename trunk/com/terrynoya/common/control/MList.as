package com.terrynoya.common.control
{
	import com.terrynoya.common.collection.MArrayCollection;
	import com.terrynoya.common.control.listClasses.MListItemRenderer;
	import com.terrynoya.common.core.MItemRenderer;
	import com.terrynoya.common.core.MScrollControlBase;
	import com.terrynoya.common.core.MSprite;
	import com.terrynoya.common.events.MScrollEvent;
	import com.terrynoya.common.util.MObjectPool;
	
	import flash.display.DisplayObject;

	public class MList extends MScrollControlBase
	{
		private var _dataProvider:MArrayCollection;

		private var _rowCount:int;

		private var _rowHeight:Number=30;

		private var _rendererPool:MObjectPool;

		private var _contentHolder:MSprite;

		private var _visualWidth:Number;

		private var _visualHeight:Number;
		
		/**
		 * 用户没有设置width时按照itemrenderer中的最大值设定宽度
		 */
		protected var maxRendererWidth:Number;

		public function MList()
		{
			super();
			this._rendererPool=new MObjectPool(MListItemRenderer);
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
	
		public function set rowCount(value:int):void
		{
			this._rowCount = value;
			this.updateView();
		}
		
		public function get rowHeight():Number
		{
			return this._rowHeight;
		}
		
		public function set rowHeight(value:Number):void
		{
			if(this.rowHeight == value)
			{
				return;
			}
			this._rowHeight = value;
			this.updateView();
		}
		
		public function set dataProvider(value:MArrayCollection):void
		{
			this._dataProvider=value;
			this.layoutBar(rendererWidth,Math.min(this.length , this.rowCount) * this._rowHeight);
			this.updateView();
		}

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
			this.updateView();
		}
		
		override public function set height(value:Number) : void
		{
			this._visualHeight = value;
			this.updateView();
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

		protected function updateView():void
		{
			if (null == this._dataProvider)
			{
				return;
			}
			this.vScrollBar.maximum = (Math.max(this.length , this.rowCount) - this.rowCount) * this.rowHeight;
			this.vScrollBar.pageSize = this.rowCount * this.rowHeight;
			this.vScrollBar.snapInerval = this.rowHeight;
			
			this.layoutBar(rendererWidth,Math.min(this.length , this.rowCount) * this._rowHeight);
			this.removeRenderers();
			 
			var currCol:int= this.vScrollBar.scrollPosition / this._rowHeight;
			var maxCol:Number=Math.min(currCol + this.rowCount, this.length);
			var renderArr:Array=[];
			var rowCount:int=0;
			
			var arr:Array=this._dataProvider.toArray();

			for (var i:int=currCol; i < maxCol; i++)
			{ 
				var itemRenderer:MItemRenderer=MItemRenderer(this._rendererPool.getObject());
				itemRenderer.data=arr[i];
				itemRenderer.y=rowCount * this._rowHeight;
				this._contentHolder.addChild(DisplayObject(itemRenderer));

				this.maxRendererWidth=Math.max(this.maxRendererWidth, itemRenderer.width);
				
				renderArr.push(itemRenderer);
				rowCount++;
			}
//
			this.ajustRendererWidth(renderArr);
			
		}
		
		
		override protected function scrollHandler(e:MScrollEvent) : void
		{
			this.updateView();
		}

		/**
		 *	调整所有单元格渲染器的宽度
		 *	@private
		 */
		private function ajustRendererWidth(renderArr:Array):void
		{
			//如果用户设置了width，则按用户的width显示，否则按照单元格中的最大宽度绘制
			for (var i:int=0; i < renderArr.length; ++i)
			{
				var render:DisplayObject=DisplayObject(renderArr[i]);
//				render.visible = false;
				render.width=rendererWidth;
				render.height = this._rowHeight;
			}
		}
		
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


		private function removeRenderers():void
		{
			//this._contentHolder.removeAllChildren
			for (var i:int=this._contentHolder.numChildren - 1; i >= 0; i--)
			{
				this._rendererPool.recycleObject(this._contentHolder.removeChildAt(i));
			}
		}

	}
}