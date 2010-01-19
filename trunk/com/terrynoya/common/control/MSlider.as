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
			
			this.addListeners();
		} 
		
		private function addListeners():void
		{
			this._thumb.addEventListener(MouseEvent.MOUSE_DOWN, onThumbPressHandler);
			
		}
		
		private function onThumbPressHandler(e:MouseEvent):void
		{
			this._mouseDownPoint = new Point(e.stageX, e.stageY);
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
			trace("moving");
		}
		
		private function onMouseUp(e:MouseEvent):void
		{
			this.removeDragListener();
		}
		
		
	}
}
