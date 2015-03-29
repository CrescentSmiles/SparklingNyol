package environment.instance 
{
	import char.Char;
	import environment.EnvironmentLocation;
	import environment.IEnvironment;
	import pages.GamePage;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import ui.PortalButton;
	/**
	 * ...
	 * @author zain
	 */
	public class NyolHome extends Sprite implements IEnvironment
	{
		[Embed(source = "../../../assets/environment/NyolHomeBg_1.jpg")]
		public static const NyolHomeBg_1:Class;
		
		[Embed(source="../../../assets/ui/LeafArrow2Up.png")]
		public static const LeafArrow2Up:Class;
		
		[Embed(source = "../../../assets/ui/LeafArrow2Down.png")]
		public static const LeafArrow2Down:Class;
		
		private var gamePage:GamePage;
		
		/** environment layer */
		private var mcBg:MovieClip;
		private var hero:Char;
		
		/** portal */
		private var pbJalan:PortalButton;
		
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
			
			/** initialize each object */
			mcBg = new MovieClip(Assets.getTextures("NyolHomeBg_1"));
			
			pbJalan = new PortalButton();
			pbJalan.label = "slide to go";
			pbJalan.x = 1500.85;
			pbJalan.y = 310.1;
			pbJalan.rotation = 0.26;
			pbJalan.styleProvider = null;
			pbJalan.defaultSkin = new Image(Assets.getTexture("LeafArrow2Up"));
			pbJalan.downSkin = new Image(Assets.getTexture("LeafArrow2Down"));
			pbJalan.addEventListener(Event.TRIGGERED, gotoJalan);
			
			
			/** addChild */
			addChild(mcBg);
			addChild(pbJalan);
		}
		
		/* Portal */
		private function gotoJalan(e:Event):void {
			gamePage.changeEnvironment(EnvironmentLocation.JALAN1);
		}
		
		/* INTERFACE environment.IEnvironment */
		
		public function addHero(hero:Char):void {
			addChild(hero);
			setChildIndex(hero, 1);
		}
		
		public function update():void 
		{
			
		}
		
		public function destroy():void 
		{
			
		}
		
	}

}