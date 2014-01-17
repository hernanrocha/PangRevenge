package engine.graphics;

import engine.GameElement;
import engine.InputManager;
import flash.display.Bitmap;

class BackgroundSidescroller extends GameElement
{
	
	private var sprites:Array<Bitmap>;
	private var iterador:Int = 0;
	private var next:Int = -1;
	
	private var subscriptions:Dynamic = null;
	
	public var veloc:Float = 1;
	public var merge:Float = 0;
	public var sentido:Int = -1; // Izq
	public var w:Float;

	public function new(ancho:Float){
		super();
		sprites = new Array<Bitmap>();
		w = ancho;
	}
	
	public function push ( btm:Bitmap ) {
		sprites.push(btm);
	}
	
	public function init(it:Int = 0) {
		trace("Init");
		iterador = it;
		
		addChild(sprites[iterador]);
		sprites[iterador].x = sentido * merge;
	}
	
	override function updateLogic(time:Float) {
		//super.updateLogic(time);
		//trace("Update");
		
		if (InputManager.keyPressed("F")) {
			trace(sprites[iterador].x);
		}
		sprites[iterador].x += -1;
		
		/*if ( next >= 0 ) {
			sprites[next].x = sprites[next].x + sentido * veloc;
			if ( sprites[iterador].width + sprites[iterador].x <= 0 ) {
				removeChild(sprites[iterador]);
				iterador = next;
				next = -1;
			}
		} else {
			// Revisa cuando está el siguiente
			var btm:Bitmap = sprites[iterador];
			var offset:Float = btm.width + btm.x - merge - w;

			if ( offset <= 0 ) {
				next = (iterador + 1) % sprites.length;
				addChild(sprites[next]);
				sprites[next].x = w - offset;
				onChange();
			}
		}*/
		
	}
	
	public function subscribe(call:Dynamic) {
		subscriptions = call;
	}
	
	private function onChange() {
		if ( subscriptions != null ) subscriptions(iterador);
	}
	
}