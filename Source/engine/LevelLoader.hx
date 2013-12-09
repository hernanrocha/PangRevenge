package engine;

import game.ball.Ball;
import game.Screen;
import engine.Json;
import openfl.Assets;

class LevelLoader
{
	public var content:Dynamic;
	public var season:Dynamic;
	
	public function new(config:String) {
		trace(config);
		var jsonTxt = Assets.getText("assets/"+config);
		//trace(jsonTxt);
		content = Json.parse(jsonTxt);
	}
	
	public function setSeason(season:Int) {
		switch(season) {
			case 2:
				season = content.summer;
			case 3:
				season = content.autumn;
			case 4:
				season = content.winter;
			default:
				season = content.spring;
		}
	}
	
	public function load(lvl:Int) {
		//season[lvl]
	}
	
	private function spawnBalls(ballsArray:Array<Dynamic>) {
		for ( ball in ballsArray)
			spawnBall(ball);
	}
	private function spawnBall(ball:Dynamic) {
		var b = Ball.getBall(screen, ball.size );
		var x0:Float = ball.spawn.x * Screen.SCREEN_WIDTH;
		var y0:Float = ball.spawn.y * Screen.SCREEN_HEIGHT;
		if ( ball.spawn.inv == "true" ) x0 -= b.getWidth();
		
		b.spawnPolares(x0,y0,ball.spawn.angulo,ball.spawn.radio);
		
		//b.setPowerUp(PowerUp.get(PowerUp.POWERUP_SH));		
		screen.agregarPelota(b);
	}	
}