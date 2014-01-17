package engine;

/**
 * ...
 * @author ...
 */
class GameState
{
	static var estacion:Int = 1;
	
	public function new() 
	{
		
	}
	
	// Estacion maxima habilitada (GETTER)
	public static function fbGetSeason() : Int {
		return estacion;
	}
	
	// Estacion maxima habilitada (SETTER)
	public static function fbSetSeason(season:Int) {
		estacion = season;
	}
	
	
}