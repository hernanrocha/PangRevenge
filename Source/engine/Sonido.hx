package engine;

import flash.media.Sound;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import flash.media.SoundLoaderContext;
import flash.net.URLRequest;
import motion.Actuate;
import motion.Actuate.transform;
import motion.easing.*;
import flash.events.Event;
import motion.easing.Expo.ExpoEaseOut;


/**
 * ...
 * @author CAIMMI, Brian
 */
class Sonido
{
	
	private var posicion:Float;
	private var sonidoActual:Sound;
	private var canalActual:SoundChannel;
	public static inline var MENU = "menu.mp3";
	public static inline var LEVEL1 = "level1.mp3";
	public static inline var LEVEL2 = "level2.mp3";
	public static inline var LEVEL3 = "level3.mp3";
	public static inline var LEVEL4 = "level4.mp3";
	public static inline var EPRO = "epro.mp3";
	public static inline var DISPARO = "disparo2.mp3";
	public static inline var POWERUP = "powerup.mp3";
	public static inline var EXPLO1 = "explo_comun.mp3";
	public static inline var GOLPE = "golpe.mp3";
	public static inline var HELP = "help.mp3";
	public static inline var VOLVER = "volver.mp3";
	public static inline var BOSS1 = "boss1.mp3";
	public static inline var BOSS2 = "boss2.mp3";
	
	public function new(url:String) 
	{
		
		//Seteo el sonido.
		posicion = 0;
		sonidoActual = new Sound();
		var req:URLRequest = new URLRequest(url); 
		var context:SoundLoaderContext = new SoundLoaderContext(1000,true); 
		sonidoActual.load(req, context);
		canalActual = sonidoActual.play (posicion);
		canalActual.stop();
	}
	
	public function pauseSound(fadeOut:Float = 1):Void {
		
		Actuate.transform (canalActual, fadeOut).sound (0, 0).ease(Quad.easeOut).onComplete (function () {
			posicion = canalActual.position;
			trace("posicion pausada " + posicion);
			canalActual.removeEventListener (Event.SOUND_COMPLETE, canalTerminoSonido);
			canalActual.stop ();
			canalActual.soundTransform.volume = 0;
			canalActual = null;
		}); 
		
	}
	
	public function playSound(fadeIn:Float = 3,principio:Bool):Void {
		if ( principio )
			posicion = 0;
		
			trace("Reproduciendo desde la posicion " + posicion);
            canalActual = sonidoActual.play (posicion, 99, new SoundTransform (0 , 0));
		    Actuate.transform (canalActual, fadeIn).sound (1, 0).ease(Quad.easeIn).onComplete( function() {
				canalActual.soundTransform.volume = 1;
			});
		
		canalActual.addEventListener (Event.SOUND_COMPLETE, canalTerminoSonido);
	}

	public function justPlay() {
		sonidoActual.play();
	}
	
	private function canalTerminoSonido (event:Event) {
		posicion = 0;
		this.playSound(true);
    }
	
}