package com.terrynoya.common.core
{
	import com.terrynoya.common.model.IMComponentModel;
	import com.terrynoya.common.model.MComponentModel;
	import com.terrynoya.common.skins.halo.IMSkin;
	import com.terrynoya.common.skins.halo.MBackgroundSkin;
	
	import flash.display.DisplayObject;

	/**
	 * 所有拥有皮肤的组件的基类
	 * 在组件初始化时createSkin
	 * @author TerryYao
	 */
	public class MSkinableComponent extends MUIComponent
	{
		private var _skin:IMSkin;
		
		private var _skinDisplayed:Boolean=false;
		
		private var _skinHolder:MUIComponent;
		
		
		private var _model:IMComponentModel;
		/**
		 * 
		 */
		public function MSkinableComponent()
		{
			super();
			this.createSkin();
			this.updateView();
		} 
		
		public function get model():IMComponentModel
		{
			return _model;
		}

		public function set model(value:IMComponentModel):void
		{
			_model = value;
		}

		protected function get skinHolder():MUIComponent
		{
			return _skinHolder;
		}

		override protected function createChildren():void
		{
			super.createChildren();
			this._model = new MComponentModel();
			this._skinHolder = new MUIComponent();
			this.addChild(this._skinHolder);
		}
		
		override public function set width(value:Number) : void
		{
			this._model.width = value;
			this.resizeSkin();
		}
		
		override public function get width():Number
		{
			return this._model.width;
		}
		
		override public function get height():Number
		{
			return this._model.height; 
		} 
		
		override public function set height(value:Number) : void
		{
			this._model.height = value;
			this.resizeSkin();
		}
		
		/**
		 * 
		 * @param value
		 */
		public function set skin(value:IMSkin):void
		{
			this._skin=value;
			this.onSetSkin(value);
			this.renderSkin();
			this.updateView();
		}
		
		protected function onSetSkin(value:IMSkin):void
		{
			
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
			 this._skin = new MBackgroundSkin();
			 this.renderSkin();
		}
		
		public function renderSkin():void
		{
			this._skinHolder.removeAllChildren();
			this._skinHolder.addChild(DisplayObject(this._skin));
			this.resizeSkin();	
		} 
		
		protected function resizeSkin():void
		{
			this._skin.width = this._model.width;
			this._skin.height = this._model.height;	
		}
	}
}