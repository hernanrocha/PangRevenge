package ;
import flash.display.Bitmap;
import openfl.Assets;

/**
 * ...
 * @author ...
 */
class Player extends GameElement
{
	private var id:Int;
	var bitmap:Bitmap;
	
	public function new() 
	{
		super();
		
		id = 1;
		
		bitmap = new Bitmap (Assets.getBitmapData("images/player" + id + ".png"));
		
		addChild(bitmap);		
	}
	
	override function updateLogic(time:Float) {		
		
	}
}