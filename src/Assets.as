package  
{
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import spine.atlas.Atlas;
	import spine.attachments.AtlasAttachmentLoader;
	import spine.attachments.AttachmentLoader;
	import spine.SkeletonData;
	import spine.SkeletonJson;
	import spine.starling.StarlingTextureLoader;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	/**
	 * ...
	 * @author zain
	 */
	public class Assets extends AssetManager
	{
		private static var instance:Assets;
		private static var _assets:AssetManager;
		
		private static var mSkeletonData:Dictionary;
		
		public function Assets(singleton:SingletonEnforcer):void {
			_assets = new AssetManager();
			_assets.verbose = true;
			mSkeletonData = new Dictionary();
		}
		
		/** instance checker */
		private static function tryinit():void {
			if ( instance == null ) instance = new Assets( new SingletonEnforcer() );
		}
		
		//{=== region: AssetManager ===
		public static function enqueue(...rawAssets):void {
			tryinit();
			_assets.enqueue(rawAssets);
		}
		
		public static function loadQueue(onProgress:Function):void {
			tryinit();
			
			_assets.loadQueue(onProgress);
		}
		
		public static function getByteArray(name:String):ByteArray {
			return _assets.getByteArray(name);
		}
		
		public static function getTexture(name:String):Texture {
			trace(_assets);
			return _assets.getTexture(name);
		}
		
		public static function getTextures(name:String):Vector.<Texture> {
			return _assets.getTextures(name);
		}
		
		//}=== endregion: AssetManager ===
		
		//{ === region: Spine Assets ===
		public static function loadSkeletonData(name:String, textureClasses:Object, atlasClass:Class, jsonClass:Class ):void {
			tryinit();
			
			if (name in mSkeletonData) {
			}else {
				
				// generate textureClasses's object
				var texturesObject:Object = new Object();
				for (var path:String in textureClasses){
					texturesObject[path] = new (textureClasses[path] as Class)();
				}
				
				var textureLoader:StarlingTextureLoader = new StarlingTextureLoader(texturesObject);
				var spineAtlas:Atlas = new Atlas(new atlasClass(), textureLoader);
				var attachmentLoader:AttachmentLoader = new AtlasAttachmentLoader(spineAtlas);
				var json:SkeletonJson = new SkeletonJson(attachmentLoader);
				
				mSkeletonData[name] = json.readSkeletonData(new jsonClass());
			}
		}
		
		public static function getSkeletonData(name:String):SkeletonData {
			return mSkeletonData[name];
		}
		//} === endregion: Spine Assets ===
	}

}

class SingletonEnforcer
{
	//nothing
}