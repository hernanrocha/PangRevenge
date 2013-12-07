package game.powerups;
import game.PowerUp;
import game.Screen;

/**
 * ...
 * @author juampi92
 */
class PowerDownTiroSimple extends PowerUp
{

	public function new(screen:Screen){
		super(screen);
		cargarBitmap("doble_tiro_down");
	}
	
	override function action(p:Player) {
		super.action(p);
		p.incrementarMunicion( -1);
	}	
}