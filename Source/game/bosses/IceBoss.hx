package game.bosses;
import engine.Animation;
import engine.ContAnimation;
import flash.display.Bitmap;
import game.Screen;
import scenes.GameScene;
import openfl.Assets;
import flash.geom.Rectangle;
import game.ball.Ball;
import motion.Actuate;
import motion.easing.Bounce;
import game.ball.SnowBall;

/**
 * ...
 * @author ...
 */
class IceBoss extends Boss
{
	public static var TIMER_B :Int = 10;
	private var timer:Float = 0;
	var dmg:Bitmap;
	var g:Float;
	var bossAnimation:ContAnimation;
	var ay:Float;
	var vy:Float;
	var sy:Float;
	var vyRebote:Float;
	
	
	public function new( name:String , hits:Int ){
		super(name,hits);
		
		trace("Creando boss");
		
		bossAnimation = new ContAnimation(Assets.getBitmapData("images/boss2_anim.png"), 1, 5);
		this.addChild(bossAnimation);
		bossAnimation.visible = true;
		hijos.push(bossAnimation);
		bossAnimation.beginLoops(10);
		this.x = 200;
		this.y = 0;
		boundingBox =  new Rectangle(0, 0, 200, 200);
		dmg = new Bitmap(Assets.getBitmapData("images/dmg_ice.png"));
		dmg.visible = false;
		this.addChild(dmg);
		dmg.x = 0;
		dmg.y = 0;
		
		
	}
	
	override public function initConfig(x0, dirIzquierda:Bool, y0:Float = -1.0)
		{
		super.initConfig(x0, dirIzquierda, y0);
		
		g = 0.05;
		
		// Datos en X
		ax = 0;
		vx = 2;
		if (dirIzquierda) {
			vx = -vx;
		}
		sx = x0;
		x = x0;
		
		// Datos en Y
		ay = g;
		vy = 0.0;
		if (y0 != -1.0) {
			vy = -3.0;
			y = sy = y0;
		}else y = sy = 0;
		h = Screen.SCREEN_HEIGHT;
		vyRebote = Math.pow(2 * g * h, 0.5);
	
		
		}
	
		private function distancia(x:Float, y:Float):Float
		{
			if (x > y) {
				return (x - y);
			}
			
			return (y - x);
		}
		
	override public function actualizarPosicion(incremento:Float)	{
		if (!dead){
			// Actualizar posicion X 
			
			// usar GameScene.scree.jugadores !!!
			
			if (vy > 0) {
				
				/*if (GameScene.PLAYER_CANT < 2){
					if ((GameScene.screen.p1.x < this.x && vx>0) || (GameScene.screen.p1.x>this.x && vx<0))
						vx = -vx; 
				}else if (distancia(GameScene.screen.p1.x + 20, this.x + 100) < distancia(GameScene.screen.p2.x + 20, this.x + 100)){
					if ((GameScene.screen.p1.x <this.x && vx > 0) || (GameScene.screen.p1.x>this.x && vx<0))
						vx = -vx;
				}else if ((GameScene.screen.p2.x < this.x && vx>0) || (GameScene.screen.p2.x>this.x && vx<0))
					vx = -vx;
				*/
			}
		
				
			vx += ax * incremento;
			sx += 0.5 * ax * incremento * incremento + vx * incremento;
			x = sx;	
			
			// Actualizar posicion Y
			vy += ay * incremento;
			sy += 0.5 * ay * incremento * incremento + vy * incremento;
			y = sy;	
		}
	}
	override public function actualizarColision() { 
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
		
	override public function disparar(time:Float) {
		if ( dead ) return;
		timer += time;
		if (timer >= TIMER_B) {
			var b1:Ball = SnowBall.getBall(Ball.TAM_3); 
			b1.spawn(x + 100, y + 100, 3, 3);
			GameScene.screen.agregarPelota(b1);
				
			var b2 = SnowBall.getBall(Ball.TAM_3);
			b2.spawn(x + 100, y + 100, -3, 3);
			GameScene.screen.agregarPelota(b2);
			timer = 0;
		}
	}
		
	override public function getDamage() {
		health--;
		
		dmg.visible = true;
		Actuate.timer(0.2).onComplete(function() { dmg.visible = false; } );
		
		if (health == 0)
			die();
	}
		
	override public function die() {
		dead = true;
		super.die();
		
		var explosion1 = new Animation(Assets.getBitmapData("images/boss2_explode.png"), 5, 2);
		explosion1.visible = true;
		this.addChild(explosion1);
		hijos.push(explosion1);
		explosion1.x = 0;
		explosion1.y = 75;
		explosion1.activateAnimation();
		Actuate.timer(0.2).onComplete(function() {
			var explosion2 = new Animation(Assets.getBitmapData("images/boss2_explode.png"), 5, 2);
			explosion2.visible = true;
			this.addChild(explosion2);
			hijos.push(explosion2);
			explosion2.x = 35;
			explosion2.y = 20;
			explosion2.activateAnimation(); } );
		Actuate.timer(0.3).onComplete(function() {
			var explosion3 = new Animation(Assets.getBitmapData("images/boss2_explode.png"), 5, 2);
			explosion3.visible = true;
			this.addChild(explosion3);
			hijos.push(explosion3);
			explosion3.x = 75;
			explosion3.y = 30;
			explosion3.activateAnimation(); } );
		Actuate.timer(0.5).onComplete(function() {
			var explosion4 = new Animation(Assets.getBitmapData("images/boss2_explode.png"), 5, 2);
			explosion4.visible = true;
			this.addChild(explosion4);
			hijos.push(explosion4);
			explosion4.x = 50;
			explosion4.y = 10;
			explosion4.activateAnimation(); } );
		Actuate.tween(this, 3, { alpha:0 } ).ease(Bounce.easeIn).onComplete(function() { 
			GameScene.level.killBoss(); 
			this.end();
		} );
	}
		
	public function getCentroX():Float {
		return x + radio;
	}
	
	public function getCentroY():Float {
		return y + radio;
	}
	
		
	override public function colisionJugador(p:Player):Bool {
		if ( ( (getCentroX() - p.getCentroX()) * (getCentroX() - p.getCentroX()) + (getCentroY() - p.getCentroY()) * (getCentroY() - p.getCentroY()) ) < ( (radio + p.radio) * (radio + p.radio)) ) {
			return true;
		}
		return false;
	}

}