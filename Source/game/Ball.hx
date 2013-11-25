package game;
import engine.GameElement;
import engine.InputManager;
import engine.Animation;
import flash.display.Bitmap;
import flash.geom.Rectangle;
import openfl.Assets;

/**
 * ...
 * @author ...
 */
class Ball extends GameElement 
{
	var bitmap:Bitmap;
	var delta:Int;
	var deltaY:Float;
	var h:Int;
	var subiendo:Bool;
	public var exploto:Bool;
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
	
	public static inline var TIPO_1:Int = 1;
	public static inline var TIPO_2:Int = 2;
	public static inline var TIPO_3:Int = 3;
	public static inline var TIPO_4:Int = 4;
	
	public static var BOUNCE_TIPO_4:Rectangle =  new Rectangle(0, 0, 25, 25);
	
	public function new(p_tipo:Int, p_x0:Int) 
	{
		super();
				
		// Bola
		bitmap = new Bitmap (Assets.getBitmapData("images/bola" + p_tipo + ".png"));		
		addChild (bitmap);
		bitmap.x = 0;
		bitmap.y = 0;
		
		// Explosion
		explosion = new Animation( Assets.getBitmapData("images/explosion" + p_tipo + ".png"), 1, 5);
		addChild(explosion);
		hijos.push(explosion);
		explosion.visible = false;
		explosion.x = 0;
		explosion.y = 0;
		
		
		if (p_tipo == TIPO_4) {
			// Datos por defecto
			delta = 3;
			t = 0.01;
			v0 = 0;
			subiendo = false;
			g = 0.025;	
			
			// Datos configurables
			y = yMin = s0 = Screen.HEIGHT - 250;
			x = p_x0;	
			
			
			// Boundings
			boundingBox = BOUNCE_TIPO_4;
		}
	
		
		trace("Colocando en(" + x + "," + y + ")");
	}
	
	public function reventar() {
		exploto = true;
		// Determinar si es necesario crear otras bolas
	}
	
	override function updateLogic(time:Float) {
		if (exploto){
			bitmap.visible = false;
			explosion.visible = true;
			explosion.updateLogic(time);
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
				//trace(y + "+" + height + ">" + Screen.HEIGHT + ": Rebota. Sube");
			}else if (y <= yMin) {
				subiendo = false;
				//trace("Comienza a caer de nuevo");
			}
		}		
	}
}