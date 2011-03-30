package com.terrynoya.common.core
{
	use namespace melon_internal;
	import com.terrynoya.common.control.IMPopup;
	import com.terrynoya.common.manager.MStyleManager;

	/**
	 * 所有可视组件的基类
	 * @author TerryYao
	 */
	public class MUIComponent extends MSprite implements IMPopup
	{
		
		private var _minWidth:Number;
		
		private var _minHeight:Number;
		
		private var _id:String;
		
		private var _enabled:Boolean = true;
		
		private var _selected:Boolean;
		
		protected var _toolTip:String;
		
		public function get toolTip():String
		{
			return this._toolTip;
		}
		
		public function set toolTip(value:String):void
		{
			this._toolTip = value;
		}
		/**
		 * 
		 */
		public function MUIComponent()
		{
			super();
			this.createChildren();
		}
		
		public function get selected():Boolean
		{
			return _selected;
		}

		public function set selected(value:Boolean):void
		{
			_selected = value;
		}

		public function set enabled(value:Boolean):void
		{
			if(this._enabled == value)
			{
				return;
			}
			this._enabled = value;
		}
				
		public function get enabled():Boolean
		{
			return this._enabled;
		}
		
		
		public function get id():String
		{
			return this._id;
		}
		
		public function set id(value:String):void
		{
			this._id = value;
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
		
		private function removeFromParent():void
		{
			if(this.parent != null)
			{
				this.parent.removeChild(this);
			}
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
		
		public function centerToParent():void
		{
			if(this.parent)
			{
				this.x = (parent.width - this.width)/2;
				this.y = (parent.height - this.height)/2;
			}
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