package nme;


import openfl.Assets;


class AssetData {

	
	public static var className = new #if haxe3 Map <String, #else Hash <#end Dynamic> ();
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();
	
	private static var initialized:Bool = false;
	
	
	public static function initialize ():Void {
		
		if (!initialized) {
			
			className.set ("images/fondo_invierno.jpg", nme.NME_images_fondo_invierno_jpg);
			type.set ("images/fondo_invierno.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/fondo_otoño.jpg", nme.NME_images_fondo_oto_o_jpg);
			type.set ("images/fondo_otoño.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/fondo_primavera.jpg", nme.NME_images_fondo_primavera_jpg);
			type.set ("images/fondo_primavera.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/fondo_verano.jpg", nme.NME_images_fondo_verano_jpg);
			type.set ("images/fondo_verano.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/pelotita.png", nme.NME_images_pelotita_png);
			type.set ("images/pelotita.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/asteroid.png", nme.NME_images_shooter_asteroid_png);
			type.set ("images/shooter/asteroid.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/background1.png", nme.NME_images_shooter_background1_png);
			type.set ("images/shooter/background1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/background2.png", nme.NME_images_shooter_background2_png);
			type.set ("images/shooter/background2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/background3.png", nme.NME_images_shooter_background3_png);
			type.set ("images/shooter/background3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/background4.png", nme.NME_images_shooter_background4_png);
			type.set ("images/shooter/background4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/background5.png", nme.NME_images_shooter_background5_png);
			type.set ("images/shooter/background5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/background6.png", nme.NME_images_shooter_background6_png);
			type.set ("images/shooter/background6.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/booster1.png", nme.NME_images_shooter_booster1_png);
			type.set ("images/shooter/booster1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/booster2.png", nme.NME_images_shooter_booster2_png);
			type.set ("images/shooter/booster2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/boosterdown.png", nme.NME_images_shooter_boosterdown_png);
			type.set ("images/shooter/boosterdown.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/boosterup.png", nme.NME_images_shooter_boosterup_png);
			type.set ("images/shooter/boosterup.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/bossy_explode.png", nme.NME_images_shooter_bossy_explode_png);
			type.set ("images/shooter/bossy_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/bossy_idle.png", nme.NME_images_shooter_bossy_idle_png);
			type.set ("images/shooter/bossy_idle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/brainy_explode.png", nme.NME_images_shooter_brainy_explode_png);
			type.set ("images/shooter/brainy_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/brainy_idle.png", nme.NME_images_shooter_brainy_idle_png);
			type.set ("images/shooter/brainy_idle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/enemy_missile.png", nme.NME_images_shooter_enemy_missile_png);
			type.set ("images/shooter/enemy_missile.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/enemy_missile_explode.png", nme.NME_images_shooter_enemy_missile_explode_png);
			type.set ("images/shooter/enemy_missile_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/malo1.png", nme.NME_images_shooter_malo1_png);
			type.set ("images/shooter/malo1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/minion_explode.png", nme.NME_images_shooter_minion_explode_png);
			type.set ("images/shooter/minion_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/player_explode.png", nme.NME_images_shooter_player_explode_png);
			type.set ("images/shooter/player_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/player_missile.png", nme.NME_images_shooter_player_missile_png);
			type.set ("images/shooter/player_missile.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/player_missile_explode.png", nme.NME_images_shooter_player_missile_explode_png);
			type.set ("images/shooter/player_missile_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("images/shooter/player_spaceship.png", nme.NME_images_shooter_player_spaceship_png);
			type.set ("images/shooter/player_spaceship.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("sounds/3.mp3", nme.NME_sounds_3_mp3);
			type.set ("sounds/3.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			className.set ("sounds/3.ogg", nme.NME_sounds_3_ogg);
			type.set ("sounds/3.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			className.set ("sounds/3.wav", nme.NME_sounds_3_wav);
			type.set ("sounds/3.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			className.set ("sound3", nme.NME_sounds_4);
			type.set ("sound3", Reflect.field (AssetType, "sound".toUpperCase ()));
			
			
			initialized = true;
			
		}
		
	}
	
	
}


class NME_images_fondo_invierno_jpg extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_fondo_oto_o_jpg extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_fondo_primavera_jpg extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_fondo_verano_jpg extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_pelotita_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_asteroid_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_background1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_background2_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_background3_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_background4_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_background5_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_background6_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_booster1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_booster2_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_boosterdown_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_boosterup_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_bossy_explode_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_bossy_idle_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_brainy_explode_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_brainy_idle_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_enemy_missile_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_enemy_missile_explode_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_malo1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_minion_explode_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_player_explode_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_player_missile_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_player_missile_explode_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_images_shooter_player_spaceship_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_sounds_3_mp3 extends flash.media.Sound { }
class NME_sounds_3_ogg extends flash.media.Sound { }
class NME_sounds_3_wav extends flash.media.Sound { }
class NME_sounds_4 extends flash.media.Sound { }
