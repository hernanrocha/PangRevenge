package game.bosses;
import engine.GameElement;
import engine.Scene;
import game.Screen;
import motion.easing.Bounce;
import scenes.GameScene;
import engine.InputManager;
import engine.Animation;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Rectangle;
import openfl.Assets;
import game.ball.FireBall;
import game.ball.Ball;
import Std;
import motion.Actuate;
import motion.easing.Bounce.BounceEaseIn;


/**
 * ...
 * @author joacko...
 */
class FireBoss extends Boss
{	
	public static var TIEMPO_B_CHICA :Int = 3;
	public static var TIEMPO_B_GRANDE:Int = 15;
	public static var MAX_DAMAGE :Int = 10;
	
	var BossExplode1:Animation;
	var BossExplode2:Animation;
	var BossExplode3:Animation;
	private var timerchico:Float=0;
	private var timergrande:Float=0;
	
	
	var spriteRight:Bitmap;
	var spriteLeft:Bitmap;
	var spritedamage_l:Bitmap;
	var spritedamage_r:Bitmap;
	
	
	
	public function new(p_scene:GameScene) 
	{
		super(p_scene);
		this.scene = p_scene;
		
		spriteRight =  new Bitmap(Assets.getBitmapData("images/boss1right.png"));
		spriteLeft =  new Bitmap(Assets.getBitmapData("images/boss1left.png"));
		spritedamage_l = new Bitmap(Assets.getBitmapData("images/boss1damage_l.png"));
		spritedamage_r = new Bitmap(Assets.getBitmapData("images/boss1damage_r.png"));
		addChild(spritedamage_l);
		spritedamage_l.visible = false;
		spritedamage_r.visible = false;
		addChild(spritedamage_r);
		addChild(spriteRight);
		addChild(spriteLeft);
		boundingBox =  new Rectangle(0, 0, 200, 200);
	}
	
	
	override public function initConfig(x0, dirIzquierda:Bool, y0:Float = -1.0)
	{
		super.initConfig(x0, dirIzquierda, y0);
		spriteRight.visible = true;
		spriteLeft.visible = false;
	}
	
	override public function actualizarPosicion(incremento:Float) {
		if (!died) {
			// Actualizar posicion X
			vx += ax * incremento;
			sx += 0.5 * ax * incremento * incremento + vx * incremento;
			x = sx;	
			
				
		}
	}
	
	override public function actualizarColision() {
		// Calcular colision en X
		if ((x + boundingBox.width > Screen.SCREEN_WIDTH) && (vx > 0)) {
			sx = x = Screen.SCREEN_WIDTH - boundingBox.width;
			vx = -vx;
			spriteLeft.visible = true;
			spriteRight.visible = false;
		}else if ( ( x < 0) && (vx < 0) ) {
			sx = x = 0;
			vx = -vx;
			spriteLeft.visible = false;
			spriteRight.visible = true;
		}
	}
	
	override public function disparar(time:Float)
		
	{
		timerchico += time ;
		timergrande += time;
		if (timerchico >=TIEMPO_B_CHICA) {
			var b1 = FireBall.getBall(screen, Ball.TAM_4);
			b1.spawn(x, y, 3, 3);
			screen.agregarPelota(b1);
			
			var b2 = FireBall.getBall(screen, Ball.TAM_4);
			b2.spawn(x, y, -3, 3);
			screen.agregarPelota(b2);
			
			timerchico = 0;
			}
		if (timergrande >= TIEMPO_B_GRANDE) {
			var b2 = FireBall.getBall(screen, Ball.TAM_2);
			b2.spawn(x, y, -2, 2);
			screen.agregarPelota(b2);
			timergrande = 0;
		}
	
	}

	override public function getDamage() {
		damage++;
		if (vx < 0) 
			{
			spriteLeft.visible = false;
			spritedamage_l.visible = true;
			Actuate.timer(0.1).onComplete(function(){spriteLeft.visible = true;
			spritedamage_l.visible = false; } );
			}
		else
			{
			spriteRight.visible = false;
			spritedamage_r.visible = true;
			Actuate.timer(0.1).onComplete(function(){spriteRight.visible = true;
			spritedamage_r.visible = false; } );
			}
		if (damage == MAX_DAMAGE)
			die();
		}
	
		override public function die() {
			//explosiones
			BossExplode1 = new Animation(Assets.getBitmapData("images/boss_explosion.png"), 5, 5);
			BossExplode1.visible = true;
			this.addChild(BossExplode1);
			hijos.push(BossExplode1);
			BossExplode1.x = 0;
			BossExplode1.y = 75;
			BossExplode1.activateAnimation();
			Actuate.timer(0.1).onComplete(function() {
				BossExplode2 = new Animation(Assets.getBitmapData("images/boss_explosion.png"), 5, 5);
				BossExplode2.visible = true;
				this.addChild(BossExplode2);
				hijos.push(BossExplode2);
				BossExplode2.x = 45;
				BossExplode2.y = 20;
				BossExplode2.activateAnimation(); } );
			
			Actuate.timer(0.2).onComplete(function(){
				BossExplode3 = new Animation(Assets.getBitmapData("images/boss_explosion.png"), 5, 5);
				BossExplode3.visible = true;
				this.addChild(BossExplode3);
				hijos.push(BossExplode3);
				BossExplode3.x = 100;
				BossExplode3.y = 80;
				BossExplode3.activateAnimation(); } );
			this.died = true;
			Actuate.tween(this, 3, { alpha:0 } ).ease(Bounce.easeIn).onComplete(function() { scene.killBoss(); } );
		}
	
}