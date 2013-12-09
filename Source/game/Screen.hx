package game;
import engine.Button;
import engine.GameElement;
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;
import game.bosses.Boss;
import openfl.Assets;
import motion.Actuate;
import scenes.GameScene;
import engine.InputManager;
import game.ball.*;
import engine.AudioManager;
import engine.Sonido;


/**
 * ...
 * @author ...
 */
class Screen extends GameElement
{	
	// Constantes
	public static inline var SCREEN_WIDTH:Int = 760;
	public static inline var SCREEN_HEIGHT:Int = 460;
	
	// Fondo
	private var fondo:Bitmap;
	
	// Estado del juego
	public var pelotasCantidad:Int;
	public var enJuego:Bool;
	
	// Objetos en pantalla
	public var p1:Player;
	public var p2:Player;
	
	private var p1muerto:Bool;
	private var p2muerto:Bool;
	
	var jugadores:Array<Player>;
	public var pelotas:Array<Ball>;
	public var boss:Boss;
	public var powerups:Array<PowerUp>;
	
	public var btnLevel:Button;
	public var game:GameScene;
	
	private var text_subtitle:TextField;
	private var text_message:TextField;
	private var text_success:TextField;

	public function new(p_game:GameScene) 
	{
		super();
		
		game = p_game;
		
		loadPlayers();
		
		// Fonts
		initFonts();
	}
	
	public function init() {
		// Fondo
		addChild(fondo);
		
		// Jugador
		jugadores.push(p1);
		addChild(p1);
		hijos.push(p1);
		p1.reset();
		
		if (GameScene.PLAYER_CANT >= 2) {			
			jugadores.push(p2);
			addChild(p2);
			hijos.push(p2);
			p2.reset();
		}
		
		// PowerUp
		loadPowerUps();
	}
	
	public function end() {
		// Fondo
		removeChild(fondo);
		
		// Jugador
		unloadPlayers();
		
		// PowerUp (nada)
	}
	
	private function initFonts() {
		var font = openfl.Assets.getFont('fonts/JOINTBYPIZZADUDE.ttf').fontName;
		
		text_format_subtitle = new TextFormat(font);
		text_format_subtitle.size = 40*0.8;
		text_format_subtitle.color = 0x000000;
		text_format_subtitle.bold = true;
		
		var text_subtitle=new TextField();
		text_subtitle.selectable=false;
		text_subtitle.height=40;
		text_subtitle.setTextFormat(text_format_subtitle);
		
		text_format_message = new TextFormat(font);
		text_format_message.size = 100*0.8;
		text_format_message.color = 0x000000;
		
		text_message=new TextField();
		text_message.selectable=false;
		text_message.height = 100;
		text_message.setTextFormat(text_format_message);
		
		text_format_success = new TextFormat(font);
		text_format_success.size = 100*0.8;
		text_format_success.color = 0x00FF00;
		
		text_success=new TextField();
		text_success.selectable=false;
		text_success.height = 100;
		text_success.setTextFormat(text_format_success);
		text_success.text = "Nivel superado";
		textAdjustPos(text_success);
	}

	public function setBackground(img:String) {
		fondo = new Bitmap( Assets.getBitmapData (img));
		fondo.width = SCREEN_WIDTH;
		fondo.height = SCREEN_HEIGHT;
	}
	
	public function loadPlayers() {		
		jugadores = new Array<Player>();
		
		// Agregar jugador 1
		p1 = new Player(this, game.hud, 1);
		
		// Agregar jugador 2
		p2 = new Player(this, game.hud, 2);	
		
		restablecerPosiciones();
	}
	
	public function restablecerPosiciones(distancia:Float = -1) {
		if ( distancia == -1 ) distancia = Player.P1_X_INICIAL;
		
		p1.y = Screen.SCREEN_HEIGHT - p1.height;
		p1.x = distancia;
		p2.y = Screen.SCREEN_HEIGHT - p2.height;
		p2.x = Screen.SCREEN_WIDTH - distancia - p2.width;
	}
	
	public function unloadPlayers() {		
		if ( !p1muerto ) {			
			p1.reset();
			jugadores.remove(p1);
			removeChild(p1);
			hijos.remove(p1);
		}
		
		
		if (GameScene.PLAYER_CANT >= 2 &&  !p2muerto) {
			p2.reset();
			jugadores.remove(p2);
			removeChild(p2);
			hijos.remove(p2);
		}
	}
	
