package environment.instance 
{
	import char.Char;
	import environment.IEnvironment;
	import pages.GamePage;
	import feathers.controls.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.display.MovieClip;
	import starling.events.Event;
	/**
	 * ...
	 * @author zain
	 */
	public class Jalan1 extends Sprite implements IEnvironment 
	{
		/** list asset */
		[Embed(source="../../../assets/environment/Jalan1Image.jpg")]
		public static const Jalan1Image:Class;
		
		[Embed(source="../../../assets/ui/LeafArrowUp.png")]
		public static const LeafArrowUp:Class;
		
		[Embed(source = "../../../assets/ui/LeafArrowDown.png")]
		public static const LeafArrowDown:Class;
		
		private var gamePage:GamePage;
		
		/** environment layer */
		private var mcBg:MovieClip;
		
		/** portal */
		private var btHome:Button;
		
		public function Jalan1(gamePage:GamePage)
		{
			super();
			Config.log("[Environment] Jalan1");
			
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
			mcBg = new MovieClip(Assets.getTextures("Jalan1Image"));
			
			btHome = new Button()
			btHome.label = "slide to go";
			btHome.x = 1700;
			btHome.y = 400;
			btHome.styleProvider = null;
			btHome.defaultSkin = new Image(Assets.getTexture("LeafArrowUp"));
			btHome.downSkin = new Image(Assets.getTexture("LeafArrowDown"));
			
			/** addChild */
			addChild(mcBg);
			addChild(btHome);
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