package environment 
{
	import environment.instance.Jalan1;
	import environment.instance.NyolHome;
	/**
	 * ...
	 * @author zain
	 */
	public class EnvironmentLocation 
	{
		
		public static const JALAN1:int = 0;
		public static const NYOL_HOME:int = 1;
		
		public static function getClass(state:int):Class {
			switch(state) {
				case JALAN1:
					return Jalan1;
					break;
				case NYOL_HOME:
					return NyolHome;
					break;
				default:
					Config.log("Class not Found: " + state);
					return null;
			}
		}
		
	}

}