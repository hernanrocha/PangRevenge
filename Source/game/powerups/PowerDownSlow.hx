package game.powerups;
import game.PowerUp;
import game.Screen;

/**
 * ...
 * @author juampi92
 */
class PowerDownSlow extends PowerUp
{
	public static inline var DURACION = 3;

	public function new(screen:Screen){
		super(screen);
		cargarBitmap("slow");
	}
	
	override function action(p:Player) {
		super.action(p);
		p.incrementarSpeed(false);
	}	
}