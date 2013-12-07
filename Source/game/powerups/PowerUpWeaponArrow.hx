package game.powerups;
import game.PowerUp;
import game.Screen;

/**
 * ...
 * @author juampi92
 */
class PowerUpWeaponArrow extends PowerUp
{

	public function new(screen:Screen){
		super(screen);
		cargarBitmap("arrow");
	}
	
	override function action(p:Player) {
		super.action(p);
		p.setWeapon(0); // 1 Hook
	}	
}