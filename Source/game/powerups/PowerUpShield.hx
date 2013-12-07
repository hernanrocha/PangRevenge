package game.powerups;
import game.PowerUp;
import game.Screen;

/**
 * ...
 * @author juampi92
 */
class PowerUpShield extends PowerUp
{

	public function new(screen:Screen){
		super(screen);
		cargarBitmap("shield");
	}
	
	override function action(p:Player) {
		super.action(p);
		p.setShield(true);
	}
	
}