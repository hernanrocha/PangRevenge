package scenes;
import engine.SceneManager;
import flash.display.Bitmap;
import game.bosses.IceBoss;
import scenes.GameScene;
import game.ball.*;
import game.Screen;
import game.Soga;
import game.bosses.FireBoss;
import openfl.Assets;
import game.PowerUp;

import engine.AudioManager;
import engine.Sonido;

/**
 * ...
 * @author ...
 */
class WinterScene extends GameScene
{	
	public function new(sm:SceneManager) {
		super(sm);
		
		screen.setBackground("images/fondo_invierno.jpg");
	}
	
	override public function init() {
		super.init();
		
		
		AudioManager.getInstance().setSound(Sonido.LEVEL4,false);
		
		//Score.getInstance().sessionBegin();
		//engine.Stats.track('game','play','');
		
		// Cargar fondo, powerups y jugadores
		screen.p1.sogasSetEstado(Soga.HIELO);
		
		// Cargar nivel
		GameScene.CURRENT_SCENE = 4;
		GameScene.CURRENT_LEVEL = 4;
		GameScene.FIN_ETAPA = 6;
		loadLevel();
	}
	
	override public function cargarPelotas(nivel:Int) {
		screen.pelotas = new Array<Ball>();		
		screen.pelotasCantidad = 0;
		
		if (nivel == 1) {
			var separacion = 60;
			var cantidad = 8;
			var xInicial:Int = Std.int( (Screen.SCREEN_WIDTH - separacion * (cantidad - 1) - 50) / 2 );
			
			// Colocar datos
			for (i in 0 ... cantidad) {
				var b = SnowBall.getBall(screen, Ball.TAM_3);
				if (i < Std.int(cantidad / 2)) {					
					b.spawn(xInicial + i * separacion, Ball.Y_3, -Ball.VX, 0);
				}else {					
					b.spawn(xInicial + i * separacion, Ball.Y_3, Ball.VX, 0);
				}
				
				if (i == 0) {
					b.setPowerUp(PowerUp.get(PowerUp.POWERUP_SH));
				}
				screen.agregarPelota(b);
			}
		}else if (nivel == 2) { 
			var b1 = SnowBall.getBall(screen, Ball.TAM_4);
			var b2 = SnowBall.getBall(screen, Ball.TAM_4);
			var b3 = SnowBall.getBall(screen, Ball.TAM_4);
			var b4 = SnowBall.getBall(screen, Ball.TAM_4);
			
			b1.spawn(10, Screen.SCREEN_HEIGHT - 25, -2, 0);
			b2.spawn(Screen.SCREEN_WIDTH - 25 - 10, Screen.SCREEN_HEIGHT - 25, -2, 0);
			b3.spawn((Screen.SCREEN_WIDTH - 25)/ 2, Screen.SCREEN_HEIGHT - 25, -2, 0);
			b4.spawn((Screen.SCREEN_WIDTH - 25)/ 2, Screen.SCREEN_HEIGHT - 25, 2, 0);
			
			var separacion = 80;
			var cantidad = 4;
			var xInicial:Int = Std.int( (Screen.SCREEN_WIDTH - separacion * (cantidad - 1) - 100) / 2 );
			
			// Colocar datos
			for (i in 0 ... cantidad) {
				var b = SnowBall.getBall(screen, Ball.TAM_2);		
				b.spawn(xInicial + i * separacion, Ball.Y_2, 0, 5);
				if (i == 0) {
					b.setPowerUp(PowerUp.get(PowerUp.POWERUP_DT));
				}
				screen.agregarPelota(b);
			}
					
			screen.agregarPelota(b1);
			screen.agregarPelota(b2);
			screen.agregarPelota(b3);
			screen.agregarPelota(b4);
		}else if (nivel == 3) {
			var b1 = SnowBall.getBall(screen, Ball.TAM_1);
			//var b2 = SnowBall.getBall(screen, Ball.TAM_1);
			var b3 = SnowBall.getBall(screen, Ball.TAM_2);
			var b4 = SnowBall.getBall(screen, Ball.TAM_2);
			var b5 = SnowBall.getBall(screen, Ball.TAM_3);
			var b6 = SnowBall.getBall(screen, Ball.TAM_3);
			var b7 = SnowBall.getBall(screen, Ball.TAM_4);
			var b8 = SnowBall.getBall(screen, Ball.TAM_4);
			
			b1.spawn((Screen.SCREEN_WIDTH - 100)/ 2, (Screen.SCREEN_HEIGHT - 200) / 2, 0, 0);
			//b2.spawn((Screen.SCREEN_WIDTH - 100) / 2, (Screen.SCREEN_HEIGHT - 200) / 2, -3, 3);
			b3.spawn((Screen.SCREEN_WIDTH - 75) / 2, (Screen.SCREEN_HEIGHT - 175) / 2, 3, 3);
			b4.spawn((Screen.SCREEN_WIDTH - 75) / 2, (Screen.SCREEN_HEIGHT - 175) / 2, -3, 3);
			b5.spawn((Screen.SCREEN_WIDTH - 75) / 2, (Screen.SCREEN_HEIGHT - 175) / 2, 5, 5);
			b6.spawn((Screen.SCREEN_WIDTH - 75) / 2, (Screen.SCREEN_HEIGHT - 175) / 2, -5, 5);
			b7.spawn((Screen.SCREEN_WIDTH - 75) / 2, (Screen.SCREEN_HEIGHT - 175) / 2, 7, 7);
			b8.spawn((Screen.SCREEN_WIDTH - 75) / 2, (Screen.SCREEN_HEIGHT - 175) / 2, -7, 7);
			
			b4.setPowerUp(PowerUp.get(PowerUp.POWERUP_SPEED));
			screen.agregarPelota(b7);
			screen.agregarPelota(b8);
			screen.agregarPelota(b5);
			screen.agregarPelota(b6);
			screen.agregarPelota(b3);
			screen.agregarPelota(b4);
			screen.agregarPelota(b1);
			//screen.agregarPelota(b2);
		}else if (nivel == 4) {			
			var b1 = SnowBall.getBall(screen, Ball.TAM_1);
			var b2 = SnowBall.getBall(screen, Ball.TAM_1);
			var b3 = SnowBall.getBall(screen, Ball.TAM_2);
			var b4 = SnowBall.getBall(screen, Ball.TAM_2);
			var b5 = SnowBall.getBall(screen, Ball.TAM_3);
			var b6 = SnowBall.getBall(screen, Ball.TAM_3);
			var b7 = SnowBall.getBall(screen, Ball.TAM_4);
			var b8 = SnowBall.getBall(screen, Ball.TAM_4);
			
			b1.spawn(0, Screen.SCREEN_HEIGHT - 100, 3, -3, false);
			b3.spawn(0, Screen.SCREEN_HEIGHT - 75, 4, -4, false);
			b5.spawn(0, Screen.SCREEN_HEIGHT - 50, 5, -5, false);
			b7.spawn(0, Screen.SCREEN_HEIGHT - 25, 6, -6, false);
			
			b8.setPowerUp(PowerUp.get(PowerUp.POWERUP_SH));
			
			b2.spawn(Screen.SCREEN_WIDTH - 100, Screen.SCREEN_HEIGHT - 100, -3, -3, false);
			b4.spawn(Screen.SCREEN_WIDTH - 75, Screen.SCREEN_HEIGHT - 75, -4, -4, false);
			b6.spawn(Screen.SCREEN_WIDTH - 50, Screen.SCREEN_HEIGHT - 50, -5, -5, false);
			b8.spawn(Screen.SCREEN_WIDTH - 25, Screen.SCREEN_HEIGHT - 25, -6, -6, false);
			
			screen.agregarPelota(b1);
			screen.agregarPelota(b2);
			screen.agregarPelota(b3);
			screen.agregarPelota(b4);
			screen.agregarPelota(b5);
			screen.agregarPelota(b6);
			screen.agregarPelota(b7);
			screen.agregarPelota(b8);
			
		}else if (nivel == 5) {
			
			AudioManager.getInstance().setSound(Sonido.BOSS1, false);
			
			// Cargar boss de invierno
			/*var b1 = SnowBall.getBall(screen, 4);
			b1.init(screen, Ball.TAM_4, 60, false);
			screen.agregarPelota(b1);*/
			
			boss = new IceBoss(this);
			boss.init(screen, 250, false);
			screen.addChild(boss);
			bossDead = false;
			screen.boss = boss;
			screen.hijos.push(boss);
		}
	}
}