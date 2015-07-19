package 
{
	import flash.desktop.NativeApplication;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import net.hires.debug.Stats;
	import starling.core.Starling;
	import starling.utils.RectangleUtil;
	import starling.utils.ScaleMode;
	
	/**
	 * ...
	 * @author zain
	 */
	public class Main extends Sprite 
	{
		private const StageWidth:int  = 1920;
        private const StageHeight:int = 1080;
		
		private var myStarling:Starling;

		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			//Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// entry point
			
			var stats:Stats;
			stats = new Stats();
			stats.x = 60;
			this.addChild(stats);
			
			//this.addChild(Config.getTFOutput());
			
			var viewPort:Rectangle = RectangleUtil.fit(
				new Rectangle(0, 0, StageWidth, StageHeight), 
				new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight), 
				ScaleMode.SHOW_ALL
			);
			
			Starling.handleLostContext = true;
			myStarling = new Starling(Game, stage, viewPort);
			myStarling.stage.stageWidth = StageWidth;  // <- same size on all devices!
            myStarling.stage.stageHeight = StageHeight; // <- same size on all devices!
			myStarling.enableErrorChecking = true;
			myStarling.showStats = true;
			myStarling.antiAliasing = 1;
			myStarling.start();
			
			// new to AIR? please read *carefully* the readme.txt files!
		}
		
		private function deactivate(e:Event):void 
		{
			// make sure the app behaves well (or exits) when in background
			//NativeApplication.nativeApplication.exit();
		}
		
	}
	
}