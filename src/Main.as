package 
{
	import flash.desktop.NativeApplication;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import net.hires.debug.Stats;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author zain
	 */
	public class Main extends Sprite 
	{
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
			
			Starling.handleLostContext = true;
			myStarling = new Starling(Game, stage);
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