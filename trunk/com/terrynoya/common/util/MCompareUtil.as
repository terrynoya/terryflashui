package com.terrynoya.common.util
{
	public class MCompareUtil
	{
		public function MCompareUtil()
		{
		}
		
		public static function getFunctionByObjectType(value:*):Function
		{	
			var compareFunction:Function;
			var typ:String = MObjectUtil.getType(value);
			switch (typ)
			{
				case MObjectType.STRING:
					compareFunction = stringCompare;
					break;
				case MObjectType.OBJECT:
					if (value is Date)
					{
						compareFunction = dateCompare;
					}
					else
					{  
						compareFunction = stringCompare;
						var test:String;
						try
						{
							test = value.toString();
						}
						catch(error2:Error)
						{
						}
						if (!test || test == "[object Object]")
						{
//							compareFunction = ds; 
						}
					}
					break;
				case MObjectType.XML:
//					compareFunction = xmlCompare;
					break;
				case MObjectType.BOOLEAN:
				case MObjectType.NUMBER:
					compareFunction = numericCompare;
					break;
			} 
			return compareFunction;
		}
		
		public static function numericCompare(a:Number, b:Number):int
		{
			if (isNaN(a) && isNaN(b))
				return 0;
			
			if (isNaN(a))
				return 1;
			
			if (isNaN(b))
				return -1;
			
			if (a < b)
				return -1;
			
			if (a > b)
				return 1;
			
			return 0;
		}
		
		public static function stringCompare(a:String, b:String,
											 caseInsensitive:Boolean = false):int
		{
			if (a == null && b == null)
				return 0;
			
			if (a == null)
				return 1;
			
			if (b == null)
				return -1;
			
			// Convert to lowercase if we are case insensitive.
			if (caseInsensitive)
			{
				a = a.toLocaleLowerCase();
				b = b.toLocaleLowerCase();
			}
			
			var result:int = a.localeCompare(b);
			
			if (result < -1)
				result = -1;
			else if (result > 1)
				result = 1;
			
			return result;
		}
		
		public static function dateCompare(a:Date, b:Date):int
		{
			if (a == null && b == null)
				return 0;
			
			if (a == null)
				return 1;
			
			if (b == null)
				return -1;
			
			var na:Number = a.getTime();
			var nb:Number = b.getTime();
			
			if (na < nb)
				return -1;
			
			if (na > nb)
				return 1;
			
			return 0;
		}
	}
}