package com.terrynoya.common.core
{
	use namespace melon_internal;
	import com.terrynoya.common.manager.MStyleManager;

	/**
	 * 所有可视组件的基类
	 * @author TerryYao
	 */
	public class MUIComponent extends MSprite
	{
		
		private var _minWidth:Number;
		
		private var _minHeight:Number;
		
		/**
		 * 
		 */
		public function MUIComponent()
		{
			super();
			this.createChildren();
		}
		
		/**
		 * 
		 * @return 
		 */
		public function get minWidth():Number
		{
			return this._minWidth;
		}
		
		/**
		 * 
		 * @param value
		 */
		public function set minWidth(value:Number):void
		{
			this._minWidth = value;
			this.updateView();
		}
		
		/**
		 * 
		 * @param value
		 */
		public function set minHeight(value:Number):void
		{
			this._minHeight = value;
			this.updateView();
		}
		
		/**
		 * 
		 * @return 
		 */
		public function get minHeight():Number
		{
			return this._minHeight;
		}
		
		
		/**
		 * 视图更新，所有子类在视图更新时应该覆盖整个方法
		 */
		protected function updateView():void
		{
			
		}
		
		/**
		 * 创建子类模板，所有子类在创建自己的子类时应覆盖这个方法
		 */
		protected function createChildren():void
		{
			
		}

		/**
		 * 
		 * @param styleProp
		 * @param newValue
		 */
		public function setStyle(styleProp:String, newValue:*):void
		{
			MStyleManager.setStyle(styleProp, this);
		}
	}
}