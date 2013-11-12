package nme;


import openfl.Assets;


class AssetData {
	
	
	public static var library:Map <String, LibraryType>;
	public static var path:Map <String, String>;
	public static var type:Map <String, AssetType>;
	
	private static var initialized:Bool = false;
	
	
	public static function initialize ():Void {
		
		if (!initialized) {
			
			path = new Map<String, String> ();
			type = new Map<String, AssetType> ();
			library = new Map<String, LibraryType> ();
			
			path.set ("images/asteroid.png", "images/asteroid.png");
			type.set ("images/asteroid.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/background1.png", "images/background1.png");
			type.set ("images/background1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/background2.png", "images/background2.png");
			type.set ("images/background2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/background3.png", "images/background3.png");
			type.set ("images/background3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/background4.png", "images/background4.png");
			type.set ("images/background4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/background5.png", "images/background5.png");
			type.set ("images/background5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/background6.png", "images/background6.png");
			type.set ("images/background6.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/booster1.png", "images/booster1.png");
			type.set ("images/booster1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/booster2.png", "images/booster2.png");
			type.set ("images/booster2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/boosterdown.png", "images/boosterdown.png");
			type.set ("images/boosterdown.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/boosterup.png", "images/boosterup.png");
			type.set ("images/boosterup.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/bossy_explode.png", "images/bossy_explode.png");
			type.set ("images/bossy_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/bossy_idle.png", "images/bossy_idle.png");
			type.set ("images/bossy_idle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/brainy_explode.png", "images/brainy_explode.png");
			type.set ("images/brainy_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/brainy_idle.png", "images/brainy_idle.png");
			type.set ("images/brainy_idle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/enemy_missile.png", "images/enemy_missile.png");
			type.set ("images/enemy_missile.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/enemy_missile_explode.png", "images/enemy_missile_explode.png");
			type.set ("images/enemy_missile_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/malo1.png", "images/malo1.png");
			type.set ("images/malo1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/minion_explode.png", "images/minion_explode.png");
			type.set ("images/minion_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player_explode.png", "images/player_explode.png");
			type.set ("images/player_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player_missile.png", "images/player_missile.png");
			type.set ("images/player_missile.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player_missile_explode.png", "images/player_missile_explode.png");
			type.set ("images/player_missile_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player_spaceship.png", "images/player_spaceship.png");
			type.set ("images/player_spaceship.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("sounds/3.mp3", "sounds/3.mp3");
			type.set ("sounds/3.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("sounds/3.ogg", "sounds/3.ogg");
			type.set ("sounds/3.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("sounds/3.wav", "sounds/3.wav");
			type.set ("sounds/3.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("sound3", "sounds/3.wav");
			type.set ("sound3", Reflect.field (AssetType, "sound".toUpperCase ()));
			
			
			initialized = true;
			
		}
		
	}
	
	
}