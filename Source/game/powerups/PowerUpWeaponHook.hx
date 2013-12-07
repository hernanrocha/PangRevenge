package game.powerups;
import game.PowerUp;
import game.Screen;

/**
 * ...
 * @author juampi92
 */
class PowerUpWeaponHook extends PowerUp
{

	public function new(screen:Screen){
		super(screen);
		cargarBitmap("hook");
	}
	
	override function action(p:Player) {
		super.action(p);
		p.setWeapon(1); // 1 Hook
	}	
}