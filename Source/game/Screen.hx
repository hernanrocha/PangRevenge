package game;
import engine.Button;
import engine.GameElement;
import flash.display.Bitmap;
import flash.display.Sprite;
import openfl.Assets;
import motion.Actuate;
import scenes.GameScene;

/**
 * ...
 * @author ...
 */
class Screen extends GameElement
{	
	
	public static inline var SCREEN_WIDTH:Int = 760;
	public static inline var SCREEN_HEIGHT:Int = 560;
	
	private var p1:Player;
	private var enJuego:Bool;
	private var currentLevel:Int;
	private var pelotasCantidad:Int;
	
	private var fondo:Bitmap;
	public var pelotas:Array<Ball>;
	var jugadores:Array<Player>;
	
	public var btnLevel:Button;
	private var game:GameScene;

	public function new(p_game:GameScene) 
	{
		super();
		
		game = p_game;
		
		// Fondo
		fondo = new Bitmap( Assets.getBitmapData ("images/fondo_verano.jpg"));
		addChild(fondo);
		fondo.width = 760;
		fondo.height = 560;
		
		// Pelotas
		
		// Jugadores
		cargarJugadores();
		
		currentLevel = 1;
		startLevel(currentLevel);
	}
	
	public function cargarPelotas(nivel:Int) {
		pelotas = new Array<Ball>();
		pelotasCantidad = 0;
		
		if (nivel == 1) {
			var separacion = 40;
			var xInicial = 250;
			var cantidad = 8;
			var mitad = 4;
			
			for (i in 0 ... cantidad) {				
				agregarPelota(new Ball(this, 4, xInicial + i * separacion, i < mitad));
			}
		}else if (nivel == 2) {
			agregarPelota(new Ball(this, 3, 350, true));
			agregarPelota(new Ball(this, 3, 450, false));			
		}else if (nivel == 3) {
			// Agregar pelotas del medio
			agregarPelota(new Ball(this, 2, 350, true));
			agregarPelota(new Ball(this, 2, 450, false));
			
			// Agregas pelotas de borde
			agregarPelota(new Ball(this, 3, 0, true));
			agregarPelota(new Ball(this, 3, SCREEN_WIDTH - 75, false));	
		}
		
	}
	
	public function agregarPelota(b:Ball) {
		pelotas.push(b);
		addChild(b);
		hijos.push(b);
		
		pelotasCantidad++;
	}
	
	public function desactivarPelota(b:Ball) {
		pelotas.remove(b);
	}
	
	public function eliminarPelota(b:Ball) {
		trace("Borrar pelota");
		removeChild(b);
		hijos.remove(b);		
		
		pelotasCantidad--;
	}
	
	public function cargarJugadores() {
		jugadores = new Array<Player>();
		
		// Agregar jugador 1
		p1 = new Player(1);
		jugadores.push(p1);
		addChild(p1);		
		hijos.push(p1);
		
		p1.y = Screen.SCREEN_HEIGHT - p1.height;
		p1.x = 20;
		
		// Agregar jugador 2
	}
	
	public function startLevel(level:Int) {
		// Cargar pelotas
		cargarPelotas(level);
		
		btnLevel = new Button(400, 100, 0x00FF00, play, 'Nivel ' + level);
		btnLevel.x = -400;
		btnLevel.y = 300;
		addChild(btnLevel);
		
		showLevel();
	}
	
	public function showLevel() {
		Actuate.tween(btnLevel, 1, { x: 200 } ).delay(2).onComplete(hideLevel);
	}
	
	public function play() { }
	
	public function hideLevel() {
		Actuate.tween(btnLevel, 1, { x: 800 } ).delay(2).onComplete(start);
	}
	
	public function start() {
		enJuego = true;
	}
	
	override public function updateLogic(time:Float){
		if (enJuego && !game.enPausa) {
			super.updateLogic(time);
			
			// Colisiones pelota - soga
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
			
			// Detectar fin de nivel (No anima la ultima pelota)
			if (pelotasCantidad == 0) {
				finalizarNivel();
			}
			
		}
	}
	
	public function finalizarNivel() {
		trace("Fin de nivel");
		enJuego = false;
		currentLevel++;
		startLevel(currentLevel);
	}
}