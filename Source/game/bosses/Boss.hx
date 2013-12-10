package game.bosses;
import engine.GameElement;
import scenes.GameScene;
import flash.display.Bitmap;
import game.Screen;
/**
 * ...
 * @author ...
 */
class Boss extends GameElement {	
	
	public var nombre(default, null):String;
	
	private var died:Bool;
	private var ax:Float;
	private var vx:Float;
	private var sx:Float;
	private var h:Float;
	
	var radio:Float = 100;
	
	private var health:Int;
	private var max_health:Int;
	
	public function new( name:String , hits:Int ) {
		super();
		this.nombre = name;
		this.health = hits;
		this.max_health = hits;
	}
	
	public function init(p_x0:Int, dirIzquierda:Bool, p_y:Float = -1.0) {
		// Configurar datos de control
		initConfig(p_x0, dirIzquierda, p_y);
		
		// Init logico y grafico
		GameScene.screen.addChild(this);
		GameScene.screen.hijos.push(this);
	}
	
	public function end() {
		// Init logico y grafico
		GameScene.screen.removeChild(this);
		GameScene.screen.hijos.remove(this);
	}
	
	
	public function initConfig(x0, dirIzquierda:Bool, y0:Float = -1.0)	{
		
		died = false;
		// Datos en X
		ax = 0;
		vx = 3;
		if (dirIzquierda) {
			vx = -vx;
		}
		sx = x0;
		x = x0;
		
		// Datos en Y	
		h = Screen.SCREEN_HEIGHT;
	}
		
	public function actualizarPosicion(incremento:Float){}
		
	public function actualizarColision() {}
		
	public function disparar(time:Float) {}
		
	public function getDamage() {}
		
	public function die() { }
		
	override function updateLogic(time:Float){
		super.updateLogic(time);
		var incremento = time * 50;	
		actualizarPosicion(incremento);		
		disparar(time);
		actualizarColision();
	}
	
	public function colisionJugador(p:Player):Bool {
		return false;
	}
}