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
			
			path.set ("images/background1.png", "images/background1.png");
			type.set ("images/background1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/background3.png", "images/background3.png");
			type.set ("images/background3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/background5.png", "images/background5.png");
			type.set ("images/background5.png", Reflect.field (AssetType, "image".toUpperCase ()));
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
			path.set ("images/fondo_invierno.jpg", "images/fondo_invierno.jpg");
			type.set ("images/fondo_invierno.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondo_otonio.jpg", "images/fondo_otonio.jpg");
			type.set ("images/fondo_otonio.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondo_primavera.jpg", "images/fondo_primavera.jpg");
			type.set ("images/fondo_primavera.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondo_verano.jpg", "images/fondo_verano.jpg");
			type.set ("images/fondo_verano.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/gancho.png", "images/gancho.png");
			type.set ("images/gancho.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/gancho2.png", "images/gancho2.png");
			type.set ("images/gancho2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/ganchoinvierno.png", "images/ganchoinvierno.png");
			type.set ("images/ganchoinvierno.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/ganchoverano.png", "images/ganchoverano.png");
			type.set ("images/ganchoverano.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/malo1.png", "images/malo1.png");
			type.set ("images/malo1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/malo1_explode.png", "images/malo1_explode.png");
			type.set ("images/malo1_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/pelotita.png", "images/pelotita.png");
			type.set ("images/pelotita.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player1.png", "images/player1.png");
			type.set ("images/player1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player_explode.png", "images/player_explode.png");
			type.set ("images/player_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player_missile.png", "images/player_missile.png");
			type.set ("images/player_missile.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player_missile_explode.png", "images/player_missile_explode.png");
			type.set ("images/player_missile_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player_spaceship.png", "images/player_spaceship.png");
			type.set ("images/player_spaceship.png", Reflect.field (AssetType, "image".toUpperCase ()));
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

