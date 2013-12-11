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

class Screen extends GameElement
{	
	// Constantes
	public static inline var SCREEN_WIDTH:Int = 760;
	public static inline var SCREEN_HEIGHT:Int = 460;
	
	// Fondo
	private var fondo:Bitmap;
	
	// Estado del juego
	public var enJuego:Bool;
	
	// Objetos en pantalla	
	public var jugadores(default, null):Array<Player>;
	
	public var pelotas(default, null):Array<Ball>;
	public var boss(default, null):Boss;
	public var powerups(default, null):Array<PowerUp>;
	
	public var btnLevel:Button;
	
	private var text_subtitle:TextField;
	private var text_message:TextField;
	private var text_success:TextField;

	public function new(x:Float,y:Float){
		super();
		
		this.x = x;
		this.y = y;
		
		loadPlayers();
		
		// Fonts
		initFonts();
		pelotas = new Array<Ball>();
	}
	
	public function init() {
		// Fondo
		addChild(fondo);
		
		// Jugador
		for ( it in 0 ... GameScene.PLAYER_CANT )
			jugadores[it].init();
		
		// PowerUp
		loadPowerUps();
	}
	
	public function end() {
		// Fondo
		removeChild(fondo);
		
		// Jugador
		for ( it in 0 ... GameScene.PLAYER_CANT )
			jugadores[it].end();
	}
	
	private function initFonts() {
		var font = openfl.Assets.getFont('fonts/JOINTBYPIZZADUDE.ttf').fontName;
		
		var text_format_subtitle:TextFormat = new TextFormat(font);
		text_format_subtitle.size = 40*0.8;
		text_format_subtitle.color = 0x000000;
		text_format_subtitle.bold = true;
		
		text_subtitle=new TextField();
		text_subtitle.selectable=false;
		text_subtitle.height=40;
		text_subtitle.setTextFormat(text_format_subtitle);
		
		var text_format_message:TextFormat = new TextFormat(font);
		text_format_message.size = 100*0.8;
		text_format_message.color = 0x000000;
		
		text_message=new TextField();
		text_message.selectable=false;
		text_message.height = 100;
		text_message.setTextFormat(text_format_message);
		
		var text_format_success:TextFormat = new TextFormat(font);
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
	
	private function loadPlayers() {		
		jugadores = new Array<Player>();
		
		// Agregar jugador 1
		for ( id in 0 ... GameScene.MAX_PLAYERS )
			jugadores.push(new Player(id+1));
	}
	
	public function ubicarPlayers(distancia:Float = -1) { // No soporta más de 2 players
		if ( distancia == -1 ) distancia = Player.POS_INICIAL;
		
		for ( player in jugadores ){
			player.y = Screen.SCREEN_HEIGHT - player.height;
			if ( player.id == 1 ) 
				player.x = (distancia/100) * Screen.SCREEN_WIDTH;
			else
				player.x = Screen.SCREEN_WIDTH * (1-distancia/100) - player.width;
		}
	}
		
	public function loadPowerUps() {
		powerups = new Array<PowerUp>();
		PowerUp.init(this);
	}
	
	// Pelotas
	public function agregarPelota(b:Ball) {
		// Agregar a pelotas comunes
		pelotas.push(b);
		addChild(b);
		hijos.push(b);
		
		// Sumar cantidad
		GameScene.level.ballCounter(true);
	}	
	public function desactivarPelota(b:Ball) {
		pelotas.remove(b);
	}	
	public function eliminarPelota(b:Ball) {
		removeChild(b);
		hijos.remove(b);
		GameScene.level.ballCounter(false); // Restar cantidad
	}
	
	// Manejo de niveles
	public function resetLevel() {
		// Eliminar pelotas que quedan (no borra de pelotas)
		for (p in pelotas)
			eliminarPelota(p);
		
		// Reestablecer jugador y eliminar sogas
		for (p in jugadores)
			p.resetLevel();
			
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
		text_message.alpha = 0;
		textAdjustPos(text_message);
		
		addChild(text_message);		
		Actuate.tween(text_message, 1, { alpha: 1 } ).delay(1).onComplete(function() {
			showSubtitle(subtitle, function() {
				Actuate.tween(text_subtitle, 1, { alpha: 0 } ).delay(3).onComplete(function() {
					removeChild(text_subtitle);
				});
				Actuate.tween(text_message, 1, { alpha: 0 } ).delay(3).onComplete(function() {
					removeChild(text_message);
					startLevel();
				});
			});
		});
	}
		
	public function showSubtitle(msj:String , callback:Dynamic) {
		
		text_subtitle.text = msj;
		text_subtitle.alpha = 0;
		textAdjustPos(text_subtitle);
		text_subtitle.y += 60;
		
		addChild(text_subtitle);
		
		Actuate.tween(text_subtitle, 1, { alpha: 1 } ).onComplete(callback);
	}
	
	public function showScore(callback:Dynamic) {
		text_success.alpha = 0;
		
		addChild(text_success);
		Actuate.tween(text_success, 1, { alpha: 1 } ).delay(0).onComplete(function() {
			Actuate.tween(text_success, 1, { alpha: 0 } ).delay(1).onComplete( callback );
		});
	}
	
	public function startLevel() {
		enJuego = true;
	}
	
	override public function updateLogic(time:Float){
		if (enJuego && ! GameScene.enPausa) {
			super.updateLogic(time);
			
			// Colisiones Pelota(normal, fuego) y boss - soga
			for (j in jugadores) {
				if ( j.alive ){
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
									PangRevenge.audioManager.justPlay(Sonido.EXPLO1);
									b.reventar();
									
									// Sumar puntos
									GameScene.hud.addScore(j.id, 50);
								}
							}
							
							if (boss != null && !colisiona && soga.collisionBoss(boss)) {
								colisiona = true;
								soga.colision();
								boss.getDamage();
								GameScene.hud.addScore(j.id, 50);
							}
						}
					}
					// COLISION DE POWERUPS !!!
					for (pu in powerups)
						if ( j.collisionTest(pu) )
							pu.action(j);
					
					// Colision jugador - boss
					if (boss != null && boss.colisionJugador(j))
						j.colision(null);
				}
			}
			
			// Colisiones Jugador - Pelota
			for (b in pelotas)
				for (j in jugadores)
					if ( j.alive )
						if (b.colisionJugador(j))
							j.colision(b);
			
		}
	}
	
	public function gameOver() {		
		PangRevenge.sm.switchScene('gameover');
	}
}