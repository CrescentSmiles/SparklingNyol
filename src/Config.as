package  
{
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	/**
	 * ...
	 * @author zain
	 */
	public class Config 
	{
		public static var gameSpeed:Number = 1;
		private static var tfOutput:TextField;
		
		public function Config() 
		{
			
		}
		
		public static function getTFOutput():TextField {
			if (tfOutput == null) {
				tfOutput = new TextField();
				tfOutput.width = 220;
				tfOutput.height = 360;
				//tfOutput.autoSize = TextFieldAutoSize.LEFT;
				tfOutput.border = true;
				tfOutput.multiline = true;
				tfOutput.background = true;
				tfOutput.text = "[tfOutput]";
			}
			
			return tfOutput;
		}
		
		public static var lastEnvironment:String;
		
		public static function log(msg:Object):void {
			trace(msg.toString());
			//tfOutput.text += "\n" + msg.toString();
		}
		
	}

}