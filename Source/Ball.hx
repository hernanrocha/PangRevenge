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
	
	var explosion:Animation;
	
	// Constantes
	var g:Float;
	var s0:Float;
	var yMin:Float;
	
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
		
		bitmap = new Bitmap (Assets.getBitmapData("images/ball3.png"));
		
		addChild (bitmap);
		bitmap.x = 0;
		bitmap.y = 0;		
		delta = 3;
		x = x0;
		y = param_s0;
		
		
		g = 0.025;
		s0 = param_s0;		
		t = t0;
		v0 = 0;
		subiendo = false;
		
		yMin = param_s0;
		
		trace("Colocando en(" + x + "," + y + ")");
		
		explosion = new Animation( Assets.getBitmapData("images/explosion.png"), 1, 5);
		addChild(explosion);
		hijos.push(explosion);
		explosion.visible = false;
		explosion.x = 0;
		explosion.y = 0;
	}
	
	override function updateLogic(time:Float) {
		if (InputManager.getInstance().keyPressed("A".charAt(0))) {
			bitmap.visible = false;
			explosion.visible = true;
			explosion.updateLogic(time);
			//trace("Explotando");
		}else{
			explosion.reinit();
			explosion.visible = false;
			bitmap.visible = true;
			
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
		
		trace("Moviendo a (" + x + "," + y + ")");
		
		// Calcular colision en X
		if ((x + width > Screen.WIDTH) && (delta > 0)) {
			trace("Colision derecha");
			delta = -1 * delta;
			x = Screen.WIDTH - width;
		}else if ( ( x < 0) && (delta < 0) ) {
			trace("Colision izquierda");
			delta = -1 * delta;
			x = 0;
		}
		
		// Calcular colision en Y
		if ( (y + height >= Screen.HEIGHT) ) {
			subiendo = true;
			y = Screen.HEIGHT - height;
			trace(y + "+" + height + ">" + Screen.HEIGHT + ": Rebota. Sube");
		}else if (y <= yMin) {
			subiendo = false;
			trace("Comienza a caer de nuevo");
		}
		
		}
	}
}