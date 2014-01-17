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
	private var enabled:Bool = false;
	//private static inline var server: String = "http://bcaimmi.com.ar/sonidos/";
	private static inline var server: String = "http://localhost/PangRevenge/stream/";
	
	
	public function new() {
		
		//Creo el hash.	
		libreria = new Map<String,Sonido>();
		
		//No reproduzco nada.
		sonidoActual = null;
		
		
		addLibreria(Sonido.DISPARO);
		addLibreria(Sonido.POWERUP);
		addLibreria(Sonido.EXPLO1);
		addLibreria(Sonido.GOLPE);
		addLibreria(Sonido.VOLVER);
		addLibreria(Sonido.MENU);		
		addLibreria(Sonido.HELP);
		addLibreria(Sonido.LEVEL1);
	}
	
	public function addLibreria(sonido:String) {
		if ( ! enabled ) return;
		var son:Sonido = new Sonido(server + sonido);	
		libreria.set(sonido,son);
	}
	
	public function setSound(sonido:String,principio:Bool=false) {
		var son : Sonido = libreria.get(sonido);
		if ( son != null && son != sonidoActual) {		
			pause();
			sonidoActual = son;
			play(principio);
		}
	}
	
	private function pause() {
		if ( sonidoActual != null )
			sonidoActual.pauseSound();
	}
	
	private function play(principio:Bool) {
		if ( sonidoActual != null && enabled )
			sonidoActual.playSound(principio);
	}
	
	public function justPlay(sonido:String) {
		var son = libreria.get(sonido);
		if ( son != null && enabled )
			son.justPlay();
	}
	
	private function onPlaybackComplete(event:Event){ 
		sonidoActual.playSound(true);
	}
	
	public function enable() { enabled = true; }
	public function disable() { enabled = false; pause(); }
	
}