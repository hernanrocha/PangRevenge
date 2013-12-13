package game.powerups;

import engine.GameElement;
import engine.AudioManager;
import engine.Sonido;
import openfl.Assets;
import flash.display.Bitmap;
import flash.geom.Rectangle;
import scenes.GameScene;

/**
 * ...
 * @author juampi92
 */
class PowerUp extends GameElement
{
	public static inline var SCREEN_TIME = 12;
	
	private var sprite:Bitmap;
	private var screen:Screen;
	
	private var Vy_roze:Float = 3;
	
	private var Vy_grav:Float = 0.5;
	private var Vy:Float;
	private var enPiso:Bool;
	
	private var time_left:Float;
	
	public static var BOUNDS_POWERUP:Rectangle =  new Rectangle(0, 0, 20, 20);
	
	public function new() {
		super();
		boundingBox = BOUNDS_POWERUP;
	}
		
	public static function init() {
		
	}
	
	public static function reset() {

	}
	
	private function cargarBitmap(s:String) { // Protected
		sprite =  new Bitmap ( Assets.getBitmapData("images/powerups/" + s +".png") );
		addChild(sprite);
		visible = false;
	}
	
	public function spawn(posX:Float, posY:Float) {		
		x = posX;
		y = posY;
		visible = true;
		Vy = 1;
		time_left = SCREEN_TIME;
		
		GameScene.screen.addChild(this);
		GameScene.screen.hijos.push(this);
		GameScene.powerupManager.powerups.push(this);
		enPiso = false;
	}
	
	public function despawn() {
		enPiso = false;
		visible = false;
		GameScene.screen.hijos.remove(this); // No más lógica
		GameScene.powerupManager.powerups.remove(this); // No más colision
		GameScene.screen.removeChild(this);
	}
	
	public function rebote() {
		y = (Screen.SCREEN_HEIGHT - boundingBox.height);
		if ( Vy <= 3 ) {
			enPiso = true;//screen.hijos.remove(this);
			Vy = 0;
		}
		Vy = -Vy / Vy_roze;
	}
	
	override function updateLogic(time:Float) {
		super.updateLogic(time);
		
		time_left -= time;
		if ( time_left <= 0 ) {
			this.despawn();
			return;
		}
		
		if ( enPiso ) return;
		
		y = y + time * 20 * Vy;
		Vy = Vy + Vy_grav;
		
		if ( y > (Screen.SCREEN_HEIGHT-boundingBox.height) )
			this.rebote();
	}
	
	public function action(p:Player) {
		this.despawn();
		
		//SONIDO
		PangRevenge.audioManager.justPlay(Sonido.POWERUP);
	}
	
}