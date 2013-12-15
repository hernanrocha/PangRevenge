package engine.graphics;

import engine.GameElement;
import flash.display.Bitmap;

/**
 * ...
 * @author juampi92
 */
class Transitioner extends GameElement
{
	private var sprites:Array<Bitmap>;
	private var iterador:Int = 0;
	private var next:Int = 1;
	private var dyn_alpha:Float = 0;
	private var hold_time:Float = 0;
	
	public var tiempo_trans:Float = 5;
	public var veloc_transp:Float = 5;
	
	public var onEvent:Bool = false;
	public var onTransit:Bool = false;

	public function new() {
		super();
		
		sprites = new Array<Bitmap>();
	}
	
	public function push ( btm:Bitmap ) {
		sprites.push(btm);
	}
	
	public function init(it:Int = 0) {
		iterador = it;
		next = (it + 1) % sprites.length;
		
		addChild(sprites[iterador]);
		addChild(sprites[next]);
		sprites[iterador].visible = sprites[next].visible = true;
		sprites[iterador].alpha = 1;
		sprites[next].alpha = 0;
		hold_time = tiempo_trans;
		dyn_alpha = 0;
	}
	
	public function config(tiemp_trans:Float = -1 , veloc_transp:Float = -1) {
		if ( tiemp_trans >= 0 ) this.tiempo_trans = tiemp_trans;
		if ( veloc_transp >= 0 ) this.veloc_transp = veloc_transp;
	}
	
	override function updateLogic(time:Float) {
		if ( onEvent ) {
			if ( onTransit ) {
				transicion(time);
			}
		} else
			transicion(time);	
	}
	
	public function onChange(e:Int) {
		onTransit = true;
	}
	
	private function end_transicion() {
		if ( onEvent )
			onTransit = false;
		hold_time = tiempo_trans;
	}
	
	private function transicion(time:Float) {
		if ( hold_time <= 0 ) {
			hold_time = 0;
			
			if ( dyn_alpha < 1 ) {
				
				//sprites[iterador].visible = sprites[next].visible = true;
				
				sprites[iterador].alpha = (1-dyn_alpha);
				sprites[next].alpha = dyn_alpha;
				
				dyn_alpha += time / veloc_transp;
			} else {
				sprites[iterador].alpha = sprites[next].alpha = 1;
				removeChild(sprites[iterador]);
				
				iterador = next;
				next = (iterador + 1) % sprites.length;
				
				var sig:Bitmap = sprites[next];
				sig.alpha = 0;
				addChild(sig);
				
				end_transicion();
				dyn_alpha = 0;
			}
		} else
				hold_time -= time;
	}	
}