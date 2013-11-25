package game;
import engine.GameElement;
import flash.display.Bitmap;
import flash.display.Sprite;
import openfl.Assets;

/**
 * ...
 * @author ...
 */
class Screen extends GameElement
{	
	
	public static inline var WIDTH:Int = 760;
	public static inline var HEIGHT:Int = 560;
	
	private var p1:Player;
	
	private var fondo:Bitmap;
	var pelotas:Array<Ball>;
	var jugadores:Array<Player>;

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
		pelotas = new Array<Ball>();
		
		pelotas.push(new Ball(4, 10));
		pelotas.push(new Ball(4, 50));
		pelotas.push(new Ball(4, 90));
		pelotas.push(new Ball(4, 130));
		
		
		for (b in pelotas) {
			addChild(b);
			hijos.push(b);
		}
	}
	
	public function cargarJugadores() {
		jugadores = new Array<Player>();
		
		// Agregar jugador 1
		p1 = new Player(1);
		jugadores.push(p1);
		addChild(p1);		
		hijos.push(p1);
		
		p1.y = Screen.HEIGHT - p1.height;
		p1.x = 20;
		
		// Agregar jugador 2
	}
	
	override public function updateLogic(time:Float){
		super.updateLogic(time);
		
		for (j in jugadores) {
			for (soga in j.sogas) {
				// Para cada soga de cada jugador, verificar si colisiona con alguna pelota
				//trace("Traceando");
				
				var colisiona = false;
				for (b in pelotas) {
					if (!colisiona && soga.collisionTest(b)) {
						colisiona = true;
						trace("BOOM");
						
						// Eliminar soga
						j.finalizarDisparo(soga);
						
						// Reventar pelota
						b.reventar();
					}
				}
			}
		}
	}
}