package game.powerups;
import game.PowerUp;
import game.Screen;

/**
 * ...
 * @author juampi92
 */
class PowerUpDobletiro extends PowerUp
{

	public function new(screen:Screen){
		super(screen);
		cargarBitmap("doble_tiro_up");
	}
	
	override function action(p:Player) {
		super.action(p);
		p.incrementarMunicion(1);
	}	
}