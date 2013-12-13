package game.powerups;

/**
 * ...
 * @author juampi92
 */
class PowerUpWeaponArrow extends PowerUp
{

	public function new(){
		super();
		cargarBitmap("arrow");
	}
	
	override function action(p:Player) {
		super.action(p);
		p.setWeapon(0); // 1 Hook
	}	
}