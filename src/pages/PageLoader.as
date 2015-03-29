package pages 
{
	import starling.core.Starling;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author zain
	 */
	public class PageLoader extends Sprite implements IPage 
	{
		private var game:Game;
		private var targetClass:Class;
		private var nextState:int;
		
		public function PageLoader(game:Game, nextState:int) 
		{
			super();
			Config.log("[Page] PageLoader");
			
			this.game = game;
			this.targetClass = GameState.getClass(nextState);
			this.nextState = nextState;
			
			if (this.targetClass["loadAdditionalAssets"] != undefined) {
				this.targetClass["loadAdditionalAssets"]();
			}
			Assets.enqueue(this.targetClass);
			Assets.loadQueue(onLoading);
		}
		
		private function onLoading(ratio:Number):void {
			Config.log("Loading assets, progress: "+ ratio);
 
			// -> When the ratio equals '1', we are finished.
			if (ratio == 1.0) onAssetLoaded();
		}
		
		private function onAssetLoaded():void {
			Config.log(targetClass+" loaded");
			game.changeState(nextState, false);
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