package game.ball;

import engine.GameElement;
import engine.InputManager;
import engine.Animation;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Rectangle;
import game.Screen;
import openfl.Assets;
import scenes.GameScene;

/**
 * ...
 * @author ...
 */
class Ball extends GameElement 
{
	// Sprite
	var ballSprite:Bitmap;
	var ballAnimation:Animation;	
	
	// Constantes
	var g:Float;
	var tam:Int;
	
	// Datos De Fisica
	var ax:Float;
	var vx:Float;
	var sx:Float;
	var ay:Float;
	var vy:Float;
	var sy:Float;
	
	var radio:Float;
	
	var h:Float;
	var vyRebote:Float;
		
	public var powerup:PowerUp = null;
	public var exploto:Bool;
	private var mantener = false;
	
	public static inline var TAM_1:Int = 1;
	public static inline var TAM_2:Int = 2;
	public static inline var TAM_3:Int = 3;
	public static inline var TAM_4:Int = 4;
	
	public static inline var VX:Int = 3;
	public static inline var Y_1:Float = Screen.SCREEN_HEIGHT - 450;
	public static inline var Y_2:Float = Screen.SCREEN_HEIGHT - 350;
	public static inline var Y_3:Float = Screen.SCREEN_HEIGHT - 250;
	public static inline var Y_4:Float = Screen.SCREEN_HEIGHT - 150;
	//public static inline var 4:Int = 4;
	
	public static var BOUND_TAM_1:Rectangle =  new Rectangle(0, 0, 100, 100);
	public static var BOUND_TAM_2:Rectangle =  new Rectangle(0, 0, 75, 75);
	public static var BOUND_TAM_3:Rectangle =  new Rectangle(0, 0, 50, 50);
	public static var BOUND_TAM_4:Rectangle =  new Rectangle(0, 0, 25, 25);	
	
	private var gravedad:Float = 0.05;

	private static var balls:Map < Int, Array<Ball> > = new Map < Int, Array<Ball> > ();
	private static var bitmapData:Map < Int, BitmapData > = new Map < Int, BitmapData > ();
	
	public function new(tam:Int) 
	{
		super();
		
		// Configurar
		this.tam = tam;
		initSprite();
		configBoundingBox();
	}
	
	public function spawn(x0:Float, y0:Float, vx:Float=Ball.VX, vy:Float=0, mantener:Bool=true) {
		
		// Reiniciar animacion
		if (ballAnimation != null) {
			ballAnimation.visible = false;
		}
		ballSprite.visible = true;		
		exploto = false;
		powerup = null;
		this.mantener = mantener;
				
		// Datos en X
		ax = 0;
		this.vx = vx;
		sx = x0;
		x = x0;
		
		// Datos en Y
		ay = gravedad;
		this.vy = vy;
		sy = y0;
		y = y0;		
		
		// Configurar datos de control
		configRebote();
		configBoundingBox();
	}

	// Spawn con velocidad en coordenadas polares
	public function spawnPolares(x0:Float, y0:Float, angulo:Float = 270, radio:Float = 0, mantener:Bool = true) {
		var vx:Float = radio * Math.cos( Math.PI / 180 * angulo );
		var vy:Float = radio * Math.sin( - ( Math.PI / 180 * angulo ) );
		this.spawn(x0 ,y0 ,vx, vy, mantener);
	}
	
	public function initSprite() {
		// Explosion
		if (!Ball.bitmapData.exists(tam)) {
			Ball.bitmapData.set(tam, Assets.getBitmapData("images/bola" + tam + ".png"));
		}
		
		ballSprite =  new Bitmap(Ball.bitmapData.get(tam));
		addChild(ballSprite);
	}
	
	public function configRebote() {
		if (mantener) {
			h = Screen.SCREEN_HEIGHT - sy;
		}else if (tam == TAM_4) {
			// Pelota mas chica			
			h = Screen.SCREEN_HEIGHT - Ball.Y_4;
		}else if (tam == TAM_3) {
			// Pelota mediana			
			h = Screen.SCREEN_HEIGHT - Ball.Y_3;
		}else if (tam == TAM_2) {
			// Pelota grande			
			h = Screen.SCREEN_HEIGHT - Ball.Y_2;
		}else if (tam == TAM_1) {
			// Pelota gigante		
			h = Screen.SCREEN_HEIGHT - Ball.Y_1;
		}
		vyRebote = Math.pow(1.9 * gravedad * h, 0.5);
	}
	
