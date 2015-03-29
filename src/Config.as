package  
{
	/**
	 * ...
	 * @author zain
	 */
	public class Config 
	{
		public static var gameSpeed:Number = 1;
		
		public function Config() 
		{
			
		}
		
		public static var lastEnvironment:String;
		
		public static function log(msg:Object):void {
			trace(msg.toString());
		}
		
	}

}