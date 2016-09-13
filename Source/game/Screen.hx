package game;

import engine.GameElement;
import engine.graphics.Button;
import engine.InputManager;
import engine.AudioManager;
import engine.Sonido;
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;
import openfl.Assets;
import game.bosses.Boss;
import game.ball.*;
import motion.Actuate;
import scenes.GameScene;

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
	
	public var btnLevel:Button;
	
	private var text_subtitle:TextField;
	private var text_message:TextField;
	private var message_board:Bitmap;
	private var message_board_success:Bitmap;
	
	// Boss life
	private var boss_life_back:Bitmap = null;
	private var boss_life_front:Bitmap = null;
	private var boss_name:TextField;

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
		addChild(fondo); // Fondo
		
		for ( it in 0 ... GameScene.PLAYER_CANT ) // Jugador
			jugadores[it].init();
		
		GameScene.powerupManager.init(); // PowerUp
	}
	
	public function end() {
		removeChild(fondo);// Fondo
		
		resetLevel();
		
		for ( it in 0 ... GameScene.PLAYER_CANT )// Jugador
			jugadores[it].end();
			
		if ( GameScene.level.lvl_boss ) GameScene.level.boss.end();
	}
	
	private function initFonts() {
		var font = openfl.Assets.getFont('fonts/JOINTBYPIZZADUDE.ttf').fontName;
		
		/*var text_format_subtitle:TextFormat = new TextFormat(font);
		text_format_subtitle.size = 30*0.8;
		text_format_subtitle.color = 0x532b00;
		text_format_subtitle.bold = true;
		text_format_subtitle.align = flash.text.TextFormatAlign.CENTER;*/
		
		message_board = new Bitmap ( Assets.getBitmapData( "images/message_board.png" ));
		message_board.y = 113;
		message_board.x = 217;
		
		text_subtitle=new TextField();
		text_subtitle.selectable = false;
		text_subtitle.width = 290;
		text_subtitle.height = 45;
		//text_subtitle.setTextFormat(text_format_subtitle);
		text_subtitle.x = message_board.x + 25;
		text_subtitle.y = message_board.y + 175;		
		
		/*var text_format_message:TextFormat = new TextFormat(font);
		text_format_message.size = 75*0.8;
		text_format_message.color = 0xc99964;
		text_format_message.align = flash.text.TextFormatAlign.CENTER;*/
		
		text_message=new TextField();
		text_message.selectable = false;
		text_message.width = 235;
		text_message.height = 75;
		//text_message.setTextFormat(text_format_message);
		text_message.x = message_board.x + 50;
		text_message.y = message_board.y + 37;
		
		message_board_success = new Bitmap ( Assets.getBitmapData( "images/message_board_success.png" ));
		message_board_success.x = (SCREEN_WIDTH - message_board_success.width) / 2;
		message_board_success.y = (SCREEN_HEIGHT - message_board_success.height) / 2;		
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
			player.y = Screen.SCREEN_HEIGHT - player.h;
			if ( player.id == 1 ) 
				player.x = (distancia/100) * Screen.SCREEN_WIDTH;
			else
				player.x = Screen.SCREEN_WIDTH * (1 - distancia / 100) - player.w;
		}
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
	public function ballsExplode() {
		// Por bug extraño, este for no recorre todas las pelotas!! No sé qué onda!!!
		for ( p in pelotas ) {
			p.reventar(false);
			desactivarPelota(p);			
		}
	}
	
	// Manejo de niveles
	public function resetLevel() {
		for (p in pelotas){ // Eliminar pelotas que quedan (no borra de pelotas)
			eliminarPelota(p);
			desactivarPelota(p);
		}
		
		for (p in jugadores)// Reestablecer jugador y eliminar sogas
			p.resetLevel();
			
		GameScene.powerupManager.reset();// Eliminar powerups
	}
	
	// Mensajes
	public function showLevelName(str:Int , subtitle:String) {
		// Setear texto
		if ( str != 0 )
			text_message.text = "Nivel " + str;		
		else
			text_message.text = "Boss!";
		text_message.alpha = 0;
		message_board.alpha = 0;
		
		addChild(message_board);
		addChild(text_message);
		
		Actuate.tween(message_board, 1, { alpha: 1 } ).delay(1);
		Actuate.tween(text_message, 1, { alpha: 1 } ).delay(1).onComplete(function() {
			showSubtitle(subtitle, function() {
				Actuate.tween(text_subtitle, 1, { alpha: 0 } ).delay(3).onComplete(function(){removeChild(text_subtitle);});
				Actuate.tween(message_board, 1, { alpha: 0 } ).delay(3).onComplete(function(){removeChild(message_board);});
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
		
		addChild(text_subtitle);
		
		Actuate.tween(text_subtitle, 1, { alpha: 1 } ).onComplete(callback);
	}
	
	public function showScore(callback:Dynamic) {
		message_board_success.alpha = 0;
		message_board_success.visible = true;
		
		addChild(message_board_success);
		Actuate.tween(message_board_success, 1, { alpha: 1 } ).delay(0).onComplete(function() {
			Actuate.tween(message_board_success, 1, { alpha: 0 } ).delay(1).onComplete( function() {
				removeChild(message_board_success);
				callback();
			} );
		});
	}
	
	// Game Options
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
							
							if (GameScene.level.lvl_boss && !colisiona && soga.collisionBoss(GameScene.level.boss)) {
								colisiona = true;
								soga.colision();
								GameScene.level.boss.getDamage();
								GameScene.hud.addScore(j.id, 50);
							}
						}
					}
					// Colision de PowerUps
					for (pu in GameScene.powerupManager.powerups)
						if ( j.collisionTest(pu) )
							pu.action(j);
					
					// Colision jugador - boss
					if (GameScene.level.lvl_boss && GameScene.level.boss.colisionJugador(j))
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
	
	// Bos HUD
	// Boss
	public function setHudBoss(boss:Boss) {
		// Create life bar.
		if ( boss_life_back == null ) {
			boss_life_back = new Bitmap ( Assets.getBitmapData("images/hud_boss_life_back.png") );
			boss_life_front = new Bitmap ( Assets.getBitmapData("images/hud_boss_life_front.png") );
			boss_life_back.y = boss_life_front.y = 25;
			boss_life_back.x = boss_life_front.x = ( ( Screen.SCREEN_WIDTH - boss_life_back.width ) / 2);
					
			//Formato Jefe
			var tfB=new TextFormat(openfl.Assets.getFont('fonts/ARCADE.TTF').fontName);
			tfB.size=40;
			tfB.color=0xd300b6;
			tfB.bold=true;
			tfB.align = flash.text.TextFormatAlign.CENTER;
			
			//Jug1
			boss_name = new TextField();
			boss_name.width=550;
			boss_name.selectable=false;
			boss_name.height = 10;
			boss_name.x = ( ( Screen.SCREEN_WIDTH - boss_name.width ) / 2);
			boss_name.y = -10;
			boss_name.setTextFormat(tfB);
		
		}
		boss_name.text = boss.nombre;
		boss_name.x = ( ( Screen.SCREEN_WIDTH - boss_name.width ) / 2);
		boss_life_front.width = boss_life_back.width;
		
		addChild(boss_name);
		addChild(boss_life_back);
		addChild(boss_life_front);
	}
	public function updateHudBoss() {
		var porc:Float = GameScene.level.boss.health / GameScene.level.boss.max_health;
		boss_life_front.width = boss_life_back.width * porc;
	}
	public function destroyHudBoss() {
		removeChild(boss_name);
		removeChild(boss_life_back);
		removeChild(boss_life_front);		
	}
}