package com.terrynoya.common.core
{
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
			this._stage = this.stage
			this._stage.align = StageAlign.TOP_LEFT;
			this._stage.scaleMode = StageScaleMode.NO_SCALE;
		}
	}
}