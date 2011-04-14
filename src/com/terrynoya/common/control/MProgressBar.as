package com.terrynoya.common.control
{
	import com.terrynoya.common.core.MMaskSkin;
	import com.terrynoya.common.core.MSkinableComponent;
	import com.terrynoya.common.core.MUIComponent;
	import com.terrynoya.common.manager.MSkinManager;
	import com.terrynoya.common.model.MProgressModel;
	import com.terrynoya.common.skins.halo.IMProgressBarSkin;
	import com.terrynoya.common.skins.halo.IMSkin;
	import com.terrynoya.common.skins.halo.progressBar.MProgressBarSkin;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	import mx.core.IProgrammaticSkin;
	
	public class MProgressBar extends MSkinableComponent
	{
		private var _bar:MSkinableComponent;
		
		private var _track:MSkinableComponent;
		
		private var _mask:DisplayObject;
		
		private var _mskpadding:int = 1;
		
		public function MProgressBar()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			this.model = new MProgressModel();
			
			this._bar = new MSkinableComponent();
			this._track = new MSkinableComponent();
			this._mask = new MSkinableComponent();
//			this._bar.mask = this._mask;
			this.addChild(this._track);
			this.addChild(this._bar);
			
		}
		
		public function get value():int
		{
			return this.progressModel.value;
		}
		
		public function get progressModel():MProgressModel
		{
			return MProgressModel(this.model);
		}
			
		
		public function set value(value:int):void
		{
			this.progressModel.value = value;
			this.updateBarByValue();
		}
		
		public function set maximum(value:Number):void
		{
			this.progressModel.maximum = value;
			this.updateBarByValue();
		}
		
		public function set minimun(value:Number):void
		{
			this.progressModel.minimun = value;
			this.updateBarByValue();
		}
				
		override public function renderSkin():void
		{
			this.skinHolder.removeAllChildren();
		}
		
		override protected function resizeSkin():void
		{
			
			this._track.width = this.model.width;
			this._track.height = this.model.height;
			
			this._mask.width = this.model.width - _mskpadding*2
			this._mask.height = this.model.height - _mskpadding*2;
			this._mask.x = _mskpadding;
			this._mask.y = _mskpadding;
			
			this.updateBarByValue();
		}
		
		private function updateBarByValue():void
		{
			var model:MProgressModel = this.progressModel;
			this._bar.width = (value - model.minimun) / (model.maximum - model.minimun) * model.width;  
		}

		override protected function createSkin():void
		{
			this.skin = MSkinManager.progressBarSkin;
		}
		
		override protected function onSetSkin(value:IMSkin):void
		{
			this._bar.skin = this.progressBarSkin.barSkin;
			this._track.skin = this.progressBarSkin.trackSkin;
		}
		
		public function get progressBarSkin():IMProgressBarSkin
		{
			return IMProgressBarSkin(this.skin);
		}
	}
}