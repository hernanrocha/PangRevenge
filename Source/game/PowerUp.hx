package game;
import engine.GameElement;
import flash.display.Bitmap;
import flash.geom.Rectangle;
import openfl.Assets;
import game.powerups.*;
import engine.AudioManager;
import engine.Sonido;

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
	
	public static inline var POWERUP_DT:String = "DobleTiro";
	public static inline var POWERUP_SH:String = "Shield";
	public static inline var POWERUP_HOOK:String = "Hook";
	public static inline var POWERUP_FLECHA:String = "Flecha";
	public static inline var POWERUP_SPEED:String = "SpeedUp";
	
	public static inline var POWERDOWN_PAUSE:String = "Pause";
	public static inline var POWERDOWN_SPEED:String = "SpeedDown";
	public static inline var POWERDOWN_TS:String = "TiroSimple";
	
	static var powerUp_dt:PowerUp;
	static var powerUp_sh:PowerUp;
	static var powerUp_hook:PowerUp;
	static var powerUp_flecha:PowerUp;		
	static var powerUp_speed:PowerUp;
	
	static var powerDown_pause:PowerUp;
	static var powerDown_speed:PowerUp;
	static var powerDown_ts:PowerUp;
	

	
	public function new(screen:Screen) {
		super();
		this.screen = screen;
		boundingBox = BOUNDS_POWERUP;
	}
		
	public static function init(screen:Screen) {
		powerUp_dt = new PowerUpDobletiro(screen);
		powerUp_sh = new PowerUpShield(screen);
		powerUp_hook = new PowerUpWeaponHook(screen);
		powerUp_flecha = new PowerUpWeaponArrow(screen);		
		powerUp_speed = new PowerUpFast(screen);
		
		powerDown_pause = new PowerDownPause(screen);
		powerDown_speed = new PowerDownSlow(screen);
		powerDown_ts = new PowerDownTiroSimple(screen);
	}
	
	public static function reset() {
		// Borrar powerups positivos
		if (powerUp_dt.visible) powerUp_dt.despawn();
		if (powerUp_sh.visible) powerUp_sh.despawn();
		if (powerUp_hook.visible) powerUp_hook.despawn();
		if (powerUp_flecha.visible) powerUp_flecha.despawn();
		if (powerUp_speed.visible) powerUp_speed.despawn();
	
		// Borrar powerups negativos
		if (powerDown_pause.visible) powerDown_pause.despawn();
		if (powerDown_speed.visible) powerDown_speed.despawn();
		if (powerDown_ts.visible) powerDown_ts.despawn();
	}
	
	public function cargarBitmap(s:String) { // Protected
		sprite =  new Bitmap ( Assets.getBitmapData("images/powerups/" + s +".png") );
		addChild(sprite);
		visible = false;
	}
	
	public static function get(pu:String):PowerUp {
		switch( pu ) {
		case POWERUP_DT:
			return powerUp_dt;
		case POWERUP_FLECHA:
			return powerUp_flecha;
		case POWERUP_HOOK:
			return powerUp_hook;
		case POWERUP_SH:
			return powerUp_sh;
		case POWERUP_SPEED:
			return powerUp_speed;
		case POWERDOWN_PAUSE:
			return powerDown_pause;
		case POWERDOWN_SPEED:
			return powerDown_speed;
		case POWERDOWN_TS:
			return powerDown_ts;
		default:
			return null;
		}
	}
	
	public function spawn(posX:Float, posY:Float) {		
		x = posX;
		y = posY;
		visible = true;
		Vy = 1;
		time_left = SCREEN_TIME;
		
		screen.addChild(this);
		screen.hijos.push(this);
		screen.powerups.push(this);		// ESTA LINEA ME VOLVIÓ LOCO
		enPiso = false;
	}
	
	public function despawn() {
		enPiso = false;
		visible = false;
		screen.hijos.remove(this); // No más lógica
		screen.powerups.remove(this); // No más colision
		screen.removeChild(this);
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
		AudioManager.getInstance().justPlay(Sonido.POWERUP);
	}
	
}