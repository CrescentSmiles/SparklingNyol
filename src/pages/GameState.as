package pages
{
	import pages.GamePage;
	import pages.WelcomePage;
	/**
	 * ...
	 * @author zain
	 */
	public class GameState 
	{
		
		public static const WELCOME_PAGE:int = 0;
		public static const GAME_WALK:int = 1;
		
		public static function getClass(state:int):Class {
			switch(state) {
				case WELCOME_PAGE:
					return WelcomePage;
					break;
				case GAME_WALK:
					return GamePage;
					break;
				default:
					Config.log("Class not Found: " + state);
					return null;
			}
		}
		
	}

}