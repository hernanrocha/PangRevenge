package game.ball;

import engine.Animation;
import flash.display.Bitmap;
import openfl.Assets;
import engine.InputManager;
import flash.display.BitmapData;
import scenes.GameScene;

/**
 * ...
 * @author ...
 */ 
 
class SnowBall extends Ball {

	private static var snowballs:Map < Int, Array<SnowBall> > = new Map < Int, Array<SnowBall> > ();
	private static var bitmapData:Map < Int, BitmapData > = new Map < Int, BitmapData > ();
	
	public function new(tam:Int) 
	{
		super(tam);
	}
	
	override public function initSprite() {
		if (!SnowBall.bitmapData.exists(tam)) {
			SnowBall.bitmapData.set(tam, Assets.getBitmapData("images/snowball" + tam + ".png"));
		}
		
		ballSprite =  new Bitmap(SnowBall.bitmapData.get(tam));
		addChild(ballSprite);
	}
	
	override public function reventar() {
		exploto = true;
		ballSprite.visible = false;
		GameScene.screen.desactivarPelota(this);
		
		//GameScene.screen.eliminarPelota(this);
		if (ballAnimation == null) {
			ballAnimation = new Animation(Assets.getBitmapData("images/explosionnieve" + tam + ".png"), 1, 3);
		}
		addChild(ballAnimation);
		hijos.push(ballAnimation);
		ballAnimation.visible = true;
		ballAnimation.activateAnimation();
		
		trace("SnowBall reventada");
		
		// Determinar si es necesario crear otras bolas
		if (tam != Ball.TAM_4) {
			var b1 = SnowBall.getBall(tam + 1);
			b1.spawn(x, y, vx, vy);
			b1.setPowerUp(powerup);			
			GameScene.screen.agregarPelota(b1);
			
		}else {
			if (powerup != null) {
				powerup.spawn(x, y);
			}
		}
	}
		
	public static function putBall(b:SnowBall) {
		var tam = b.tam;
		if (! snowballs.exists(b.tam)) {
			var bolasTam = new Array<SnowBall>();
			bolasTam.push(b);
			snowballs.set(b.tam, bolasTam);
		}else {
			snowballs.get(b.tam).push(b);
		}
	}
	
	public static function getBall(tam:Int):SnowBall {
		if (snowballs.exists(tam) && snowballs.get(tam).length > 0) {
			var b =  snowballs.get(tam).pop();
			return b;
		}else {
			return new SnowBall(tam);
		}
	}
}