package char 
{
	import flash.geom.Point;
	import spine.starling.SkeletonAnimation;
	import starling.animation.IAnimatable;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author zain
	 */
	public class Char extends Sprite implements IAnimatable
	{
		private var mSkeleton:Vector.<SkeletonAnimation>;
		
		public function Char() 
		{
			super();
			
			initialize();
		}
		
		/** initialize new Char */
		private function initialize():void {
			mSkeleton = new Vector.<SkeletonAnimation>();
			destination = new Point();
			state = CharState.STAND;
			speed = 260;
		}
		
		/** direction follow keyboard numpad with num pad 5 as center */
		protected function registerSkeleton(direction1:String, direction2:String, direction3:String, direction4:String, direction6:String, direction7:String, direction8:String, direction9:String):void {
			mSkeleton[0] = new SkeletonAnimation(Assets.getSkeletonData(direction1), false);
			mSkeleton[1] = new SkeletonAnimation(Assets.getSkeletonData(direction2), false);
			mSkeleton[2] = new SkeletonAnimation(Assets.getSkeletonData(direction3), false);
			mSkeleton[3] = new SkeletonAnimation(Assets.getSkeletonData(direction4), false);
			mSkeleton[4] = new SkeletonAnimation(Assets.getSkeletonData(direction6), false);
			mSkeleton[5] = new SkeletonAnimation(Assets.getSkeletonData(direction7), false);
			mSkeleton[6] = new SkeletonAnimation(Assets.getSkeletonData(direction8), false);
			mSkeleton[7] = new SkeletonAnimation(Assets.getSkeletonData(direction9), false);
			
			for (var i:int = 0; i < mSkeleton.length; i++) {
				addChild(mSkeleton[i]);
				mSkeleton[i].visible = false;
				Starling.juggler.add(mSkeleton[i]);
			}
			
			mSkeleton[0].visible = true;
			mSkeleton[0].state.setAnimationByName(0, "walk", true);
		}
		
		private function switchArt():void {
			
		}
		
		//{ === region: ANIMATION ===
		
		/** animation vars */
		private var state:int;
		private var destination:Point;
		private var speed:Number;
		
		public function act():void {
			
		}
		
		public function walkToPoint(x1:Number, y1:Number):void {
			destination.x = x1;
			destination.y = y1;
			
			state = CharState.WALK;
		}
		
		/* INTERFACE starling.animation.IAnimatable */
		public function advanceTime(passedTime:Number):void 
		{
			switch(state) {
				case CharState.STAND:
					
					break;
				case CharState.WALK:
					// distance current position with destination point
					var d01x:Number = destination.x - this.x;
					var d01y:Number = destination.y - this.y;
					var dc01:Number = Math.sqrt(d01x * d01x + d01y * d01y);
					
					if(speed * passedTime < dc01){
					//move this by (dx, dy)
					this.x += passedTime * speed * d01x / dc01;
					this.y += passedTime * speed * d01y / dc01;
					
					}else {
						this.x = destination.x;
						this.y = destination.y;
						
						//stop swim
						state = CharState.STAND;
						
						//arrive at destination, dispatch event
						dispatchEventWith(Event.COMPLETE);
					}
				
					break;
				case CharState.RUN:
					
					break;
				default:
					
					break;
			}
		}
		//} === endregion: ANIMATION ===
		
	}

}