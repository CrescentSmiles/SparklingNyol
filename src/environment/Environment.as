package environment 
{
	import char.Char;
	import pages.GamePage;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author zain
	 */
	public class Environment extends Sprite 
	{
		protected var gamePage:GamePage;
		
		/** environment layer */
		protected var spBg:Sprite;
		protected var hero:Char;
		
		public function Environment() 
		{
			super();
			
		}
		
	}

}