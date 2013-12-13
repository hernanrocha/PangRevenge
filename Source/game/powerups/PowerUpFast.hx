package game.powerups;

/**
 * ...
 * @author juampi92
 */
class PowerUpFast extends PowerUp
{
	public static inline var DURACION = 3;

	public function new(){
		super();
		cargarBitmap("fast");
	}
	
	override function action(p:Player) {
		super.action(p);
		p.incrementarSpeed(true);
	}	
}