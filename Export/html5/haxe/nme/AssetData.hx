package nme;


import openfl.Assets;


class AssetData {

	
	public static var className = new Map <String, Dynamic> ();
	public static var library = new Map <String, LibraryType> ();
	public static var path = new Map <String, String> ();
	public static var type = new Map <String, AssetType> ();
	
	private static var initialized:Bool = false;
	
	
	public static function initialize ():Void {
		
		if (!initialized) {
			
			path.set ("images/ball.png", "images/ball.png");
			type.set ("images/ball.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/ball3.png", "images/ball3.png");
			type.set ("images/ball3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/bola1.png", "images/bola1.png");
			type.set ("images/bola1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/bola2.png", "images/bola2.png");
			type.set ("images/bola2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/bola3.png", "images/bola3.png");
			type.set ("images/bola3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/bola4.png", "images/bola4.png");
			type.set ("images/bola4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/explosion.png", "images/explosion.png");
			type.set ("images/explosion.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/explosion1.png", "images/explosion1.png");
			type.set ("images/explosion1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/explosion2.png", "images/explosion2.png");
			type.set ("images/explosion2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/explosion3.png", "images/explosion3.png");
			type.set ("images/explosion3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/explosion4.png", "images/explosion4.png");
			type.set ("images/explosion4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondo_verano.jpg", "images/fondo_verano.jpg");
			type.set ("images/fondo_verano.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/gancho.png", "images/gancho.png");
			type.set ("images/gancho.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/gancho2.png", "images/gancho2.png");
			type.set ("images/gancho2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/ganchoinvierno.png", "images/ganchoinvierno.png");
			type.set ("images/ganchoinvierno.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/gancholargo.png", "images/gancholargo.png");
			type.set ("images/gancholargo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/ganchoverano.png", "images/ganchoverano.png");
			type.set ("images/ganchoverano.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/pelotita.png", "images/pelotita.png");
			type.set ("images/pelotita.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player1.png", "images/player1.png");
			type.set ("images/player1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player_missile.png", "images/player_missile.png");
			type.set ("images/player_missile.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player_missile_explode.png", "images/player_missile_explode.png");
			type.set ("images/player_missile_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player_spaceship.png", "images/player_spaceship.png");
			type.set ("images/player_spaceship.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/soga.png", "images/soga.png");
			type.set ("images/soga.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("sounds/3.mp3", "sounds/3.mp3");
			type.set ("sounds/3.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("sounds/3.ogg", "sounds/3.ogg");
			type.set ("sounds/3.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("sounds/3.wav", "sounds/3.wav");
			type.set ("sounds/3.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			className.set ("fonts/AnglesOctagon.ttf", nme.NME_fonts_anglesoctagon_ttf);
			type.set ("fonts/AnglesOctagon.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("sound3", "sounds/3.mp3");
			type.set ("sound3", Reflect.field (AssetType, "sound".toUpperCase ()));
			
			
			initialized = true;
			
		}
		
	}
	
	
}




























class NME_fonts_anglesoctagon_ttf extends flash.text.Font { }

