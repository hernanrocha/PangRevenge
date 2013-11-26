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
	//var bitmap:Bitmap;
	var delta:Int;
	var deltaY:Float;
	var h:Int;
	var subiendo:Bool;
	public var exploto:Bool;
	var explosion:Animation;
	
	var tipo:Int;
	var screen:Screen;
	
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
	
	public static var BOUNCE_TIPO_2:Rectangle =  new Rectangle(0, 0, 75, 75);
	public static var BOUNCE_TIPO_3:Rectangle =  new Rectangle(0, 0, 50, 50);
	public static var BOUNCE_TIPO_4:Rectangle =  new Rectangle(0, 0, 25, 25);
	
	public function new(p_screen:Screen, p_tipo:Int, p_x0:Int, dirIzquierda:Bool) 
	{
		super();
		
		// Explosion
		explosion = new Animation( Assets.getBitmapData("images/explosion" + p_tipo + ".png"), 1, 5);
		addChild(explosion);
		hijos.push(explosion);
		
		screen = p_screen;
		tipo = p_tipo;
		if (tipo == TIPO_4) {
			// Datos por defecto
			delta = 3;
			t = 0.01;
			v0 = 0;
			subiendo = false;
			g = 0.025;	
			
			// Datos configurables
			y = yMin = s0 = Screen.SCREEN_HEIGHT - 250;
			x = p_x0;			
			
			// Boundings
			boundingBox = BOUNCE_TIPO_4;
		}else if (tipo == TIPO_3) {
			// Datos por defecto
			delta = 3;
			t = 0.01;
			v0 = 0;
			subiendo = false;
			g = 0.025;	
			
			// Datos configurables
			y = yMin = s0 = Screen.SCREEN_HEIGHT - 350;
			x = p_x0;
			
			// Boundings
			boundingBox = BOUNCE_TIPO_3;
		}else if (tipo == TIPO_2) {
			// Datos por defecto
			delta = 3;
			t = 0.01;
			v0 = 0;
			subiendo = false;
			g = 0.025;	
			
			// Datos configurables
			y = yMin = s0 = Screen.SCREEN_HEIGHT - 450;
			x = p_x0;
			
			// Boundings
			boundingBox = BOUNCE_TIPO_2;
		}
		
		// Direccion en x
		if (dirIzquierda) {
			delta = -1 * delta;
		}
	
		
		trace("Colocando en(" + x + "," + y + ")");
	}
	
	public function reventar() {
		exploto = true;
		screen.desactivarPelota(this);
		explosion.activateAnimation();
		
		// Determinar si es necesario crear otras bolas
		if (tipo != TIPO_4) {
			trace("Crear pelotas");
			screen.agregarPelota(new Ball(screen, tipo + 1, Std.int(x), true));
			screen.agregarPelota(new Ball(screen, tipo + 1, Std.int(x), false));
		}
	}
	
	override function updateLogic(time:Float) {
		//if (InputManager.getInstance().keyPressed("A")) {
			super.updateLogic(time);
		
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
			if ((x + boundingBox.width > Screen.SCREEN_WIDTH) && (delta > 0)) {
				delta = -1 * delta;
				x = Screen.SCREEN_WIDTH - boundingBox.width;
			}else if ( ( x < 0) && (delta < 0) ) {
				delta = -1 * delta;
				x = 0;
			}
			
			// Calcular colision en Y
			if ( (y + boundingBox.height >= Screen.SCREEN_HEIGHT) ) {
				subiendo = true;
				y = Screen.SCREEN_HEIGHT - boundingBox.height;
				//trace(y + "+" + height + ">" + Screen.HEIGHT + ": Rebota. Sube");
			}else if (y <= yMin) {
				subiendo = false;
				//trace("Comienza a caer de nuevo");
			}
			
			if (explosion.finalizo()) {
				screen.eliminarPelota(this);
			}
		//}		
	}
}