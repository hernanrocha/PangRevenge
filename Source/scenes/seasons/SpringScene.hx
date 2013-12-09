package scenes;
import engine.SceneManager;
import game.bosses.FireBoss;
import scenes.GameScene;
import game.ball.*;
import game.Screen;
import game.PowerUp;

import engine.AudioManager;
import engine.Sonido;

/**
 * ...
 * @author ...
 */
class SpringScene extends GameScene
{

	public function new(sm:SceneManager) 
	{
		super(sm);
		
		//screen.setBackground("images/fondo_primavera.jpg");
	}
	
	override public function init() {
		super.init();
		
		AudioManager.getInstance().addLibreria(Sonido.LEVEL2);
		AudioManager.getInstance().addLibreria(Sonido.BOSS1);		
		AudioManager.getInstance().setSound(Sonido.LEVEL1,false);
		
		//engine.Stats.track('game','play','');
		
		// Cargar nivel
		GameScene.CURRENT_SCENE = 1;
		GameScene.CURRENT_LEVEL = 1;
		GameScene.FIN_ETAPA = 5;
		loadLevel();
	}
	
	override public function cargarPelotas(nivel:Int) {
		screen.pelotas = new Array<Ball>();	
		screen.pelotasCantidad = 0;
		
		if (nivel == 1) {
			// Setear datos de control
			var separacion = 40;
			var cantidad = 8;
			var xInicial:Int = Std.int( (Screen.SCREEN_WIDTH - separacion * (cantidad - 1) - 25) / 2 );
			
			// Colocar datos
			for (i in 0 ... cantidad) {
				var b = Ball.getBall(screen, Ball.TAM_4);
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
			var b1 = Ball.getBall(screen, Ball.TAM_3);
			var b2 = Ball.getBall(screen, Ball.TAM_3);
			
			b1.spawn(325, Ball.Y_3, -Ball.VX);			
			b2.spawn(Screen.SCREEN_WIDTH - 325 - 50, Ball.Y_3);
			
			b1.setPowerUp(PowerUp.get(PowerUp.POWERUP_SH));
			b2.setPowerUp(PowerUp.get(PowerUp.POWERUP_DT));
			
			screen.agregarPelota(b1);			
			screen.agregarPelota(b2);
		}else if (nivel == 3) {
			var b1 = Ball.getBall(screen, Ball.TAM_2);
			var b2 = Ball.getBall(screen, Ball.TAM_2);
			var b3 = Ball.getBall(screen, Ball.TAM_3);
			var b4 = Ball.getBall(screen, Ball.TAM_3);
			
			// Agregar pelotas del medio
			b1.spawn(300, Ball.Y_2, -Ball.VX);
			b2.spawn(Screen.SCREEN_WIDTH - 300 - 75, Ball.Y_2);
			
			// Agregas pelotas de borde
			b3.spawn(0, Ball.Y_3);
			b4.spawn(Screen.SCREEN_WIDTH - 50, Ball.Y_3);
			
			b1.setPowerUp(PowerUp.get(PowerUp.POWERUP_SPEED));
			b2.setPowerUp(PowerUp.get(PowerUp.POWERUP_DT));
			
			screen.agregarPelota(b1);
			screen.agregarPelota(b2);			
			screen.agregarPelota(b3);			
			screen.agregarPelota(b4);
		}else if (nivel == 4) {
			// Agregar dos pelotas gigantes
			var b1 = Ball.getBall(screen, Ball.TAM_1);
			b1.spawn(275, Ball.Y_1, -Ball.VX);
			b1.setPowerUp(PowerUp.get(PowerUp.POWERUP_SPEED));
			screen.agregarPelota(b1);
			
			var b2 = Ball.getBall(screen, Ball.TAM_1);
			b2.spawn(Screen.SCREEN_WIDTH - 275 - 100, Ball.Y_1);
			b2.setPowerUp(PowerUp.get(PowerUp.POWERUP_SH));
			screen.agregarPelota(b2);	
		}
	}
}