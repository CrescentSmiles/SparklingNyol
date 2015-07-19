package environment.instance 
{
	import char.Char;
	import environment.EnvironmentLocation;
	import environment.IEnvironment;
	import pages.GamePage;
	import feathers.controls.Button;
	import starling.display.BlendMode;
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
	public class Jalan3 extends Sprite implements IEnvironment 
	{
		/** list asset */
		[Embed(source="../../../assets/environment/Jalan3_1.jpg")]
		public static const Jalan3_1:Class;
		
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
		
		/** portal */
		private var pbJalan2:PortalButton;
		
		public function Jalan3(gamePage:GamePage)
		{
			super();
			Config.log("[Environment] Jalan3");
			
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
			mcBg = new MovieClip(Assets.getTextures("Jalan3_1"));
			
			var filter:Quad = new Quad(1920, 1080, 0x330000);
			filter.blendMode = BlendMode.ADD;
			
			pbJalan2 = new PortalButton();
			pbJalan2.label = "slide to go";
			pbJalan2.x = 1640;
			pbJalan2.y = 800;
			pbJalan2.rotation = 0.26;
			pbJalan2.styleProvider = null;
			pbJalan2.defaultSkin = new Image(Assets.getTexture("LeafArrowUp"));
			pbJalan2.downSkin = new Image(Assets.getTexture("LeafArrowDown"));
			pbJalan2.addEventListener(Event.TRIGGERED, gotoJalan2);
			
			/** addChild */
			addChild(mcBg);
			addChild(filter);
			addChild(pbJalan2);
		}
		
		/* Portal */
		private function gotoJalan2(e:Event):void {
			gamePage.changeEnvironment(EnvironmentLocation.JALAN2);
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