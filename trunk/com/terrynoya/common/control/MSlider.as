package com.terrynoya.common.control
{
	import com.terrynoya.common.core.MUIComponent;
	import com.terrynoya.manager.MSkinManager;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class MSlider extends MUIComponent
	{
		private var _thumb:MButton;
		private var _track:DisplayObject;
		
		private var _mouseDownPoint:Point;	
		private var _offsetPoint:Point;
		private var _lstBarPoint:Point;
		public function MSlider()
		{
			super();
		}
		
		
		override protected function addChildren():void
		{
			this._track = MSkinManager.sliderTrackSkin;
			this.addChild(this._track);
			
			this._thumb = new MButton();
			this._thumb.buttonSkin = MSkinManager.sliderThumbSkin;
			this.addChild(this._thumb);
			
			this._lstBarPoint = new Point(0,0);
			
			this.addListeners();
		} 
		
		private function addListeners():void
		{
			this._thumb.addEventListener(MouseEvent.MOUSE_DOWN, onThumbPressHandler);
			
		}
		
		private function onThumbPressHandler(e:MouseEvent):void
		{
			this._mouseDownPoint = this.globalToLocal(new Point(e.stageX, e.stageY));
			this.addDragListener();
		}
		
		private function addDragListener():void
		{
			this.stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			this.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		private function removeDragListener():void
		{
			this.stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			this.stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		private function onMouseMove(e:MouseEvent):void
		{
			var p:Point = this.globalToLocal(new Point(e.stageX,e.stageY));
			var dp:Point = p.subtract(this._mouseDownPoint);
			this._offsetPoint = dp;
			
			this._thumb.x = this._offsetPoint.x + this._lstBarPoint.x;
		}
		
		private function onMouseUp(e:MouseEvent):void
		{
			this.removeDragListener();
			this._lstBarPoint = new Point(this._thumb.x, this._thumb.y);
		}
	}
}
