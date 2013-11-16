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
			
			path.set ("images/ball.png", "images/ball.png");
			type.set ("images/ball.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/explosion.png", "images/explosion.png");
			type.set ("images/explosion.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondo_invierno.jpg", "images/fondo_invierno.jpg");
			type.set ("images/fondo_invierno.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondo_otonio.jpg", "images/fondo_otonio.jpg");
			type.set ("images/fondo_otonio.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondo_primavera.jpg", "images/fondo_primavera.jpg");
			type.set ("images/fondo_primavera.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondo_verano.jpg", "images/fondo_verano.jpg");
			type.set ("images/fondo_verano.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/pelotita.png", "images/pelotita.png");
			type.set ("images/pelotita.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player1.png", "images/player1.png");
			type.set ("images/player1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/asteroid.png", "images/shooter/asteroid.png");
			type.set ("images/shooter/asteroid.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/background1.png", "images/shooter/background1.png");
			type.set ("images/shooter/background1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/background2.png", "images/shooter/background2.png");
			type.set ("images/shooter/background2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/background3.png", "images/shooter/background3.png");
			type.set ("images/shooter/background3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/background4.png", "images/shooter/background4.png");
			type.set ("images/shooter/background4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/background5.png", "images/shooter/background5.png");
			type.set ("images/shooter/background5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/background6.png", "images/shooter/background6.png");
			type.set ("images/shooter/background6.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/booster1.png", "images/shooter/booster1.png");
			type.set ("images/shooter/booster1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/booster2.png", "images/shooter/booster2.png");
			type.set ("images/shooter/booster2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/boosterdown.png", "images/shooter/boosterdown.png");
			type.set ("images/shooter/boosterdown.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/boosterup.png", "images/shooter/boosterup.png");
			type.set ("images/shooter/boosterup.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/bossy_explode.png", "images/shooter/bossy_explode.png");
			type.set ("images/shooter/bossy_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/bossy_idle.png", "images/shooter/bossy_idle.png");
			type.set ("images/shooter/bossy_idle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/brainy_explode.png", "images/shooter/brainy_explode.png");
			type.set ("images/shooter/brainy_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/brainy_idle.png", "images/shooter/brainy_idle.png");
			type.set ("images/shooter/brainy_idle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/enemy_missile.png", "images/shooter/enemy_missile.png");
			type.set ("images/shooter/enemy_missile.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/enemy_missile_explode.png", "images/shooter/enemy_missile_explode.png");
			type.set ("images/shooter/enemy_missile_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/malo1.png", "images/shooter/malo1.png");
			type.set ("images/shooter/malo1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/minion_explode.png", "images/shooter/minion_explode.png");
			type.set ("images/shooter/minion_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/player_explode.png", "images/shooter/player_explode.png");
			type.set ("images/shooter/player_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/player_missile.png", "images/shooter/player_missile.png");
			type.set ("images/shooter/player_missile.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/player_missile_explode.png", "images/shooter/player_missile_explode.png");
			type.set ("images/shooter/player_missile_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/shooter/player_spaceship.png", "images/shooter/player_spaceship.png");
			type.set ("images/shooter/player_spaceship.png", Reflect.field (AssetType, "image".toUpperCase ()));
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