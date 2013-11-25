package game;
import engine.GameElement;
import flash.display.Bitmap;
import openfl.Assets;
import engine.InputManager;

/**
 * ...
 * @author ...
 */
class Player extends GameElement
{
	private var id:Int;
	private var municion:Int = 2;
	private var disparando:Bool;	
	
	public var sogas:Array<Soga>;
	
	var bitmap:Bitmap;
	
	public function new(playerId:Int) 
	{
		super();
		
		id = playerId;	
		
		sogas = new Array<Soga>();
		
		bitmap = new Bitmap (Assets.getBitmapData("images/player" + id + ".png"));		
		addChild(bitmap);
	}
	
	public function iniciarDisparo() {
		trace("Iniciar disparo");
		var soga = new Soga(this);
		sogas.push(soga);
		parent.addChild(soga);
		hijos.push(soga);
	}
	
	public function finalizarDisparo(soga:Soga) {
		trace("Finalizar disparo");
		sogas.remove(soga);
		parent.removeChild(soga);
		hijos.remove(soga);
	}
	
	override function updateLogic(time:Float) {
		super.updateLogic(time);
		
		var mov = time * 250;
		
		// Mover jugador
		if (InputManager.getInstance().keyCodePressed(InputManager.config.get("P" + id + "_LEFT"))) {
			x -= mov;
		}
		
		if (InputManager.getInstance().keyCodePressed(InputManager.config.get("P" + id + "_RIGHT"))) {
			x += mov;
		}
		
		if (x < 0) {
			x = 0;
		}
		
		if (x + width > Screen.WIDTH) {
			x = Screen.WIDTH - width;
		}
		
		// Disparar
		if (InputManager.getInstance().keyCodePressed(InputManager.config.get("P" + id + "_FIRE"))) {
			if (!disparando && sogas.length < municion) {
				iniciarDisparo();
			}
			disparando = true;
		}else {
			disparando = false;
		}
	}
}