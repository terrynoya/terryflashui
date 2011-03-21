package com.terrynoya.common.util
{
	public class MNumberUtil
	{
		public function MNumberUtil()
		{
			
		}
		
		/**
		 * 检测小数点位数 0.01 -> 2
		 * @param num
		 * @return
		 */
		public static function getPrecision(num:Number):Number
		{
			var s:String = num.toString();
			if (s.indexOf(".") == -1)
			{
				return 0;
			}
			return s.split(".").pop().length;
		}
	}
}