package;

import flash.display.Sprite;
import flash.Lib;
import flash.display.Bitmap;
import openfl.Assets;
import flash.media.Sound;
import flash.events.Event;
/**
 * ...
 * @author fbricker
 */
class PangRevenge extends Sprite {

	private var sound:flash.media.Sound;
	private var totalTime:Float;
	
	private var screen:Screen;

	public function new () {
		super();
		
		screen = new Screen();
		screen.x = 20;
		screen.y = 20;
		addChild(screen);
		
		totalTime = 0;
		
		// Agregar EventListener
		InputManager.getInstance().suscribe(stage);
		stage.addEventListener(flash.events.Event.ENTER_FRAME, gameLoop);		
	}
	
	// Nuestro gameLoop (se ejecuta antes de cada cuadro).
	function gameLoop(e){
		var time=1/60;
		totalTime += time;
		
		screen.updateLogic(time);
	}
}