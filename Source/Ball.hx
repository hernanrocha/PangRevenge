package ;
import flash.display.Bitmap;
import flash.display.Stage;
import openfl.Assets;

/**
 * ...
 * @author ...
 */
class Ball extends GameElement 
{
	var bitmap:Bitmap;
	var st:Stage;
	var delta:Int;
	var deltaY:Float;
	var h:Int;
	var subiendo:Bool;
	
	// Constantes
	var g:Float;
	var s0:Float;
	var yMax:Int;
	
	// Variables
	var t:Float;
	var ay:Float;
	var vy:Float;
	var v0:Float;
	var sy:Float;
	
	
	public function new(p, param_s0, t0, x0) 
	{
		super();
		
		st = p;
		
		bitmap = new Bitmap (Assets.getBitmapData("images/pelotita.png"));
		
		addChild (bitmap);
		bitmap.x = 0;
		bitmap.y = 0;		
		delta = 3;
		x = x0;
		y = 0;
		
		
		g = 0.025;
		s0 = param_s0;		
		t = t0;
		v0 = 0;
		yMax = 400;
		subiendo = false;
	}
	
	override function updateLogic(time:Float) {
		var incremento = time * 50;
		
		// Actualizar posicion X
		x += delta * incremento;
		
		// Actualizar tiempo acumulado
		if (subiendo) {			
			t -= incremento;
			if (t < 0) { t = 0; }
		}else {
			t += incremento;
		}
		
		// Calcular posicion Y
		ay = g;
		vy = v0 + ay * t;
		sy = 0.5 * ay * Math.pow(t, 2) + vy * t + s0;			
		y = sy;	
		
		// Calcular colision en X
		if ( ( (x + width > st.stageWidth) && (delta > 0) ) ||( ( x < 0) && (delta < 0) ) ) {
			delta = -1 * delta;
		}
		
		// Calcular colision en Y
		if ( (y + height >= yMax) ) {
			subiendo = true;
		}else if (y <= s0) {
			subiendo = false;
		}
	}
}