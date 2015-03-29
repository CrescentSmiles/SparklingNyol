package environment 
{
	import char.Char;
	import pages.GamePage;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author zain
	 */
	public class EnvironmentLoader extends Sprite implements IEnvironment 
	{
		private var gamePage:GamePage;
		private var targetClass:Class;
		private var nextLocation:int;
		
		public function EnvironmentLoader(gamePage:GamePage, nextLocation:int) 
		{
			super();
			Config.log("[Environment] EnvironmentLoader");
			
			this.gamePage = gamePage;
			this.targetClass = EnvironmentLocation.getClass(nextLocation);
			this.nextLocation = nextLocation;
			
			Assets.enqueue(this.targetClass);
			Assets.loadQueue(onLoading);
		}
		
		private function onLoading(ratio:Number):void {
			Config.log("Loading environment, progress: "+ ratio);
 
			// -> When the ratio equals '1', we are finished.
			if (ratio == 1.0) onEnvironmentLoaded();
		}
		
		private function onEnvironmentLoaded():void {
			Config.log(targetClass+" loaded");
			gamePage.changeEnvironment(nextLocation, false);
		}
		
		/* INTERFACE environment.IEnvironment */
		
		public function addHero(hero:Char):void {
			
		}
		
		public function update():void 
		{
			
		}
		
		public function destroy():void 
		{
			
		}
		
	}

}