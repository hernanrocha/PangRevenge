package game.powerups;

/**
 * ...
 * @author juampi92
 */
class PowerUpShield extends PowerUp
{

	public function new(){
		super();
		cargarBitmap("shield");
	}
	
	override function action(p:Player) {
		super.action(p);
		p.setShield(true);
	}
	
}