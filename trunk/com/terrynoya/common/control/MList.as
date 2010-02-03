package com.terrynoya.common.control
{
	import com.terrynoya.common.control.listClasses.MListItemRenderer;
	import com.terrynoya.common.core.MItemRenderer;
	import com.terrynoya.common.core.MScrollControlBase;
	import com.terrynoya.common.core.MSprite;
	import com.terrynoya.common.data.MDataProvider;
	import com.terrynoya.common.events.MScrollEvent;
	import com.terrynoya.common.util.MObjectPool;
	
	import flash.display.DisplayObject;

	public class MList extends MScrollControlBase
	{
		private var _dataProvider:MDataProvider;

		private var _rowCount:int=3;

		private var _rowHeight:Number=20;

		private var _rendererPool:MObjectPool;

		private var _contentHolder:MSprite;

		private var _visualWidth:Number;

		private var _visualHeight:Number;

		/**
		 * 用户没有设置width时按照itemrenderer中的最大值设定宽度
		 */
		protected var maxRendererWidth:Number=0;

		public function MList()
		{
			super();
			this._rendererPool=new MObjectPool(MListItemRenderer);
		}

		/**
		 * 得到可以显示的行数
		 * @return
		 */
		public function get rowCount():int
		{
			return this._rowCount;
		}

		public function set dataProvider(value:MDataProvider):void
		{
			this._dataProvider=value;
			this.updateView();
		}

		public function get dataProvider():MDataProvider
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
			return this._dataProvider.length;
		}

		protected function updateView():void
		{

			

			if (null == this._dataProvider)
			{
				return;
			}

			this.removeRenderers();
			
			
			var currCol:int=int(this.vScrollBar.scrollPosition);
			var maxCol:Number=Math.min(currCol + this.rowCount, this.length);
			var renderArr:Array=[];
			var rowCount:int=0;

			trace("currCol",currCol);
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

			this.ajustRendererWidth(renderArr);
			
			this.layoutBar(rendererWidth,this.rowCount * this._rowHeight);
			
		}
		
		
		override protected function scrollHandler(e:MScrollEvent) : void
		{
			trace(e.scrollPosition);
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
			}
		}
		
		private function get rendererWidth():Number
		{
			return isNaN(this._visualWidth) ? this.maxRendererWidth : this._visualWidth;	
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