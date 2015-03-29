package  
{
	import flash.utils.*;
	import pages.*;
	import spine.starling.*;
	import starling.animation.*;
	import starling.display.*;
	import starling.events.*;
	import starling.display.Sprite;
	
	
	/**
	 * ...
	 * @author zain
	 */
	public class Game extends Sprite implements IAnimatable 
	{
		/*
		[Embed(source = "../assets/spine/april/direction1.json", mimeType = "application/octet-stream")]
		static public const AprilJson:Class;
		
		[Embed(source = "../assets/spine/april/direction1.atlas", mimeType = "application/octet-stream")]
		static public const AprilAtlas:Class;
		
		[Embed(source = "../assets/spine/april/direction1.png")]
		static public const AprilAtlasTexture:Class;
		*/
		private var skeleton:SkeletonAnimation;
		private var skeleton2:SkeletonAnimation;
		private var gunGrabbed:Boolean;
		
		public function Game() 
		{
			super();
			Config.log("new Game()");
			
			//loadGame();
			if (stage) {
				initialize();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, initialize);
			}
		}
		
		private function initialize(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, initialize);
			
			changeState(GameState.WELCOME_PAGE);
			
			/** StartGame */
			t0 = getTimer();
			
			/** addEventListener */
			this.addEventListener(Event.ENTER_FRAME, gameTick);
		}
		
		/** test area */
		/*
		private function loadGame():void {
			
			startGame();
		}
		
		private function startGame():void {
			trace("startGame");
			
			var bg:Jalan1 = new Jalan1();
			addChild(bg);
			
			var april:PlayerApril = new PlayerApril();
			april.x = 1420;
			april.y = 840;
			addChild(april);
			
		}
		
		private function loadPage():void {
			//load Asset
		}
		
		private function showPage():void {
			
		}
		*/
		
		/** GameState */
		private var currentState:IPage;
		public function changeState(state:int, withLoader:Boolean = true):void {
			Config.log("changeState: " + state);
			
			if(currentState != null) {
				currentState.destroy();
				removeChild(Sprite(currentState));
				currentState = null;
			}
			
			if (withLoader) {
				currentState = new PageLoader(this, state);
			}else{
				switch(state) {
					case GameState.WELCOME_PAGE:
						currentState = new WelcomePage(this);
						break;
					case GameState.GAME_WALK:
						currentState = new GamePage(this);
						break;
					default:
						Config.log("unusual changeState: default");
						break;
				}
			}
			
			addChild(currentState as Sprite);
		}
		
		/** GameAnimation */
		
		//time calculator
		private var t0:Number;
		private var t1:Number;
		private var dt:Number;
		
		private function gameTick(e:Event):void {
			t1 = getTimer();
			dt = (t1 - t0) / 1000;
			t0 = t1;
			
			GameJuggler.advanceTime(dt*Config.gameSpeed);
		}
		
		/** instance handler */
		public function destroy():void {
			
		}
		
		/* INTERFACE starling.animation.IAnimatable */
		
		public function advanceTime(time:Number):void 
		{
			
		}
		
	}

}