package game.powerups;

/**
 * ...
 * @author juampi92
 */
class PowerDownTiroSimple extends PowerUp
{

	public function new(){
		super();
		cargarBitmap("doble_tiro_down");
	}
	
	override function action(p:Player) {
		super.action(p);
		p.incrementarMunicion( -1);
	}	
}