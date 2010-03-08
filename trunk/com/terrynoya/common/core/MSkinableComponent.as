package com.terrynoya.common.core
{
	import com.terrynoya.common.skins.halo.IMSkin;

	/**
	 * 所有拥有皮肤的组件的基类
	 * 在组件初始化时拥有createSkin方法
	 * @author TerryYao
	 */
	public class MSkinableComponent extends MUIComponent
	{
		private var _skin:IMSkin;
		
		private var _skinDisplayed:Boolean=false;
		
		/**
		 * 
		 */
		public function MSkinableComponent()
		{
			super();
			this.createSkin();
			this.updateView();
		} 
		
		override public function set width(value:Number) : void
		{
			this._skin.width = value;
		}
		
		override public function get width():Number
		{
			return this._skin.width;
		}
		
		override public function get height():Number
		{
			return this._skin.height;
		} 
		
		override public function set height(value:Number) : void
		{
			this._skin.height = value;
		}
		
		/**
		 * 
		 * @param value
		 */
		public function set skin(value:IMSkin):void
		{
			this._skin=value;
			this.updateView();
		}

		/**
		 * 
		 * @return 
		 */
		public function get skin():IMSkin
		{
			return this._skin;
		}

		/**
		 * 
		 */
		protected function createSkin():void
		{
			 
		}

		override protected function updateView():void
		{
			super.updateView();
//			if (this._skinDisplayed)
//			{
//				return;
//			}
//			this.addChild(this._skin);
//			this._skinDisplayed=true;
		}

	}
}