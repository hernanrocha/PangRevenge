package ;
import flash.display.Bitmap;
import flash.display.Sprite;
import openfl.Assets;

/**
 * ...
 * @author ...
 */
class Screen extends GameElement
{	
	private var b1:Ball;
	private var b2:Ball;
	private var b3:Ball;
	
	public static inline var WIDTH:Int = 760;
	public static inline var HEIGHT:Int = 560;
	
	private var p1:Player;
	
	private var fondo:Bitmap;

	public function new() 
	{
		super();
		
		// Fondo
		fondo = new Bitmap( Assets.getBitmapData ("images/fondo_verano.jpg"));
		addChild(fondo);
		fondo.width = 760;
		fondo.height = 560;
		
		// Pelotas
		cargarPelotas();
		
		// Jugadores
		cargarJugadores();
	}
	
	public function cargarPelotas() {
		b1 = new Ball(stage, 30, 0, 300);
		b2 = new Ball(stage, 200, 10, 450);
		b3 = new Ball(stage, 0, 5, 150);
		
		addChild(b1);
		addChild(b2);
		addChild(b3);
		
		hijos.push(b1);
		hijos.push(b2);
		hijos.push(b3);
	}
	
	public function cargarJugadores() {
		p1 = new Player();		
		addChild(p1);		
		hijos.push(p1);
		
		p1.y = Screen.HEIGHT - p1.height;
		p1.x = 20;
	}
}