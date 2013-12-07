package game.powerups;
import game.PowerUp;
import game.Screen;

/**
 * ...
 * @author juampi92
 */
class PowerDownPause extends PowerUp
{
	public static inline var DURACION = 1;

	public function new(screen:Screen){
		super(screen);
		cargarBitmap("pause");
	}
	
	override function action(p:Player) {
		super.action(p);
		p.setPausa(DURACION);
	}	
}