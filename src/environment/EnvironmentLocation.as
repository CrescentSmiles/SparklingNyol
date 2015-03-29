package environment 
{
	import environment.instance.Jalan1;
	import environment.instance.Jalan2;
	import environment.instance.Jalan3;
	import environment.instance.NyolHome;
	/**
	 * ...
	 * @author zain
	 */
	public class EnvironmentLocation 
	{
		
		public static const JALAN1:int = 0;
		public static const NYOL_HOME:int = 1;
		public static const JALAN2:int = 2;
		public static const JALAN3:int = 3;
		
		public static function getClass(state:int):Class {
			switch(state) {
				case JALAN1:
					return Jalan1;
					break;
				case NYOL_HOME:
					return NyolHome;
					break;
				case JALAN2:
					return Jalan2;
					break;
				case JALAN3:
					return Jalan3;
					break;
				default:
					Config.log("Class not Found: " + state);
					return null;
			}
		}
		
	}

}