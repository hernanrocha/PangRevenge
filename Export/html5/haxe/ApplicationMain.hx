#if !macro
#if (openfl_html5 && !flambe)

import PangRevenge;
import haxe.Resource;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.net.URLLoaderDataFormat;
//import flash.Assets;
import flash.Lib;

class ApplicationMain {

	private static var completed:Int;
	private static var preloader:NMEPreloader;
	private static var total:Int;

	public static var loaders:Map <String, Loader>;
	public static var urlLoaders:Map <String, URLLoader>;

	public static function main() {
		completed = 0;
		loaders = new Map <String, Loader>();
		urlLoaders = new Map <String, URLLoader>();
		total = 0;
		
		//flash.Lib.setPackage("", "PangRevenge", "mycompany.myapp", "1.0.0");
		flash.Lib.current.loaderInfo = flash.display.LoaderInfo.create (null);
		
		try {
			
			if (Reflect.hasField (js.Browser.window, "winParameters")) {
				
				Reflect.setField (flash.Lib.current.loaderInfo, "parameters", Reflect.field (js.Browser.window, "winParameters")());
				
			}
			
			flash.Lib.current.stage.loaderInfo = flash.Lib.current.loaderInfo;
			
		} catch (e:Dynamic) {}

		

		
		preloader = new NMEPreloader();
		
		Lib.current.addChild(preloader);
		preloader.onInit();

		
		
		var urlLoader:URLLoader = new URLLoader();
		urlLoader.dataFormat = BINARY;
		urlLoaders.set("assets/lvls.json", urlLoader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/autumnMenu.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/back.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/bola1.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/bola2.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/bola3.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/bola4.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/bordeHorizontal.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/bordeVertical.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/boss1damage_l.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/boss1damage_r.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/boss1left.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/boss1right.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/boss2_anim.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/boss2_explode.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/boss_explosion.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/corazon.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/corazoninv.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/dmg_ice.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/explosion1.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/explosion2.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/explosion3.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/explosion4.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/explosionfuego1.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/explosionfuego2.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/explosionfuego3.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/explosionfuego4.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/explosionnieve1.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/explosionnieve2.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/explosionnieve3.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/explosionnieve4.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fireball1.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fireball2.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fireball3.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fireball4.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/flecha_default.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/flecha_fuego.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/flecha_hielo.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fondos/BackAutumn.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fondos/BackSpring.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fondos/BackSummer.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fondos/BackWinter.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fondos/invierno.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fondos/otonio.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fondos/primavera.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fondos/scroll_autumn.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fondos/scroll_spring.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fondos/scroll_summer.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fondos/scroll_winter.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fondos/verano.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/gancho.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/hud_boss_life_back.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/hud_boss_life_front.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/keys.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/LevelAutumn.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/LevelSpring.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/LevelSummer.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/LevelWinter.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/menu_ayuda.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/menu_creditos.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/menu_opciones.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/menu_players.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/menu_players_boton.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/menu_stick.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/message_board.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/message_board_success.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/PangLogo.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/player1.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/player1der.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/player1disparo.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/player1izq.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/player1shield.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/player2.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/player2der.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/player2disparo.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/player2izq.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/player2shield.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/popup_board.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/popup_close.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/powerups/arrow.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/powerups/doble_tiro.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/powerups/doble_tiro_down.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/powerups/doble_tiro_up.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/powerups/fast.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/powerups/hook.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/powerups/pause.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/powerups/shield.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/powerups/slow.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/revenge.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/snowball1.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/snowball2.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/snowball3.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/snowball4.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/soga.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/soga_fija.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/soga_movimiento.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/springMenu.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/summerMenu.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/winterIsComing.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/winterMenu.png", loader);
		total ++;
		
		
		
		
		
		
		
		
		
		
		var resourcePrefix = "NME_:bitmap_";
		for (resourceName in Resource.listNames()) {
			if (StringTools.startsWith (resourceName, resourcePrefix)) {
				var type = Type.resolveClass(StringTools.replace (resourceName.substring(resourcePrefix.length), "_", "."));
				if (type != null) {
					total++;
					var instance = Type.createInstance (type, [ 0, 0, true, 0x00FFFFFF, bitmapClass_onComplete ]);
				}
			}
		}
		
		if (total == 0) {
			begin();
		} else {
			for (path in loaders.keys()) {
				var loader:Loader = loaders.get(path);
				loader.contentLoaderInfo.addEventListener("complete",
          loader_onComplete);
				loader.load (new URLRequest (path));
			}

			for (path in urlLoaders.keys()) {
				var urlLoader:URLLoader = urlLoaders.get(path);
				urlLoader.addEventListener("complete", loader_onComplete);
				urlLoader.load(new URLRequest (path));
			}
		}
	}

	private static function begin():Void {
		preloader.addEventListener(Event.COMPLETE, preloader_onComplete);
		preloader.onLoaded ();
	}
	
	private static function bitmapClass_onComplete(instance:BitmapData):Void {
		completed++;
		var classType = Type.getClass (instance);
		Reflect.setField (classType, "preload", instance);
		if (completed == total) {
			begin ();
		}
	}

	private static function loader_onComplete(event:Event):Void {
		completed ++;
		preloader.onUpdate (completed, total);
		if (completed == total) {
			begin ();
		}
	}

	private static function preloader_onComplete(event:Event):Void {
		preloader.removeEventListener(Event.COMPLETE, preloader_onComplete);
		Lib.current.removeChild(preloader);
		preloader = null;
		if (Reflect.field(PangRevenge, "main") == null)
		{
			var mainDisplayObj = Type.createInstance(DocumentClass, []);
			if (Std.is(mainDisplayObj, flash.display.DisplayObject))
				flash.Lib.current.addChild(cast mainDisplayObj);
		}
		else
		{
			Reflect.callMethod(PangRevenge, Reflect.field (PangRevenge, "main"), []);
		}
	}
}

@:build(DocumentClass.build())
class DocumentClass extends PangRevenge {}

#else

import PangRevenge;

class ApplicationMain {

	public static function main() {
		if (Reflect.field(PangRevenge, "main") == null) {
			Type.createInstance(PangRevenge, []);
		} else {
			Reflect.callMethod(PangRevenge, Reflect.field(PangRevenge, "main"), []);
		}
	}
}

#end
#else

import haxe.macro.Context;
import haxe.macro.Expr;

class DocumentClass {
	
	macro public static function build ():Array<Field> {
		var classType = Context.getLocalClass().get();
		var searchTypes = classType;
		while (searchTypes.superClass != null) {
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				var fields = Context.getBuildFields();
				var method = macro {
					return flash.Lib.current.stage;
				}
				fields.push ({ name: "get_stage", access: [ APrivate, AOverride ], kind: FFun({ args: [], expr: method, params: [], ret: macro :flash.display.Stage }), pos: Context.currentPos() });
				return fields;
			}
			searchTypes = searchTypes.superClass.t.get();
		}
		return null;
	}
	
}
#end
