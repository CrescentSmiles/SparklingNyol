package  
{
	import starling.animation.IAnimatable;
	import starling.animation.Juggler;
	/**
	 * ...
	 * @author zain
	 */
	public class GameJuggler 
	{
		private static var instance:GameJuggler;
		private static var gameAnimator:Juggler;
		
		public function GameJuggler(singleton:SingletonEnforcer):void
		{
			gameAnimator = new Juggler();
		}
		
		/** instance checker */
		private static function tryinit():void {
			if ( instance == null ) instance = new GameJuggler( new SingletonEnforcer() );
		}
		
		public static function add(art:IAnimatable):void {
			tryinit();
			gameAnimator.add(art);
		}
		
		public static function advanceTime(passedTime:Number):void {
			tryinit();
			gameAnimator.advanceTime(passedTime);
		}
		
		public static function tween(target:Object, time:Number, properties:Object):void {
			tryinit();
			gameAnimator.tween(target, time, properties);
		}
		
		public static function delayedCall(call:Function, delay:Number):void {
			tryinit();
			gameAnimator.delayCall(call, delay);
		}
		
		public static function remove(art:IAnimatable):void {
			tryinit();
			gameAnimator.removeTweens(art);
			gameAnimator.remove(art);
		}
		
	}

}

class SingletonEnforcer
{
	//nothing
}