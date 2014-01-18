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
			
			path.set ("assets/lvls.json", "assets/lvls.json");
			type.set ("assets/lvls.json", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("images/autumnMenu.png", "images/autumnMenu.png");
			type.set ("images/autumnMenu.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/back.png", "images/back.png");
			type.set ("images/back.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/bola1.png", "images/bola1.png");
			type.set ("images/bola1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/bola2.png", "images/bola2.png");
			type.set ("images/bola2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/bola3.png", "images/bola3.png");
			type.set ("images/bola3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/bola4.png", "images/bola4.png");
			type.set ("images/bola4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/bordeHorizontal.jpg", "images/bordeHorizontal.jpg");
			type.set ("images/bordeHorizontal.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/bordeVertical.jpg", "images/bordeVertical.jpg");
			type.set ("images/bordeVertical.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/boss1damage_l.png", "images/boss1damage_l.png");
			type.set ("images/boss1damage_l.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/boss1damage_r.png", "images/boss1damage_r.png");
			type.set ("images/boss1damage_r.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/boss1left.png", "images/boss1left.png");
			type.set ("images/boss1left.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/boss1right.png", "images/boss1right.png");
			type.set ("images/boss1right.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/boss2_anim.png", "images/boss2_anim.png");
			type.set ("images/boss2_anim.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/boss2_explode.png", "images/boss2_explode.png");
			type.set ("images/boss2_explode.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/boss_explosion.png", "images/boss_explosion.png");
			type.set ("images/boss_explosion.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/corazon.png", "images/corazon.png");
			type.set ("images/corazon.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/corazoninv.png", "images/corazoninv.png");
			type.set ("images/corazoninv.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/dmg_ice.png", "images/dmg_ice.png");
			type.set ("images/dmg_ice.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/explosion1.png", "images/explosion1.png");
			type.set ("images/explosion1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/explosion2.png", "images/explosion2.png");
			type.set ("images/explosion2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/explosion3.png", "images/explosion3.png");
			type.set ("images/explosion3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/explosion4.png", "images/explosion4.png");
			type.set ("images/explosion4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/explosionfuego1.png", "images/explosionfuego1.png");
			type.set ("images/explosionfuego1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/explosionfuego2.png", "images/explosionfuego2.png");
			type.set ("images/explosionfuego2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/explosionfuego3.png", "images/explosionfuego3.png");
			type.set ("images/explosionfuego3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/explosionfuego4.png", "images/explosionfuego4.png");
			type.set ("images/explosionfuego4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/explosionnieve1.png", "images/explosionnieve1.png");
			type.set ("images/explosionnieve1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/explosionnieve2.png", "images/explosionnieve2.png");
			type.set ("images/explosionnieve2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/explosionnieve3.png", "images/explosionnieve3.png");
			type.set ("images/explosionnieve3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/explosionnieve4.png", "images/explosionnieve4.png");
			type.set ("images/explosionnieve4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fireball1.png", "images/fireball1.png");
			type.set ("images/fireball1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fireball2.png", "images/fireball2.png");
			type.set ("images/fireball2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fireball3.png", "images/fireball3.png");
			type.set ("images/fireball3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fireball4.png", "images/fireball4.png");
			type.set ("images/fireball4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/flecha_default.png", "images/flecha_default.png");
			type.set ("images/flecha_default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/flecha_fuego.png", "images/flecha_fuego.png");
			type.set ("images/flecha_fuego.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/flecha_hielo.png", "images/flecha_hielo.png");
			type.set ("images/flecha_hielo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondos/BackAutumn.jpg", "images/fondos/BackAutumn.jpg");
			type.set ("images/fondos/BackAutumn.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondos/BackSpring.jpg", "images/fondos/BackSpring.jpg");
			type.set ("images/fondos/BackSpring.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondos/BackSummer.jpg", "images/fondos/BackSummer.jpg");
			type.set ("images/fondos/BackSummer.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondos/BackWinter.jpg", "images/fondos/BackWinter.jpg");
			type.set ("images/fondos/BackWinter.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondos/invierno.jpg", "images/fondos/invierno.jpg");
			type.set ("images/fondos/invierno.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondos/otonio.jpg", "images/fondos/otonio.jpg");
			type.set ("images/fondos/otonio.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondos/primavera.jpg", "images/fondos/primavera.jpg");
			type.set ("images/fondos/primavera.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondos/scroll_autumn.png", "images/fondos/scroll_autumn.png");
			type.set ("images/fondos/scroll_autumn.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondos/scroll_spring.png", "images/fondos/scroll_spring.png");
			type.set ("images/fondos/scroll_spring.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondos/scroll_summer.png", "images/fondos/scroll_summer.png");
			type.set ("images/fondos/scroll_summer.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondos/scroll_winter.png", "images/fondos/scroll_winter.png");
			type.set ("images/fondos/scroll_winter.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondos/verano.jpg", "images/fondos/verano.jpg");
			type.set ("images/fondos/verano.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/gancho.png", "images/gancho.png");
			type.set ("images/gancho.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/hud_boss_life_back.png", "images/hud_boss_life_back.png");
			type.set ("images/hud_boss_life_back.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/hud_boss_life_front.png", "images/hud_boss_life_front.png");
			type.set ("images/hud_boss_life_front.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/keys.png", "images/keys.png");
			type.set ("images/keys.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/LevelAutumn.jpg", "images/LevelAutumn.jpg");
			type.set ("images/LevelAutumn.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/LevelSpring.jpg", "images/LevelSpring.jpg");
			type.set ("images/LevelSpring.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/LevelSummer.jpg", "images/LevelSummer.jpg");
			type.set ("images/LevelSummer.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/LevelWinter.jpg", "images/LevelWinter.jpg");
			type.set ("images/LevelWinter.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/menu_ayuda.png", "images/menu_ayuda.png");
			type.set ("images/menu_ayuda.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/menu_creditos.png", "images/menu_creditos.png");
			type.set ("images/menu_creditos.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/menu_opciones.png", "images/menu_opciones.png");
			type.set ("images/menu_opciones.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/menu_players.png", "images/menu_players.png");
			type.set ("images/menu_players.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/menu_players_boton.png", "images/menu_players_boton.png");
			type.set ("images/menu_players_boton.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/menu_stick.png", "images/menu_stick.png");
			type.set ("images/menu_stick.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/message_board.png", "images/message_board.png");
			type.set ("images/message_board.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/message_board_success.png", "images/message_board_success.png");
			type.set ("images/message_board_success.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/PangLogo.png", "images/PangLogo.png");
			type.set ("images/PangLogo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player1.png", "images/player1.png");
			type.set ("images/player1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player1der.png", "images/player1der.png");
			type.set ("images/player1der.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player1disparo.png", "images/player1disparo.png");
			type.set ("images/player1disparo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player1izq.png", "images/player1izq.png");
			type.set ("images/player1izq.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player1shield.png", "images/player1shield.png");
			type.set ("images/player1shield.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player2.png", "images/player2.png");
			type.set ("images/player2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player2der.png", "images/player2der.png");
			type.set ("images/player2der.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player2disparo.png", "images/player2disparo.png");
			type.set ("images/player2disparo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player2izq.png", "images/player2izq.png");
			type.set ("images/player2izq.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/player2shield.png", "images/player2shield.png");
			type.set ("images/player2shield.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/popup_board.png", "images/popup_board.png");
			type.set ("images/popup_board.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/popup_close.png", "images/popup_close.png");
			type.set ("images/popup_close.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/powerups/arrow.png", "images/powerups/arrow.png");
			type.set ("images/powerups/arrow.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/powerups/doble_tiro.png", "images/powerups/doble_tiro.png");
			type.set ("images/powerups/doble_tiro.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/powerups/doble_tiro_down.png", "images/powerups/doble_tiro_down.png");
			type.set ("images/powerups/doble_tiro_down.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/powerups/doble_tiro_up.png", "images/powerups/doble_tiro_up.png");
			type.set ("images/powerups/doble_tiro_up.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/powerups/fast.png", "images/powerups/fast.png");
			type.set ("images/powerups/fast.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/powerups/hook.png", "images/powerups/hook.png");
			type.set ("images/powerups/hook.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/powerups/pause.png", "images/powerups/pause.png");
			type.set ("images/powerups/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/powerups/shield.png", "images/powerups/shield.png");
			type.set ("images/powerups/shield.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/powerups/slow.png", "images/powerups/slow.png");
			type.set ("images/powerups/slow.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/revenge.png", "images/revenge.png");
			type.set ("images/revenge.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/snowball1.png", "images/snowball1.png");
			type.set ("images/snowball1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/snowball2.png", "images/snowball2.png");
			type.set ("images/snowball2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/snowball3.png", "images/snowball3.png");
			type.set ("images/snowball3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/snowball4.png", "images/snowball4.png");
			type.set ("images/snowball4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/soga.png", "images/soga.png");
			type.set ("images/soga.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/soga_fija.png", "images/soga_fija.png");
			type.set ("images/soga_fija.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/soga_movimiento.png", "images/soga_movimiento.png");
			type.set ("images/soga_movimiento.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/springMenu.png", "images/springMenu.png");
			type.set ("images/springMenu.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/summerMenu.png", "images/summerMenu.png");
			type.set ("images/summerMenu.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/winterIsComing.jpg", "images/winterIsComing.jpg");
			type.set ("images/winterIsComing.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/winterMenu.png", "images/winterMenu.png");
			type.set ("images/winterMenu.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("fonts/7LED.ttf", nme.NME_fonts_7led_ttf);
			type.set ("fonts/7LED.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			className.set ("fonts/AnglesOctagon.ttf", nme.NME_fonts_anglesoctagon_ttf);
			type.set ("fonts/AnglesOctagon.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			className.set ("fonts/ARCADE.TTF", nme.NME_fonts_arcade_ttf);
			type.set ("fonts/ARCADE.TTF", Reflect.field (AssetType, "font".toUpperCase ()));
			className.set ("fonts/CHEESEBU.TTF", nme.NME_fonts_cheesebu_ttf);
			type.set ("fonts/CHEESEBU.TTF", Reflect.field (AssetType, "font".toUpperCase ()));
			className.set ("fonts/Crasng.ttf", nme.NME_fonts_crasng_ttf);
			type.set ("fonts/Crasng.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			className.set ("fonts/Crasns.ttf", nme.NME_fonts_crasns_ttf);
			type.set ("fonts/Crasns.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			className.set ("fonts/JOINTBYPIZZADUDE.ttf", nme.NME_fonts_jointbypizzadude_ttf);
			type.set ("fonts/JOINTBYPIZZADUDE.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			className.set ("fonts/menu.ttf", nme.NME_fonts_menu_ttf);
			type.set ("fonts/menu.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			
			
			initialized = true;
			
		}
		
	}
	
	
}






































































































class NME_fonts_7led_ttf extends flash.text.Font { }
class NME_fonts_anglesoctagon_ttf extends flash.text.Font { }
class NME_fonts_arcade_ttf extends flash.text.Font { }
class NME_fonts_cheesebu_ttf extends flash.text.Font { }
class NME_fonts_crasng_ttf extends flash.text.Font { }
class NME_fonts_crasns_ttf extends flash.text.Font { }
class NME_fonts_jointbypizzadude_ttf extends flash.text.Font { }
class NME_fonts_menu_ttf extends flash.text.Font { }
