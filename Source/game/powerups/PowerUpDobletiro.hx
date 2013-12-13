package game.powerups;

/**
 * ...
 * @author juampi92
 */
class PowerUpDobletiro extends PowerUp
{

	public function new(){
		super();
		cargarBitmap("doble_tiro_up");
	}
	
	override function action(p:Player) {
		super.action(p);
		p.incrementarMunicion(1);
	}	
}