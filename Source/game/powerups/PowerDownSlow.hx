package game.powerups;

/**
 * ...
 * @author juampi92
 */
class PowerDownSlow extends PowerUp
{
	public static inline var DURACION = 3;

	public function new(){
		super();
		cargarBitmap("slow");
	}
	
	override function action(p:Player) {
		super.action(p);
		p.incrementarSpeed(false);
	}	
}