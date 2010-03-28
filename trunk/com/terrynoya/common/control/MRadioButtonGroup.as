package com.terrynoya.common.control
{
	import com.terrynoya.common.events.MCheckBoxEvent;
	import com.terrynoya.common.util.MHashMap;
	
	/**
	 * 
	 * @author TerryYao
	 */
	public class MRadioButtonGroup
	{
		private var _radios:MHashMap;
		
		/**
		 * radioButton组
		 */
		public function MRadioButtonGroup()
		{
			this._radios = new MHashMap();
		}
		
		/**
		 * 添加一个radioButton
		 * @param btn
		 * @return 
		 */
		public function addRaidoButton(btn:MRadioButton):Boolean
		{
			if(this._radios.containsKey(btn.name))
			{
				return false;
			}
			
			btn.addEventListener(MCheckBoxEvent.CHANGE,onRadioChange);
				
			return this._radios.put(btn.name,btn);
		}
		
		/**
		 * 移除一个radioButton
		 * @param btn
		 * @return 
		 */
		public function removeRadioButton(btn:MRadioButton):Boolean
		{
			if(!this._radios.containsKey(btn))
			{
				return false;
			}
			return this._radios.remove(btn);
		}
		
		public function removeAll():void
		{
			this._radios.clear();
		}
		
		
		private function onRadioChange(e:MCheckBoxEvent):void
		{
			var btn:MRadioButton = MRadioButton(e.currentTarget);
			if(btn.checked)
			{
				this._radios.foreachValue(unSelect);
				btn.checked = true;
			}
		}
		
		private function unSelect(btn:MRadioButton):void
		{
			btn.checked = false;
		}
	}
}