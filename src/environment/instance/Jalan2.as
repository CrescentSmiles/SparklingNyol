package environment.instance 
{
	import char.Char;
	import environment.EnvironmentLocation;
	import environment.IEnvironment;
	import pages.GamePage;
	import feathers.controls.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.display.MovieClip;
	import starling.events.Event;
	import ui.PortalButton;
	/**
	 * ...
	 * @author zain
	 */
	public class Jalan2 extends Sprite implements IEnvironment 
	{
		/** list asset */
		[Embed(source="../../../assets/environment/Jalan2_1.jpg")]
		public static const Jalan2_1:Class;
		
		[Embed(source="../../../assets/environment/Jalan2_2.png")]
		public static const Jalan2_2:Class;
		
		[Embed(source="../../../assets/ui/LeafArrowUp.png")]
		public static const LeafArrowUp:Class;
		[Embed(source = "../../../assets/ui/LeafArrowDown.png")]
		public static const LeafArrowDown:Class;
		
		[Embed(source="../../../assets/ui/LeafArrow2Up.png")]
		public static const LeafArrow2Up:Class;
		[Embed(source = "../../../assets/ui/LeafArrow2Down.png")]
		public static const LeafArrow2Down:Class;
		
		private var gamePage:GamePage;
		
		/** environment layer */
		private var mcBg:MovieClip;
		private var mcFg:MovieClip;
		
		/** portal */
		private var pbJalan1:PortalButton;
		private var pbJalan3:PortalButton;
		
		public function Jalan2(gamePage:GamePage)
		{
			super();
			Config.log("[Environment] Jalan2");
			
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
			mcBg = new MovieClip(Assets.getTextures("Jalan2_1"));
			
			mcFg = new MovieClip(Assets.getTextures("Jalan2_2"));
			
			pbJalan1 = new PortalButton();
			pbJalan1.label = "slide to go";
			pbJalan1.x = 1640;
			pbJalan1.y = 600;
			pbJalan1.styleProvider = null;
			pbJalan1.defaultSkin = new Image(Assets.getTexture("LeafArrowUp"));
			pbJalan1.downSkin = new Image(Assets.getTexture("LeafArrowDown"));
			pbJalan1.addEventListener(Event.TRIGGERED, gotoJalan1);
			
			pbJalan3 = new PortalButton();
			pbJalan3.label = "slide to go";
			pbJalan3.x = -32.9;
			pbJalan3.y = 616.4;
			pbJalan3.rotation = 0.26;
			pbJalan3.styleProvider = null;
			pbJalan3.defaultSkin = new Image(Assets.getTexture("LeafArrow2Up"));
			pbJalan3.downSkin = new Image(Assets.getTexture("LeafArrow2Down"));
			pbJalan3.addEventListener(Event.TRIGGERED, gotoJalan3);
			
			/** addChild */
			addChild(mcBg);
			addChild(mcFg);
			addChild(pbJalan1);
			addChild(pbJalan3);
		}
		
		/* Portal */
		private function gotoJalan3(e:Event):void {
			gamePage.changeEnvironment(EnvironmentLocation.JALAN3);
		}
		
		private function gotoJalan1(e:Event):void {
			gamePage.changeEnvironment(EnvironmentLocation.JALAN1);
		}
		
		/* INTERFACE environment.IEnvironment */
		
		public function update():void 
		{
			
		}
		
		public function destroy():void 
		{
			
		}
		
		/* INTERFACE environment.IEnvironment */
		
		public function addHero(hero:Char):void 
		{
			addChild(hero);
			setChildIndex(hero, 1);
		}
		
	}

}