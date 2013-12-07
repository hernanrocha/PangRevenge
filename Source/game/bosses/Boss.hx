package game.bosses;
import engine.GameElement;
import scenes.GameScene;
import flash.display.Bitmap;
import game.Screen;
/**
 * ...
 * @author ...
 */
class Boss extends GameElement
{

	
	
	var died:Bool;
	var screen:Screen;
	var ax:Float;
	var vx:Float;
	var sx:Float;
	private var damage:Int = 0;
	var h:Float;
	var scene:GameScene;
	
	var radio:Float = 100;
	
	public function new(p_scene:GameScene) 
	{
		super();
	}
	
	public function init(p_screen:Screen, p_x0:Int, dirIzquierda:Bool, p_y:Float = -1.0) {
		// Referencia
		screen = p_screen;
		
		// Configurar datos de control
		initConfig(p_x0, dirIzquierda, p_y);
		
	}
	
	
	public function initConfig(x0, dirIzquierda:Bool, y0:Float = -1.0)
		
		{
		
		died = false;
		// Datos en X
		ax = 0;
		vx = 3;
		if (dirIzquierda) {
			vx = -vx;
		}
		sx = x0;
		x = x0;
		
		// Datos en Y	
		h = Screen.SCREEN_HEIGHT;
		}
		
		public function actualizarPosicion(incremento:Float)
		{
			
		}
		
		public function actualizarColision() { }
		
		public function disparar(time:Float) { }
		
		public function getDamage() { }
		
		public function die() { }
		
		override function updateLogic(time:Float) 
		{
				super.updateLogic(time);
				var incremento = time * 50;	
				actualizarPosicion(incremento);		
				disparar(time);
				actualizarColision();
		}
		
		public function colisionJugador(p:Player):Bool {
			return false;
		}
}