	public function unload1() {		
		p1.reset();
		jugadores.remove(p1);
		removeChild(p1);
		hijos.remove(p1);
		p1muerto = true;
	}
	
	
	public function unload2() {		
		p2.reset();
		jugadores.remove(p2);
		removeChild(p2);
		hijos.remove(p2);
		p2muerto = true;
	}
	
	public function loadPowerUps() {
		powerups = new Array<PowerUp>();
		PowerUp.init(this);
	}
	
	public function agregarPelota(b:Ball) {
		// Agregar a pelotas comunes
		pelotas.push(b);
		addChild(b);
		hijos.push(b);
		
		// Sumar cantidad
		pelotasCantidad++;
	}	
	
	public function desactivarPelota(b:Ball) {
		pelotas.remove(b);
	}
	
	public function eliminarPelota(b:Ball) {
		removeChild(b);
		hijos.remove(b);		
		pelotasCantidad--;
	}
	
	public function resetLevel() {
		// Eliminar pelotas (no borra de pelotas)
		for (p in pelotas) {
			eliminarPelota(p);
		}
		
		// Reestablecer jugador y eliminar sogas
		for (p in jugadores) {
			p.reset();
		}
			
		// Eliminar powerups
		PowerUp.reset();
	}
	
	private function textAdjustPos(text:TextField) {
		text.x = (SCREEN_WIDTH - text.width) / 2;
		text.y = (SCREEN_HEIGHT - text.height) / 2;
	}
	
	public function showLevelName(str:Int , subtitle:String) {
		// Setear texto
		text_message.text = "Nivel " + str;		
		text.alpha = 0;
		textAdjustPos(TEXT);
		
		addChild(text);		
		Actuate.tween(text, 1, { alpha: 1 } ).delay(1).onComplete(function() {
			showSubtitle(subtitle);
			Actuate.tween(text, 1, { alpha: 0 } ).delay(3).onComplete(startLevel);
		});
	}
		
	public function showSubtitle(msj:String, time:Float) {
		
		text_subtitle.text = msj;
		text_subtitle.alpha = 0;
		textAdjustPos(text_subtitle);
		
		addChild(mensaje);
		
		Actuate.tween(mensaje, time, { alpha: 1 } ).onComplete(function() { mensaje.alpha = 0; removeChild(mensaje); } );
	}
		
	public function startLevel() {
		enJuego = true;
	}
	
	public function showScore() {
		text.alpha = 0;
		
		addChild(text);
		Actuate.tween(text, 1, { alpha: 1 } ).delay(0).onComplete(function() {
			Actuate.tween(text, 1, { alpha: 0 } ).delay(1).onComplete(game.loadLevel);
		});
	}
	
	public function iniciarVida(p:Player) {
		enJuego = true;
	}
	
	override public function updateLogic(time:Float){
		if (enJuego && !game.enPausa) {
			super.updateLogic(time);
			
			// Colisiones Pelota(normal, fuego) y boss - soga
			for (j in jugadores) {
				for (soga in j.sogas ) {
					// Para cada soga de cada jugador, verificar si colisiona con alguna pelota
					
					if ( soga.isOnScreen() ) {
						var colisiona = false;
						for (b in pelotas) {
							if (!colisiona && soga.collisionTest(b)) {
								colisiona = true;
								
								// Eliminar soga
								soga.colision();
								
								// Reventar pelot
								AudioManager.getInstance().justPlay(Sonido.EXPLO1);
								b.reventar();
								
								// Sumar puntos
								game.hud.addScore(j.id, 50);
							}
						}
						
						if (boss != null && !colisiona && soga.collisionBoss(boss)) {
							colisiona = true;
							soga.colision();
							boss.getDamage();
							game.hud.addScore(j.id, 50);
						}
					}
				}
				// COLISION DE POWERUPS !!!
				for (pu in powerups) {
					if ( j.collisionTest(pu) ) {
						pu.action(j);
					}
				}
				
				// Colision jugador - boss
				if (boss != null && boss.colisionJugador(j)) {
					j.actionMorir(null);
				}
			}
			
			// Colisiones Jugador - Pelota
			for (b in pelotas) {
				for (j in jugadores) {
					if (b.colisionJugador(j)) {
						j.actionMorir(b);
					}
				}
			}
			

			
		}
	}
	
	public function gameOver() {		
		game.sm.switchScene('gameover');
	}
}