package engine;

import game.ball.Ball;
import game.ball.FireBall;
import game.ball.SnowBall;
import game.bosses.Boss;
import game.bosses.FireBoss;
import game.bosses.IceBoss;
import game.Screen;
import engine.Json;
import openfl.Assets;
import scenes.GameScene;

class LevelLoader
{
	public var content:Dynamic;
	public var year:Dynamic;
	public var season:Dynamic;
	public var level:Dynamic;
	
	public function new(config:String) {
		var jsonTxt = Assets.getText("assets/"+config);
		content = Json.parse(jsonTxt);
		year = content[0];
		season = year.spring;
		level = season.lvls[0];
		
		//trace(content);
	}
	
	// Setters
	public function setYear(year:Int) {
		if ( year < content.length )
			this.year = content[year];
	}	
	public function setSeason(season:Int) {
		switch(season) {
			case 2:
				this.season = year.summer;
			case 3:
				this.season = year.autumn;
			case 4:
				this.season = year.winter;
			default:
				this.season = year.spring;
		}
	}	
	public function setLevel(lvl:Int) {
		if ( lvl < season.lvls.length )
			this.level = season.lvls[lvl];
	}
	
	// Getters:
	public function getLevels():Int {
		return season.lvls.length;
	}
	public function hasBoss():Bool {
		return ( season.boss != null );
	}
	public function getYears():Int {
		return content.length;
	}
	
	// Seasons:
	public function loadSound() {
		PangRevenge.audioManager.addLibreria(season.sound);
	}
	public function playSound() {
		//PangRevenge.audioManager.setSound(season.sound);
	}
	public function setBackground() {
		GameScene.screen.setBackground("images/fondos/" + season.background );
	}
	
	// Levels
	public function loadLevel(lvl:Int) {
		GameScene.screen.ubicarPlayers(level.players);
		this.spawnBalls(level.bolas);
		GameScene.screen.showLevelName(lvl + 1, level.msj);
	}
	
	private function spawnBalls(ballsArray:Array<Dynamic>) {
		for ( ball in ballsArray)
			spawnBall(ball);
	}
	private function spawnBall(ball:Dynamic) {
		var b:Ball;		
		switch(ball.tipo) {
			default: b = Ball.getBall( ball.size );
			case "fuego": b = FireBall.getBall( ball.size );
			case "hielo": b = SnowBall.getBall( ball.size );
		}
		
		var x0:Float = (ball.spawn.x/100) * Screen.SCREEN_WIDTH;
		var y0:Float = (ball.spawn.y / 100) * Screen.SCREEN_HEIGHT;
		if ( ball.spawn.inv == "true" ) x0 -= b.getWidth();
		
		b.spawnPolares(x0,y0,ball.spawn.angulo,ball.spawn.radio);
		
		b.setPowerUps(ball.powerups);
		GameScene.screen.agregarPelota(b);
	}
	
	// Boss
	public function loadBossLevel():Boss {
		var boss:Boss;
		switch ( season.boss.id ) {
			case 2: boss = new IceBoss(season.boss.name, season.boss.hits);
			default: boss = new FireBoss(season.boss.name, season.boss.hits);
		}		
		boss.init(250, false);
		GameScene.screen.setHudBoss(boss);
		GameScene.screen.ubicarPlayers(season.boss.players);
		GameScene.screen.showLevelName(0, season.boss.msj);
		return boss;
	}
}