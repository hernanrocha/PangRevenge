package scenes;
import engine.SceneManager;
import flash.display.Bitmap;
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
class SummerScene extends GameScene
{	
	public function new(sm:SceneManager) {
		super(sm);
		
		screen.setBackground("images/fondo_verano.jpg");
	}
	
	override public function init() {
		super.init();
		
		AudioManager.getInstance().addLibreria(Sonido.LEVEL3);
		AudioManager.getInstance().setSound(Sonido.LEVEL2,false);
		
		//Score.getInstance().sessionBegin();
		//engine.Stats.track('game','play','');
		
		// Cargar fondo, powerups y jugadores
		screen.p1.sogasSetEstado(Soga.FUEGO);
		
		// Cargar nivel
		GameScene.CURRENT_SCENE = 2;
		GameScene.CURRENT_LEVEL = 1;
		GameScene.FIN_ETAPA = 6;
		loadLevel();
	}
	
	override public function cargarPelotas(nivel:Int) {
		screen.pelotas = new Array<Ball>();	
		screen.pelotasCantidad = 0;
		
		if (nivel == 1) {
			// Setear datos de control
			var separacion = 40;
			var cantidad = 10;
			var xInicial:Int = Std.int( (Screen.SCREEN_WIDTH - separacion * (cantidad - 1) - 25) / 2 );
			
			// Colocar datos
			for (i in 0 ... cantidad) {
				var b = FireBall.getBall(screen, Ball.TAM_4);
				if (i < Std.int(cantidad / 2)) {					
					b.spawn(xInicial + i * separacion, Ball.Y_4, -Ball.VX, -2);
				}else {					
					b.spawn(xInicial + i * separacion, Ball.Y_4, Ball.VX, -2);
				}
				
				if (i == 0) {
					b.setPowerUp(PowerUp.get(PowerUp.POWERUP_SH));
				}
				screen.agregarPelota(b);
			}
		}else if (nivel == 2) { 
			var b1 = FireBall.getBall(screen, Ball.TAM_2);
			b1.spawn(0, 0, 2, 2);
			b1.setPowerUp(PowerUp.get(PowerUp.POWERUP_DT));
			screen.agregarPelota(b1);
			
			var b2 = FireBall.getBall(screen, Ball.TAM_2);
			b2.spawn(Screen.SCREEN_WIDTH - 75, 0, -2, 2);
			b2.setPowerUp(PowerUp.get(PowerUp.POWERDOWN_TS));
			screen.agregarPelota(b2);
		}else if (nivel == 3) {
			
			var cantidad = 6;
			var xInicial = 30;
			var yInicial = Screen.SCREEN_HEIGHT - 50;			
			var separacion = 40;
			
			for (i in 0...cantidad) {
				var b1 = FireBall.getBall(screen, Ball.TAM_3);
				b1.spawn(xInicial + separacion * i, yInicial - separacion * i, 4, -4);
				if ( i == 5 )
					b1.setPowerUp(PowerUp.get(PowerUp.POWERUP_HOOK));
				if ( i == 6 )
					b1.setPowerUp(PowerUp.get(PowerUp.POWERUP_SPEED));
				screen.agregarPelota(b1);
				
				var b2 = FireBall.getBall(screen, Ball.TAM_3);
				b2.spawn(Screen.SCREEN_WIDTH - 50 - xInicial - separacion * i, yInicial - separacion * i, -4, -4);
				screen.agregarPelota(b2);
			}
			
		}else if (nivel == 4) {
			var cantidad = 6;
			var yInicial = 30;			
			var separacion = 40;
			var xInicial:Int = Std.int( (Screen.SCREEN_WIDTH - separacion * (cantidad - 1) - 25) / 2 );
			
			for (i in 0...cantidad) {
				var b1 = FireBall.getBall(screen, Ball.TAM_4);
				b1.spawn(0, 30 + separacion * i, 3, 2);
				screen.agregarPelota(b1);
				
				var b2 = FireBall.getBall(screen, Ball.TAM_4);
				b2.spawn(Screen.SCREEN_WIDTH - 25, 30 + separacion * i, -3, 2);
				screen.agregarPelota(b2);
				
				var b3 = Ball.getBall(screen, Ball.TAM_4);
				if (i < Std.int(cantidad / 2)) {					
					b3.spawn(xInicial + i * separacion, 0, -Ball.VX, -2, false);
				}else {					
					b3.spawn(xInicial + i * separacion, 0, Ball.VX, -2, false);
				}
				
				if ( i == 0 ) {
					b2.setPowerUp(PowerUp.get(PowerUp.POWERUP_HOOK));
				}
				
				screen.agregarPelota(b3);
			}
		}else if (nivel == 5) {
			// Agregar boss de fuego
			
			AudioManager.getInstance().setSound(Sonido.BOSS1,false);
			
			boss = new FireBoss(this);
			boss.init(screen, 250, false);
			bossDead = false;
			screen.addChild(boss);
			screen.boss = boss;
			screen.hijos.push(boss);
		}
	}
}