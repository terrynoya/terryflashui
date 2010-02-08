package com.terrynoya.common.control.listClasses
{
	import com.terrynoya.common.control.MLabel;
	import com.terrynoya.common.core.MItemRenderer;
	
	import flash.display.Graphics;

	public class MListItemRenderer extends MItemRenderer
	{
		private var playTransitions:Boolean=true;
		private var _rollOverColor:uint=0xb2e1ff;
		private var _selectedColor:uint=0xb2e1ff;
		
		protected var label:MLabel;

		public function MListItemRenderer()
		{
			super();
		}

		/**
		 * 鼠标悬停时的颜色
		 * @return
		 */
		public function get rollOverColor():uint
		{
			return this._rollOverColor;
		}

		/**
		 *  @private
		 */
		public function set rollOverColor(value:uint):void
		{
			this._rollOverColor=value;
		}
		
		
		override public function set data(value:Object):void
		{
			super.data=value;
			var str:String=value.toString();
			this.label.text=str;
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

		override public function setCurrentState(stateName:String, playTransition:Boolean=true):void
		{
			this.drawBackground(this.width, this.height);
		}

		private function drawBackground(w:Number, h:Number):void
		{
			var g:Graphics=this.graphics;
			g.clear();

			var color:uint;

			if (this.selected)
			{
				color=this._selectedColor;
			}
			else
			{
				color=this.hovered == true ? this._rollOverColor : 0xffffff;
			}

			g.beginFill(color);
			g.drawRect(0, 0, w, h);
			g.endFill();
		}

	}
}