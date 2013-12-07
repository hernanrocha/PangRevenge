package game.powerups;
import game.Hud;
import game.PowerUp;
import game.Screen;

/**
 * ...
 * @author juampi92
 */
class PowerUpFast extends PowerUp
{
	public static inline var DURACION = 3;

	public function new(screen:Screen){
		super(screen);
		cargarBitmap("fast");
	}
	
	override function action(p:Player) {
		super.action(p);
		p.incrementarSpeed(true);
	}	
}