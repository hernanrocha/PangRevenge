package engine;

import flash.display.Stage;
import flash.events.KeyboardEvent;

class InputManager {
	
	private var teclas:Array<Bool>;
	private static var instancia:InputManager;
	
	public static var config:Map<String,Int> = null;
	public static inline var LEFT_ARROW:Int = 37;	
	public static inline var RIGHT_ARROW:Int = 39;
	
	private function new () {
		teclas = new Array<Bool>();		
		
		config = new Map<String, Int>();
		
		// Teclas jugador 1
		config.set("P1_LEFT", LEFT_ARROW);
		config.set("P1_RIGHT", RIGHT_ARROW);
		config.set("P1_FIRE", "Z".charCodeAt(0));
		config.set("P1_JUMP", "X".charCodeAt(0));		
		
		// Teclas jugador 2
		config.set("P2_LEFT", "J".charCodeAt(0));
		config.set("P2_RIGHT", "L".charCodeAt(0));
		config.set("P2_FIRE", "Q".charCodeAt(0));
		config.set("P2_JUMP", "W".charCodeAt(0));
		
		config.set("PAUSE", "P".charCodeAt(0));
		config.set("DEBUG_BALL_POSITION", "B".charCodeAt(0));
		config.set("DEBUG_END_LEVEL", "N".charCodeAt(0));
		config.set("DEBUG_UNLOCK_SCENES", "U".charCodeAt(0));
	}
	
	public static function init(stage:Stage) {		
		instancia = new InputManager();
		instancia.suscribe(stage);
	}
	
	public function suscribe(stage:Stage) {		
		// Suscribirse a los Eventos del Teclado
		stage.addEventListener(flash.events.KeyboardEvent.KEY_UP, onKeyUp);
		stage.addEventListener(flash.events.KeyboardEvent.KEY_DOWN, onKeyDown);
	}

	// Cuando se Suelta una Tecla
    private function onKeyUp(event:KeyboardEvent){
    	teclas[event.keyCode] = false;		
    }

	// Cuando se Presiona una Tecla
    private function onKeyDown(event:KeyboardEvent){
		trace('Tecla ' + event.keyCode);
		teclas[event.keyCode] = true;		
    }
    
	// Saber si una tecla esta presionada
    public static function keyPressed(key:String):Bool{
    	return instancia.teclas[key.charCodeAt(0)];    
    }
	   
	public static function keyCodePressed(keyCode:Int):Bool{
    	return instancia.teclas[keyCode];    
    }
	
	public static function keyActionPressed(keyAction:String):Bool{
    	return InputManager.keyCodePressed(InputManager.config.get(keyAction));    
    }
    
}
