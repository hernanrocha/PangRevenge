package game;
import engine.ContAnimation;
import engine.GameElement;
import flash.display.Bitmap;
import flash.geom.Rectangle;
import openfl.Assets;

/**
 * ...
 * @author ...
 */
class Soga extends GameElement
{
	//private var id:Int;
	//private var municion:Int = 2;
	//private var disparando:Bool;
	
	//var bitmap:Bitmap;
	var gancho:ContAnimation;
	var player:Player;
	
	
	public static var BOUNCE_SOGA:Rectangle = new Rectangle(0, 0, 10, 600);
	
	public function new(p:Player) 
	{
		super();
		
		// Imagen animada gancho
		gancho = new ContAnimation( Assets.getBitmapData("images/gancho.png"), 3, 1);
		addChild(gancho);
		hijos.push(gancho);
		
		player = p;
		
		init(p.x);
	}
	
	public function init(posX:Float) {
		x = posX;
		y = Screen.HEIGHT - 10;
		
		boundingBox = BOUNCE_SOGA;
	}
	
	override function updateLogic(time:Float) {
		super.updateLogic(time);
		
		// Actualizar posicion y
		var mov = time * 350;		
		y -= mov;
				
		// Verificar que no se salga de pantalla
		if (y < 0) {
			player.finalizarDisparo(this);
		}
		
	}
	
	override function collisionTest(ge:GameElement):Bool {
		if ( (y < ge.y + ge.boundingBox.height) && (x < ge.x + ge.boundingBox.width) && (x + boundingBox.width > ge.x) ) {
			trace("Explota: (" + x + "," + y + ") - (" + ge.x + "," + ge.y + ")");			
			trace("Datos: (" + boundingBox.height + "," + boundingBox.width + ") - (" + ge.boundingBox.height + "," + ge.boundingBox.width + ")");
			return true;
		}
		return false;
	}
}