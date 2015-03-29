package pages 
{
	import char.instance.PlayerApril;
	import environment.EnvironmentLoader;
	import environment.EnvironmentLocation;
	import environment.IEnvironment;
	import environment.instance.Jalan1;
	import environment.instance.Jalan2;
	import environment.instance.Jalan3;
	import environment.instance.NyolHome;
	import flash.geom.Point;
	import pages.IPage;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * ...
	 * @author zain
	 */
	public class GamePage extends Sprite implements IPage 
	{
		/** assets list */
		public static function loadAdditionalAssets():void {
			Assets.loadSkeletonData("april1", PlayerApril.AtlasTexture1, PlayerApril.Atlas1, PlayerApril.Json1);
			Assets.loadSkeletonData("april2", PlayerApril.AtlasTexture2, PlayerApril.Atlas2, PlayerApril.Json2);
		}
		
		/** Class */
		private var game:Game;
		
		/** GamePage layer */
		private var hero:PlayerApril;
		
		public function GamePage(game:Game) 
		{
			super();
			Config.log("[Page] GamePage");
			
			this.game = game;
			if (stage) {
				initialize();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, initialize);
			}
		}
		
		private function initialize(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, initialize);
			
			/** instantiate */
			changeEnvironment(EnvironmentLocation.JALAN1);
			
			hero = new PlayerApril();
			hero.x = 1420;
			hero.y = 840;
			
			GameJuggler.add(hero);
			
			/** addEventListener */
			this.addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		/** EnvironmentState */
		private var currentEnvironment:IEnvironment;
		public function changeEnvironment(location:int, withLoader:Boolean = true):void {
			Config.log("changeEnvironment: " + location);
			
			if (currentEnvironment != null) {
				currentEnvironment.destroy();
				removeChild(Sprite(currentEnvironment));
				currentEnvironment = null;
			}
			
			if (withLoader) {
				currentEnvironment = new EnvironmentLoader(this, location);
				addChild(currentEnvironment as Sprite);
			}else {
				switch(location) {
					case EnvironmentLocation.JALAN1:
						currentEnvironment = new Jalan1(this);
						break;
					case EnvironmentLocation.NYOL_HOME:
						currentEnvironment = new NyolHome(this);
						break;
					case EnvironmentLocation.JALAN2:
						currentEnvironment = new Jalan2(this);
						break;
					case EnvironmentLocation.JALAN3:
						currentEnvironment = new Jalan3(this);
						break;
					default:
						Config.log("unusual changeEnvironment: default");
						break;
				}
				addChild(currentEnvironment as Sprite);
				//should be insert in environment
				currentEnvironment.addHero(hero);
				
			}
			
			
		}
		
		/** interactive control */
		private function onTouch(e:TouchEvent):void {
			var touch:Touch = e.getTouch(this, TouchPhase.BEGAN);
			if (touch) {
				var touchPos:Point = touch.getLocation(this);
				trace("onTouch "+touchPos);
				trace("(" + touchPos.x + ", " + touchPos.y + ")");
				hero.walkToPoint(touchPos.x, touchPos.y);
			}else {
				//trace("not TouchPhase.BEGAN");
			}
		}
		
		/* INTERFACE pages.IPage */
		
		public function update():void 
		{
			
		}
		
		public function destroy():void 
		{
			
		}
		
	}

}