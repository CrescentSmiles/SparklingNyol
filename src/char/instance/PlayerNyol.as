package char.instance 
{
	import char.Hero;
	import spine.flash.SkeletonAnimation;
	/**
	 * ...
	 * @author zain
	 */
	public class PlayerNyol extends Hero
	{
		/** direction 3 */
		public static const SKELETON_3_NAME:String = "nyolD3";
		
		[Embed(source = "../../../assets/spine/nyol/D3.json", mimeType = "application/octet-stream")]
		public static const Json3:Class;
		
		[Embed(source = "../../../assets/spine/nyol/D3.atlas", mimeType = "application/octet-stream")]
		public static const Atlas3:Class;
		
		public static const PATH_D3:String = "D3.png";
		[Embed(source = "../../../assets/spine/nyol/D3.png")]
		public static const AtlasTexture3:Class;
		
		public static const PATH_D32:String = "D32.png";
		[Embed(source = "../../../assets/spine/nyol/D32.png")]
		public static const AtlasTexture32:Class;
		
		public static const PATH_D33:String = "D33.png";
		[Embed(source = "../../../assets/spine/nyol/D33.png")]
		public static const AtlasTexture33:Class;
		
		public function PlayerNyol():void {
			super();
			super.registerSkeleton(SKELETON_3_NAME, SKELETON_3_NAME, SKELETON_3_NAME, SKELETON_3_NAME, SKELETON_3_NAME, SKELETON_3_NAME, SKELETON_3_NAME, SKELETON_3_NAME);
		}
	}

}