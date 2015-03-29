package environment.instance 
{
	import char.Char;
	import environment.IEnvironment;
	import pages.GamePage;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	/**
	 * ...
	 * @author zain
	 */
	public class NyolHome extends Sprite implements IEnvironment
	{
		[Embed(source = "../../../assets/environment/NyolHomeBg.jpg")]
		public static const NyolHomeBg:Class;
		
		private var gamePage:GamePage;
		
		/** environment layer */
		private var mcBg:MovieClip;
		private var hero:Char;
		
		public function NyolHome(gamePage:GamePage) 
		{
			super();
			Config.log("[Environment] Nyol's House");
			
			this.gamePage = gamePage;
			if (stage) {
				initialize();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, initialize);
			}
		}
		
		private function initialize(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, initialize);
			
			/** instantiate */
			mcBg = new MovieClip(Assets.getTextures("NyolHomeBg"));
			
			/** set properties */
			
			
			/** addEventListener */
			
			
			/** addChild */
			addChild(mcBg);
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