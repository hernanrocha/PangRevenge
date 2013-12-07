package game;
import engine.ContAnimation;
import engine.GameElement;
import engine.InputManager;
import flash.display.Bitmap;
import flash.geom.Rectangle;
import openfl.Assets;

/**
 * ...
 * @author ...
 */
class Soga extends GameElement
{
	// Imagenes
	
		// Puntas
		private var flecha:ContAnimation;
		private var flecha_hielo:ContAnimation;
		private var flecha_fuego:ContAnimation;
		private var gancho:Bitmap;
		
		// Sogas
		private var soga_mov:ContAnimation;
		private var soga_fija:Bitmap;
	
	// 
	private var player:Player;	
	private var type:Int;
	private var estado:Int;
	
	private var onScreen:Bool = false;
	
	private var enTecho:Bool = false;
	private var timer:Float;
	public static inline var DURACION:Int = 4;
	
	// Dimensiones
	public static var BOUNCE_GANCHO:Rectangle = new Rectangle(2, 0, 5, 600);
	public static inline var HIELO:Int = 1;
	public static inline var FUEGO:Int = 2;
	
	
	// Propiedades
	var Vy:Float = 1.7;
	
	public function new(p:Player) 
	{
		super();
		
		this.cargarPuntas();
		this.cargarSogas();
		
		this.player = p;
		
		this.boundingBox = BOUNCE_GANCHO;
		
		setType(0);
		setEstado(0);
		
		visible = false;
	}
	
	public function cargarPuntas() {
		flecha = new ContAnimation( Assets.getBitmapData("images/flecha_default.png"), 3, 1);
		flecha_hielo = new ContAnimation( Assets.getBitmapData("images/flecha_hielo.png"), 3, 1);
		flecha_fuego = new ContAnimation( Assets.getBitmapData("images/flecha_fuego.png"), 3, 1);
		gancho = new Bitmap ( Assets.getBitmapData("images/gancho.png") );
		addChild(flecha);
		addChild(flecha_hielo);
		addChild(flecha_fuego);
		addChild(gancho);
		flecha.visible = false;
		flecha_hielo.visible = false;
		flecha_fuego.visible = false;
		gancho.visible = false;
	}
	public function cargarSogas() {
		soga_mov = new ContAnimation( Assets.getBitmapData("images/soga_movimiento.png"), 5, 1);
		soga_fija = new Bitmap ( Assets.getBitmapData("images/soga_fija.png") );
		
		soga_mov.x = 2;
		soga_fija.x = 10;
		
		soga_mov.y = soga_fija.y = 25; // Alto del gancho
		
		soga_fija.visible = false;
		soga_mov.visible = false;
		
		addChild(soga_fija);
		addChild(soga_mov);		
	}
	
	public function setEstado(e:Int) {
		estado = e;
		
		hijos.remove(flecha);
		hijos.remove(flecha_hielo);
		hijos.remove(flecha_fuego);
		flecha.visible = false;
		flecha_hielo.visible = false;
		flecha_fuego.visible = false;
		
		if ( e == 1 ) { // Hielo
			hijos.push(flecha_hielo);
			flecha_hielo.visible = true;
		} else if ( e == 2 ) { // Fuego
			hijos.push(flecha_fuego);
			flecha_fuego.visible = true;
		} else if ( e == 0 ) { // Def
			hijos.push(flecha);
			flecha.visible = true;
		}
	}
	
	public function disponible():Bool {
		return !onScreen;
	}
	
	public function isOnScreen():Bool {
		return onScreen;
	}
	
	public function disparar(posX:Float) {
		player.screen.addChild(this);
		player.hijos.push(this);
		
		enTecho = false;
		onScreen = true;
		visible = true;
		
		x = posX;
		y = Screen.SCREEN_HEIGHT - 10;
	}
	
	public function setType(t:Int) {
		type = t;
		
		hijos.remove(soga_mov);
		soga_mov.visible = false;
		soga_fija.visible = false;
		gancho.visible = false;
		
		if ( t == 0 ) { // Flecha
			setEstado(estado);
			hijos.push(soga_mov);
			soga_mov.visible = true;
			
			if (enTecho)
				unset();
				
		} else { // Gancho (estático)
			
			var e:Int = estado;
			setEstado(-1);
			estado = e;
			
			soga_fija.visible = true;
			gancho.visible = true;
		}
	}
	
	override function updateLogic(time:Float) {
		super.updateLogic(time);
		
		if ( enTecho ) {
			timer -= time;
			if ( timer < 0 ) colision();
			return;
		}
		
		// Actualizar posicion y
		y -= time * 250 * Vy;
				
		// Verificar que no se salga de pantalla
		if (y < 0) {
			y = 0;
			colisionTecho();
		}
		//}
	}
	
	// Qué le pasa a la soga cuando colisiona
	public function colision() {		
		unset();
	}
	
	private function colisionTecho() {
		enTecho = true;
		if ( type == 0 )
			colision();
		else
			hook();
	}
	
	public function unset() {
		if (onScreen) {
			player.finalizarDisparo();
			player.screen.removeChild(this);
		}
			
		enTecho = false;
		onScreen = false;
		this.visible = false;
		player.hijos.remove(this); // No más update Logic.
	}
	
	private function hook() {
		trace("El gancho llegó al techo");
		timer = DURACION;
	}
	
	override function collisionTest(ge:GameElement):Bool {
		if ( (y < ge.y + ge.boundingBox.height) && (x + boundingBox.x < ge.x + ge.boundingBox.width) && (x + boundingBox.x + boundingBox.width > ge.x) )
			return true;
		return false;
	}
	
	public function collisionBoss(ge:GameElement):Bool {
		if ( (y < ge.boundingBox.y/2 + 3*ge.boundingBox.height/4) && (x + boundingBox.x < ge.x + ge.boundingBox.x + 3*ge.boundingBox.width/4) && (x + boundingBox.x + 3*boundingBox.width/4 > ge.x + ge.boundingBox.x) )
			return true;
		return false;
	}
}