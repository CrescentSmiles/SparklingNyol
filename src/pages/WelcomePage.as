package pages 
{
	import feathers.controls.Button;
	import flash.display.Bitmap;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import feathers.themes.MetalWorksDesktopTheme;
	
	/**
	 * ...
	 * @author zain
	 */
	public class WelcomePage extends Sprite implements IPage 
	{
		
		[Embed(source="../../assets/bg/welcomeBg.jpg")]
		public static const welcomeBg:Class;
		
		private var game:Game;
		
		/** display layer */
		private var mcBg:MovieClip;
		private var btPlay:Button;
		private var btExit:Button;
		
		public function WelcomePage(game:Game) 
		{
			super();
			Config.log("[Page] WelcomePage");
			
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
			new MetalWorksDesktopTheme();
			
			mcBg = new MovieClip(Assets.getTextures("welcomeBg"));
			btPlay = new Button();
			btExit = new Button();
			
			/** set properties */
			btPlay.label = "Play";
			btPlay.x = 1080;
			btPlay.y = 670;
			btPlay.setSize(500, 155);
			
			btExit.label = "Exit";
			btExit.x = 1080;
			btExit.y = 856;
			btExit.setSize(500, 155);
			
			/** addEventListener */
			btPlay.addEventListener(Event.TRIGGERED, onBtPlay);
			
			/** addChild */
			addChild(mcBg);
			addChild(btPlay);
			addChild(btExit);
		}
		
		private function onBtPlay(e:Event):void {
			game.changeState(GameState.GAME_WALK);
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