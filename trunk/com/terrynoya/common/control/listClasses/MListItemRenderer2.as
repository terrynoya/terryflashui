package com.terrynoya.common.control.listClasses
{
	import com.terrynoya.common.control.MLabel;
	import com.terrynoya.common.core.IMItemRenderer;
	import com.terrynoya.common.core.MUIComponent;
	
	import flash.display.Graphics;

	public class MListItemRenderer2 extends MUIComponent implements IMItemRenderer
	{
		protected var label:MLabel;
		private var _selected:Boolean;
		private var _data:Object;
		
		public function MListItemRenderer2()
		{
		}
		
		public function set data(value:Object):void
		{
			this._data=value;
			var str:String=value.toString();
			this.label.text=str;
		}
		
		public function get data():Object
		{
			return this._data;
		}
		
		public function get selected():Boolean
		{
			return this._selected;
		}
		
		public function set selected(value:Boolean):void
		{
			this._selected=value;
//			this.setCurrentState(null);
		}
		
		/**
		 *  @private
		 */
		override protected function createChildren():void
		{
			if (!label)
			{
				label=new MLabel();
				addChild(label);
			}
		}
		
		override public function set width(value:Number):void
		{
			this.drawBackground(value, this.height);
			this.label.width=value;
		}
		
		override public function set height(value:Number):void
		{
			this.drawBackground(this.width, value);
			//			this.label.height=value;
		}
		
		private function drawBackground(w:Number, h:Number):void
		{
			var g:Graphics=this.graphics;
			g.clear();
			
			var color:uint = 0xffffff;
			
//			if (this.selected)
//			{
//				color=this._selectedColor;
//			}
//			else
//			{
//				color=this.hovered == true ? this._rollOverColor : 0xffffff;
//			}
			g.beginFill(color);
			g.drawRect(0, 0, w, h);
			g.endFill();
		}

	}
}