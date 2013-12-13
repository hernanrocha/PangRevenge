package game.powerups;

/**
 * ...
 * @author juampi92
 */
class PowerUpWeaponHook extends PowerUp
{

	public function new(){
		super();
		cargarBitmap("hook");
	}
	
	override function action(p:Player) {
		super.action(p);
		p.setWeapon(1); // 1 Hook
	}	
}