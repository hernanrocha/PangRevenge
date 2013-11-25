#if !macro
#if (openfl_html5 && !flambe)

import HelloShooter;
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
		
		//flash.Lib.setPackage("", "HelloShooter", "mycompany.myapp", "1.0.0");
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

		
		
		var loader:Loader = new Loader();
		loaders.set("images/background1.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/background3.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/background5.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/ball.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/ball3.png", loader);
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
		loaders.set("images/booster1.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/booster2.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/boosterdown.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/boosterup.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/bossy_explode.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/bossy_idle.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/brainy_explode.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/brainy_idle.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/enemy_missile.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/enemy_missile_explode.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/explosion.png", loader);
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
		loaders.set("images/fondo_invierno.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fondo_otonio.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fondo_primavera.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fondo_verano.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/gancho.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/gancho2.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/ganchoinvierno.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/ganchoverano.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/malo1.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/malo1_explode.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/pelotita.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/player1.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/player_explode.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/player_missile.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/player_missile_explode.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/player_spaceship.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/asteroid.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/background1.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/background2.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/background3.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/background4.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/background5.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/background6.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/booster1.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/booster2.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/boosterdown.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/boosterup.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/bossy_explode.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/bossy_idle.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/brainy_explode.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/brainy_idle.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/enemy_missile.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/enemy_missile_explode.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/malo1.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/minion_explode.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/player_explode.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/player_missile.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/player_missile_explode.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/shooter/player_spaceship.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/soga.png", loader);
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
		if (Reflect.field(HelloShooter, "main") == null)
		{
			var mainDisplayObj = Type.createInstance(DocumentClass, []);
			if (Std.is(mainDisplayObj, flash.display.DisplayObject))
				flash.Lib.current.addChild(cast mainDisplayObj);
		}
		else
		{
			Reflect.callMethod(HelloShooter, Reflect.field (HelloShooter, "main"), []);
		}
	}
}

@:build(DocumentClass.build())
class DocumentClass extends HelloShooter {}

#else

import HelloShooter;

class ApplicationMain {

	public static function main() {
		if (Reflect.field(HelloShooter, "main") == null) {
			Type.createInstance(HelloShooter, []);
		} else {
			Reflect.callMethod(HelloShooter, Reflect.field(HelloShooter, "main"), []);
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