	public function configBoundingBox() {
		// BoundingBox
		if (tam == TAM_4) {
			boundingBox = BOUND_TAM_4;
			radio = 12.5;
		}else if (tam == TAM_3) {
			boundingBox = BOUND_TAM_3;
			radio = 25;
		}else if (tam == TAM_2) {
			boundingBox = BOUND_TAM_2;
			radio = 37.5;
		}else if (tam == TAM_1) {
			boundingBox = BOUND_TAM_1;
			radio = 50;
		}	
	}
	
	public function setPowerUp(pu:PowerUp) {
		powerup = pu;
	}
	
	public static function putBall(b:Ball) {
		var tam = b.tam;
		if (! balls.exists(b.tam)) {
			var bolasTam = new Array<Ball>();
			bolasTam.push(b);
			balls.set(b.tam, bolasTam);
		}else {
			balls.get(b.tam).push(b);
		}
	}
	
	public static function getBall(tam:Int):Ball {
		if (balls.exists(tam) && balls.get(tam).length > 0) {
			var b =  balls.get(tam).pop();
			
			return b;
		}else {
			return new Ball(tam);
		}
	}
	
	public function reventar(dividir:Bool = true) {
		exploto = true;
		ballSprite.visible = false;
		GameScene.screen.desactivarPelota(this);
		
		if (ballAnimation == null) {
			ballAnimation = new Animation(Assets.getBitmapData("images/explosion" + tam + ".png"), 1, 5);
		}
		
		addChild(ballAnimation);
		hijos.push(ballAnimation);		
		ballAnimation.visible = true;
		ballAnimation.activateAnimation();
		
		// Determinar si es necesario crear otras bolas
		if (tam != TAM_4 && dividir) {
			//trace("Crear pelotas");
			var b1 = Ball.getBall(tam + 1);
			b1.spawn(x, y, Ball.VX, -2, false);
			b1.setPowerUp(powerup);
			
			GameScene.screen.agregarPelota(b1);
			var b2 = Ball.getBall(tam + 1);
			b2.spawn(x, y, -Ball.VX, -2, false);
			GameScene.screen.agregarPelota(b2);
			
		}else {
			//trace("Verificar powerup");
			if (powerup != null) {
				//trace("Tirar powerup");
				powerup.spawn(x, y);
			}
		}
	}
	
	public function actualizarPosicion(incremento:Float) {
		if (!exploto) {
			// Actualizar posicion X
			vx += ax * incremento;
			sx += 0.5 * ax * incremento * incremento + vx * incremento;
			x = sx;	
			
			// Actualizar posicion Y
			vy += ay * incremento;
			sy += 0.5 * ay * incremento * incremento + vy * incremento;
			y = sy;	
		}
	}
	
	public function actualizarColision() {
		// Calcular colision en X
		if ((x + boundingBox.width > Screen.SCREEN_WIDTH) && (vx > 0)) {
			sx = x = Screen.SCREEN_WIDTH - boundingBox.width;
			vx = -vx;
		}else if ( ( x < 0) && (vx < 0) ) {
			sx = x = 0;
			vx = -vx;
		}
		
		// Calcular colision en Y
		if ( (y + boundingBox.height >= Screen.SCREEN_HEIGHT) && (vy > 0 ) ) {
			sy = y = Screen.SCREEN_HEIGHT - boundingBox.height;
			vy = -vyRebote;
		}else if ( (y <= 0) && (vy < 0) ){
			//subiendo = false;
			//trace("Comienza a caer de nuevo");
			sy = y = 0;
			vy = -vy;
		}
	}
	
	public function getCentroX():Float {
		return x + radio;
	}
	
	public function getCentroY():Float {
		return y + radio;
	}
	
	public function getWidth():Float {
		return radio*2;
	}
	
	public function colisionJugador(p:Player):Bool {
		if (PangRevenge.inputManager.keyPressed("D")) {
			trace(this);
			trace(getCentroX());
			trace(p.getCentroX());
		}
		if ( ( (getCentroX() - p.getCentroX()) * (getCentroX() - p.getCentroX()) + (getCentroY() - p.getCentroY()) * (getCentroY() - p.getCentroY()) ) < ( (radio + p.radio) * (radio + p.radio)) ) {
			return true;
		}
		return false;
	}
	
	override function updateLogic(time:Float) {
		//if (PangRevenge.inputManager.keyPressed("A")) {
		super.updateLogic(time);
		
		// Actualizar posicion
		var incremento = time * 50;	
		actualizarPosicion(incremento);			
		actualizarColision();
		
		if (exploto && ballAnimation.finalizo()) {
			GameScene.screen.eliminarPelota(this);
		}
		//}			
	}
}