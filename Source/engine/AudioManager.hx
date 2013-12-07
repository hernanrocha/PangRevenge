package engine;

import flash.media.Sound;
import flash.media.SoundChannel;
import flash.utils.Timer;
import openfl.Assets;
import engine.Sonido;
import flash.events.*;
import motion.Actuate;


/**
 * ...
 * @author CAIMMI, Brian
 */
class AudioManager
{

	private var libreria : Map<String,Sonido>;
	private var sonidoActual : Sonido;
	private var canal : SoundChannel;
	private static var audioM:AudioManager;
	//private static inline var server: String = "http://bcaimmi.com.ar/sonidos/";
	private static inline var server: String = "http://localhost/PangRevenge/stream/";
	
	
	public static function getInstance():AudioManager {
		if (audioM == null) {
			audioM = new AudioManager();
		}
		return audioM;
	}
	
	private function new() 
	{
		//Creo el hash.	
		libreria=new Map<String,Sonido>();		
		//No reproduzco nada.
		sonidoActual = null;		
	}
	
	public function addLibreria(sonido:String) {
		var son:Sonido = new Sonido(server + sonido);	
		libreria.set(sonido,son);
	}
	
	public function setSound(sonido:String,principio:Bool) {
		var son : Sonido = libreria.get(sonido);
		if ( son != null && son != sonidoActual) {
		
			pause();
			sonidoActual = son;
			play(principio);	
		}
	}
	
	private function pause() {
		if ( sonidoActual != null ) { 
			sonidoActual.pauseSound();
		}
	}
	
	private function play(principio:Bool) {
		if ( sonidoActual != null ) { 
			sonidoActual.playSound(principio);
		}
	}
	
	public function justPlay(sonido:String) {
		var son = libreria.get(sonido);
		if ( son != null ) { 
			son.justPlay();
		}
	}
	
	private function onPlaybackComplete(event:Event) 
	{ 
		sonidoActual.playSound(true);
	}
	
}