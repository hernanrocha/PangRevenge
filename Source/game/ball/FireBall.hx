package game.ball;

import engine.Animation;
import flash.display.Bitmap;
import openfl.Assets;
import engine.InputManager;
import flash.display.BitmapData;

/**
 * ...
 * @author ...
 */ 
 
class FireBall extends Ball {

	private static var fireballs:Map < Int, Array<FireBall> > = new Map < Int, Array<FireBall> > ();
	private static var bitmapData:Map < Int, BitmapData > = new Map < Int, BitmapData > ();
	
	public function new(screen:Screen, tam:Int) 
	{
		super(screen, tam);
		
		// Cambiar gravedad
		gravedad = 0;
	}
	
	override public function initSprite() {
		if (!FireBall.bitmapData.exists(tam)) {
			FireBall.bitmapData.set(tam, Assets.getBitmapData("images/fireball" + tam + ".png"));
		}
		
		ballSprite =  new Bitmap(FireBall.bitmapData.get(tam));
		addChild(ballSprite);
	}
	
	override public function configRebote() {
		if (vy > 0) {
			vyRebote = vy;
		}else {
			vyRebote = -vy;
		}
	}
	
	override public function reventar() {
		exploto = true;
		ballSprite.visible = false;
		screen.desactivarPelota(this);
		
		//screen.eliminarPelota(this);
		if (ballAnimation == null) {
			ballAnimation = new Animation(Assets.getBitmapData("images/explosionfuego" + tam + ".png"), 1, 5);
		}
		addChild(ballAnimation);
		hijos.push(ballAnimation);
		ballAnimation.visible = true;
		ballAnimation.activateAnimation();
		
		trace("FireBall reventada");
		
		// Determinar si es necesario crear otras bolas
		if (tam != Ball.TAM_4) {
			var b1 = FireBall.getBall(screen, tam + 1);
			b1.spawn(x, y, -vx, -vy);
			b1.setPowerUp(powerup);			
			screen.agregarPelota(b1);
			
			var b2 = FireBall.getBall(screen, tam + 1);			
			b2.spawn(x, y, vx, -vy);
			screen.agregarPelota(b2);
			
		}else {
			if (powerup != null) {
				powerup.spawn(x, y);
			}
		}
	}
	
	public static function putBall(b:FireBall) {
		var tam = b.tam;
		if (! fireballs.exists(b.tam)) {
			var bolasTam = new Array<FireBall>();
			bolasTam.push(b);
			fireballs.set(b.tam, bolasTam);
		}else {
			fireballs.get(b.tam).push(b);
		}
	}
	
	public static function getBall(screen:Screen, tam:Int):FireBall {
		if (fireballs.exists(tam) && fireballs.get(tam).length > 0) {
			var b =  fireballs.get(tam).pop();
			return b;
		}else {
			return new FireBall(screen, tam);
		}
	}
}