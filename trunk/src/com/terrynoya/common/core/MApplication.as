package com.terrynoya.common.core
{
	import com.terrynoya.common.manager.MSystemManager;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class MApplication extends Sprite
	{
		private var _stage:Stage;
		
		public function MApplication()
		{
			super();
			this._stage = this.stage;
			MSystemManager.stage = this.stage; 
			this._stage.align = StageAlign.TOP_LEFT;
			this._stage.scaleMode = StageScaleMode.NO_SCALE;
		}
		
		override public function get width():Number
		{
			return this._stage != null ? this._stage.stageWidth : super.width;
		}
		
		override public function get height():Number
		{
			return this._stage != null ? this._stage.stageHeight : super.height;
		}
	}
}