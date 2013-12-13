package game.powerups;

/**
 * ...
 * @author juampi92
 */
class PowerDownPause extends PowerUp
{
	public static inline var DURACION = 1;

	public function new(){
		super();
		cargarBitmap("pause");
	}
	
	override function action(p:Player) {
		super.action(p);
		p.setPausa(DURACION);
	}	
}