package scenes;
import engine.SceneManager;
import flash.display.Bitmap;
import scenes.GameScene;
import game.ball.*;
import game.Screen;
import game.Soga;
import game.bosses.FireBoss;
import openfl.Assets;

import engine.AudioManager;
import engine.Sonido;
import game.PowerUp;

/**
 * ...
 * @author ...
 */
class AutumnScene extends GameScene
{	
	public function new(sm:SceneManager) {
		super(sm);
		
		screen.setBackground("images/fondo_otonio.jpg");
	}
	
	override public function init() {
		super.init();
		
		AudioManager.getInstance().addLibreria(Sonido.LEVEL4);
		AudioManager.getInstance().addLibreria(Sonido.BOSS2);
		AudioManager.getInstance().setSound(Sonido.LEVEL3,false);
		
		//Score.getInstance().sessionBegin();
		//engine.Stats.track('game','play','');
				
		// Cargar nivel
		GameScene.CURRENT_SCENE = 3;
		GameScene.CURRENT_LEVEL = 1;
		GameScene.FIN_ETAPA = 5;
		loadLevel();
	}
	
	override public function cargarPelotas(nivel:Int) {
		screen.pelotas = new Array<Ball>();		
		screen.pelotasCantidad = 0;
		
		if (nivel == 1) {
			var separacion = 27;
			var cantidad = 20;
			var xInicial:Int = Std.int( (Screen.SCREEN_WIDTH - separacion * (cantidad - 1) - 25) / 2 );
			var mitad = 8;
			
			for (i in 0 ... cantidad) {
				var b1 = Ball.getBall(screen, 4);
				b1.spawn(xInicial + i * separacion, 50 + i * separacion / 2, 4, 4);
				
				if (i == 0) {
					b1.setPowerUp(PowerUp.get(PowerUp.POWERUP_HOOK));
				}
				
				if (i == 5) {
					b1.setPowerUp(PowerUp.get(PowerUp.POWERUP_SH));
				}
				
				screen.agregarPelota(b1);
				
				//screen.agregarPelota(new Ball(screen, Ball.TAM_4, xInicial + i * separacion, i >= mitad));
			}
		}else if (nivel == 2) { 
			// Setear datos de control
			var separacion = 40;
			var cantidad = 10;
			var xInicial:Int = Std.int( (Screen.SCREEN_WIDTH - separacion * (cantidad - 1) - 25) / 2 );
			
			// Colocar datos
			for (i in 0 ... cantidad) {
				var b = Ball.getBall(screen, Ball.TAM_4);
				if (i < Std.int(cantidad / 2)) {					
					b.spawn(xInicial + i * separacion, Ball.Y_4, -5, -2);
				}else {					
					b.spawn(xInicial + i * separacion, Ball.Y_4, 5, -2);
				}
				
				if (i == 0) {
					b.setPowerUp(PowerUp.get(PowerUp.POWERDOWN_SPEED));
				}
				
				if (i == 2) {
					b.setPowerUp(PowerUp.get(PowerUp.POWERUP_SH));
				}
				
				screen.agregarPelota(b);
			}
		}else if (nivel == 3) { 
			var b1 = Ball.getBall(screen, Ball.TAM_2);
			b1.spawn(50, 0, 2, 2);
			screen.agregarPelota(b1);
			
			var b3 = Ball.getBall(screen, Ball.TAM_2);
			b3.spawn(50, 0, -2, 2);
			screen.agregarPelota(b3);
			
			var b2 = Ball.getBall(screen, Ball.TAM_2);
			b2.spawn(Screen.SCREEN_WIDTH - 75 - 50, 0, -2, 2);
			b2.setPowerUp(PowerUp.get(PowerUp.POWERUP_HOOK));
			screen.agregarPelota(b2);
			
			var b4 = Ball.getBall(screen, Ball.TAM_2);
			b4.spawn(Screen.SCREEN_WIDTH - 75 - 50, 0, 2, 2);
			b4.setPowerUp(PowerUp.get(PowerUp.POWERUP_SH));
			screen.agregarPelota(b4);	
		}else if (nivel == 4) {
			var cantidad = 6;
			var xInicial = 30;
			var yInicial = Screen.SCREEN_HEIGHT - 75;			
			var separacion = 55;
			
			for (i in 0...cantidad) {
				var b1 = Ball.getBall(screen, Ball.TAM_3);
				b1.spawn(xInicial + separacion * i, yInicial - separacion * i, 4, -4);
				screen.agregarPelota(b1);
				
				var b2 = Ball.getBall(screen, Ball.TAM_3);
				b2.spawn(Screen.SCREEN_WIDTH - 50 - xInicial - separacion * i, yInicial - separacion * i, -4, -4);
				screen.agregarPelota(b2);
				
				if (i == 0) {
					b2.setPowerUp(PowerUp.get(PowerUp.POWERDOWN_SPEED));
				}
			}
		}
	}
}