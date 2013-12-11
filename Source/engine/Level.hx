package engine;
import game.bosses.Boss;
import scenes.GameScene;

class Level {
	
	// Propiedades
	public var year(default, null):Int = 0;
	public var season(default, null):Int = 1;
	public var level(default, null):Int = -1;
	public var lvl_boss(default, null):Bool = false;
	
	// Variables
	public var boss_dead(default, null):Bool = false;
	public var boss(default, null):Boss;
	public var ballCount(default, null):Int = 0;
	public var time(default, null):Float = 0;

	public function new() {}
	
	public function load() {
		ballCount = 0;
		// Load level
		if ( ! lvl_boss ){
			GameScene.lvlLoader.loadLevel(this.level);
			GameScene.hud.setEscena(level+1, season);
		}else {
			boss_dead = false;
			boss = GameScene.lvlLoader.loadBossLevel();
			GameScene.hud.setEscena(level+2, season);
		}
	}
	
	// Nexts:
	public function nextLevel():Bool { // False si es End of Season
		lvl_boss = false;
		
		if ( (level+1) < GameScene.lvlLoader.getLevels() ) { // Quedan más niveles
			setLevel(level+1);
		} else if ( GameScene.lvlLoader.hasBoss() && !boss_dead ) // No quedan más niveles pero hay jefe
			lvl_boss = true;
		else
			return false;
		
		return true;
	}
	public function nextSeason():Bool { // False si es Last Season
		if ( season < 4 ) {
			season++;
			GameScene.lvlLoader.setSeason(season);
			level = -1;
			return true;
		}
		return false;
	}
	public function nextYear():Bool { // False si no existen más años
		if ( (year + 1) < GameScene.lvlLoader.getYears() ) {
			setYear(year+1);
			return true;
		}
		return false;
	}
	
	// Setters
	public function setYear(v:Int) {
		year = v;
		season = 0;
		GameScene.lvlLoader.setYear(year);
	}
	public function setSeason(v:Int) {
		season = v;
		level = -1;
		GameScene.lvlLoader.setSeason(season);
	}
	public function setLevel(v:Int) {
		level = v;
		GameScene.lvlLoader.setLevel(level);
	}
	
	public function clear() {
		// Resets leveler
	}
	
	public function ballCounter(inc:Bool) {
		if ( inc )
			ballCount++;
		else
			ballCount--;
	}
	
	public function killBoss () { 
		boss_dead = true;
	}
	
}