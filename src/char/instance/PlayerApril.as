package char.instance 
{
	import char.Hero;
	import spine.flash.SkeletonAnimation;
	/**
	 * ...
	 * @author zain
	 */
	public class PlayerApril extends Hero
	{
		/** direction 1 */
		public static const SKELETON_1_NAME:String = "april1";
		
		[Embed(source = "../../../assets/spine/april/direction1.json", mimeType = "application/octet-stream")]
		public static const Json1:Class;
		
		[Embed(source = "../../../assets/spine/april/direction1.atlas", mimeType = "application/octet-stream")]
		public static const Atlas1:Class;
		
		[Embed(source = "../../../assets/spine/april/direction1.png")]
		public static const AtlasTexture1:Class;
		
		/** direction 2 */
		public static const SKELETON_2_NAME:String = "april2";
		
		[Embed(source = "../../../assets/spine/april/direction2.json", mimeType = "application/octet-stream")]
		public static const Json2:Class;
		
		[Embed(source = "../../../assets/spine/april/direction2.atlas", mimeType = "application/octet-stream")]
		public static const Atlas2:Class;
		
		[Embed(source = "../../../assets/spine/april/direction2.png")]
		public static const AtlasTexture2:Class;
		
		public function PlayerApril():void {
			super();
			/* skeleton name reference get from GamePage.as
			 * named for indexing
			 */
			super.registerSkeleton("april1", "april2", "april1", "april1", "april1", "april1", "april2", "april1");
		}
	}

}