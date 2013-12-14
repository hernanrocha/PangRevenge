package game;

import game.powerups.*;

/**
 * ...
 * @author juampi92
 */
class PowerupManager
{
	private var libreria:Map<String,Array<PowerUp>>;
	
	public var powerups(default, null):Array<PowerUp>;

	public function new(){
		libreria = new Map<String,Array<PowerUp>>();
		powerups = new Array<PowerUp>();
		
		libreria.set("DobleTiro", new Array<PowerUp>() );
		libreria.set("Shield", new Array<PowerUp>() );
		libreria.set("Hook", new Array<PowerUp>() );
		libreria.set("Flecha", new Array<PowerUp>() );
		libreria.set("SpeedUp", new Array<PowerUp>() );		
		libreria.set("Pause", new Array<PowerUp>() );
		libreria.set("SpeedDown", new Array<PowerUp>() );
		libreria.set("TiroSimple", new Array<PowerUp>() );
	}
	
	public function init() {
		
	}
	
	public function reset() {
		for ( pwups in libreria )
			for ( pwup in pwups )
				if (pwup.visible) pwup.despawn();
	}
	
	public function spawnPowerUp(nom:String , x:Float , y:Float) {
		var pu:PowerUp = getPowerup(nom);
		
		if ( pu == null ) {
			trace("ERROR!!!!");
			return;
		}
		getPowerup(nom).spawn(x, y);
	}
	
	private function getPowerup(nom:String):PowerUp {
		if ( ! libreria.exists(nom) ) return null;
		
		var pups:Array<PowerUp> = libreria.get(nom);
			
		// Itero hasta encontrar un powerup disponible
		for ( powerup in pups )
			if ( ! powerup.visible ) return powerup;
		
		var newPowerup:PowerUp = getNewPowerUp(nom);
		if ( newPowerup != null ) pups.push(newPowerup);
		return newPowerup;
	}
	
	private function getNewPowerUp(nom:String):PowerUp {
		switch (nom) {
			case "DobleTiro": return new PowerUpDobletiro();
			case "Shield": return new PowerUpShield();
			case "Hook": return new PowerUpWeaponHook();
			case "Flecha": return new PowerUpWeaponArrow();
			case "SpeedUp": return new PowerUpFast();			
			case "Pause": return new PowerDownPause();
			case "SpeedDown": return new PowerDownSlow();
			case "TiroSimple": return new PowerDownTiroSimple();
			default: trace("ERROR, pidiendo powerup inexistente: " + nom);
		}
		return null;
	}
	
}