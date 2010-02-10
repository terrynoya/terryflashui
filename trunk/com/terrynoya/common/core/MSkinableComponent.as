package com.terrynoya.common.core
{
	import com.terrynoya.common.skins.halo.MSkin;

	public class MSkinableComponent extends MUIComponent
	{
		private var _skin:MSkin;
		private var _skinDisplayed:Boolean=false;

		public function MSkinableComponent()
		{
			super();
			this.createSkin();
		}
		
		override public function set width(value:Number) : void
		{
			this._skin.width = value;
		}
		
		override public function set height(value:Number) : void
		{
			this._skin.height = value;
		}
		
		public function set skin(value:MSkin):void
		{
			this._skin=value;
			this.updateView();
		}

		public function get skin():MSkin
		{
			return this._skin;
		}

		protected function createSkin():void
		{

		}

		override protected function updateView():void
		{
			super.updateView();
			if (this._skinDisplayed)
			{
				return;
			}
			this.addChild(this._skin);
			this._skinDisplayed=true;
		}

	}
}