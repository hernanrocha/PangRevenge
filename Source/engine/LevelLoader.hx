package engine;

import game.ball.Ball;
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
		trace(config);
		var jsonTxt = Assets.getText("assets/"+config);
		//trace(jsonTxt);
		content = Json.parse(jsonTxt);
		year = content[0];
		season = year.spring;
		level = season.lvls[0];
	}
	
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
			this.level = season.lvls[year];
	}
	
	public function setBackground() {
		GameScene.screen.setBackground("images/fondos/" + season.background );
	}
	
	private function spawnBalls(ballsArray:Array<Dynamic>) {
		for ( ball in ballsArray)
			spawnBall(ball);
	}
	private function spawnBall(ball:Dynamic) {
		var b = Ball.getBall( ball.size );
		var x0:Float = ball.spawn.x * Screen.SCREEN_WIDTH;
		var y0:Float = ball.spawn.y * Screen.SCREEN_HEIGHT;
		if ( ball.spawn.inv == "true" ) x0 -= b.getWidth();
		
		b.spawnPolares(x0,y0,ball.spawn.angulo,ball.spawn.radio);
		
		//b.setPowerUp(PowerUp.get(PowerUp.POWERUP_SH));		
		GameScene.screen.agregarPelota(b);
	}	
}