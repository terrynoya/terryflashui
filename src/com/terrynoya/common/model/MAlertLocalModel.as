package com.terrynoya.common.model
{
	public class MAlertLocalModel implements IMAlertLocalModel
	{

		public function MAlertLocalModel()
		{
			
		}

		public function get noLabel():String
		{
			return "no";
		}

		public function get yesLabel():String
		{
			return "yes";
		}

		public function get cancelLabel():String
		{
			return "cancel";
		}

		public function get okLabel():String
		{
			return "ok";
		}

	}
}