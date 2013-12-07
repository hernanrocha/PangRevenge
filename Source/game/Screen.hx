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
	public var text:TextField;

	public function new(p_game:GameScene) 
	{
		super();
		
		game = p_game;
		
		loadPlayers();
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
	
	public function restablecerPosiciones() {
		p1.y = Screen.SCREEN_HEIGHT - p1.height;
		p1.x = Player.P1_X_INICIAL;
		p2.y = Screen.SCREEN_HEIGHT - p2.height;
		p2.x = Player.P2_X_INICIAL - p2.width;
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
	
	public function showLevelName(str:String) {
		// Setear fuente
		var tf = new TextFormat(openfl.Assets.getFont('fonts/JOINTBYPIZZADUDE.ttf').fontName);
		tf.size = 100*0.8;
		tf.color = 0x000000;
		//tf.bold = true;
		
		// Setear texto
		text=new TextField();
		text.selectable=false;
		text.height=100;
		text.text= str;
		text.setTextFormat(tf);
		text.x = (SCREEN_WIDTH - text.width) / 2;
		text.y = (SCREEN_HEIGHT - text.height) / 2;
		text.alpha = 0;
		
		addChild(text);
		
		trace("GG " + GameScene.CURRENT_SCENE + " " + GameScene.CURRENT_LEVEL);
		
		
		Actuate.tween(text, 1, { alpha: 1 } ).delay(1).onComplete(hideLevelName);
	}
	
	public function hideLevelName() {
		//if (.....)
		
		showAdvice();
		
		Actuate.tween(text, 1, { alpha: 0 } ).delay(3).onComplete(startLevel);
	}
		
	public function showAdvice() {
		// Setear fuente
		var tf1 = new TextFormat(openfl.Assets.getFont('fonts/JOINTBYPIZZADUDE.ttf').fontName);
		tf1.size = 40*0.8;
		tf1.color = 0x000000;
		tf1.bold = true;
		
		// Setear texto
		var text2=new TextField();
		text2.selectable=false;
		text2.height=40;
		text2.setTextFormat(tf1);
		text2.alpha = 0;
		
		//ESCENA 1
		if (GameScene.CURRENT_SCENE == 1 && GameScene.CURRENT_LEVEL == 1) {
			text2.text = "Ojo con las bolas";
			text2.x = (SCREEN_WIDTH - text2.width) / 2;
			text2.y = ((SCREEN_HEIGHT - text2.height) / 2 ) + 80;
		}
		
		if (GameScene.CURRENT_SCENE == 1 && GameScene.CURRENT_LEVEL == 2) {
			text2.text = "Trata de agarrar los Power Ups!";
			text2.x = (SCREEN_WIDTH - text2.width) / 2;
			text2.y = ((SCREEN_HEIGHT - text2.height) / 2 ) + 80;
		}
		
		if (GameScene.CURRENT_SCENE == 1 && GameScene.CURRENT_LEVEL == 3) {
			text2.text = "Mas Grandes?";
			text2.x = (SCREEN_WIDTH - text2.width) / 2;
			text2.y = ((SCREEN_HEIGHT - text2.height) / 2 ) + 80;
		}
		
		if (GameScene.CURRENT_SCENE == 1 && GameScene.CURRENT_LEVEL == 4) {
			text2.text = "Pensabas que era facil?";
			text2.x = (SCREEN_WIDTH - text2.width) / 2;
			text2.y = ((SCREEN_HEIGHT - text2.height) / 2 ) + 80;
		}
		
		//ESCENA 2
		if (GameScene.CURRENT_SCENE == 2 && GameScene.CURRENT_LEVEL == 1) {
			text2.text = "Cuidado con estas peculiares bolas!";
			text2.x = (SCREEN_WIDTH - text2.width) / 2;
			text2.y = ((SCREEN_HEIGHT - text2.height) / 2 ) + 60;
		}
		
		if (GameScene.CURRENT_SCENE == 2 && GameScene.CURRENT_LEVEL == 2) {
			text2.text = "De donde saldran?";
			text2.x = (SCREEN_WIDTH - text2.width) / 2;
			text2.y = ((SCREEN_HEIGHT - text2.height) / 2 ) + 60;
		}
		
		if (GameScene.CURRENT_SCENE == 2 && GameScene.CURRENT_LEVEL == 3) {
			text2.text = "Nada es lo que parece";
			text2.x = (SCREEN_WIDTH - text2.width) / 2;
			text2.y = ((SCREEN_HEIGHT - text2.height) / 2 ) + 60;
		}
		
		if (GameScene.CURRENT_SCENE == 2 && GameScene.CURRENT_LEVEL == 4) {
			text2.text = "CORRE!!!";
			text2.x = (SCREEN_WIDTH - text2.width) / 2;
			text2.y = ((SCREEN_HEIGHT - text2.height) / 2 ) + 60;
		}
		
		if (GameScene.CURRENT_SCENE == 2 && GameScene.CURRENT_LEVEL == 5) {
			text2.text = "DESTRUILA CUANTO ANTES!!";
			text2.x = (SCREEN_WIDTH - text2.width) / 2;
			text2.y = ((SCREEN_HEIGHT - text2.height) / 2 ) + 60;
		}
		
		//ESCENA 3
		if (GameScene.CURRENT_SCENE == 3 && GameScene.CURRENT_LEVEL == 1) {
			text2.text = "Preparado?";
			text2.x = (SCREEN_WIDTH - text2.width) / 2;
			text2.y = ((SCREEN_HEIGHT - text2.height) / 2 ) + 60;
		}
		
		if (GameScene.CURRENT_SCENE == 3 && GameScene.CURRENT_LEVEL == 2) {
			text2.text = "Saltar es una posible solucion";
			text2.x = (SCREEN_WIDTH - text2.width) / 2;
			text2.y = ((SCREEN_HEIGHT - text2.height) / 2 ) + 60;
		}
		
		if (GameScene.CURRENT_SCENE == 3 && GameScene.CURRENT_LEVEL == 3) {
			text2.text = "Este parece facil o no ?";
			text2.x = (SCREEN_WIDTH - text2.width) / 2;
			text2.y = ((SCREEN_HEIGHT - text2.height) / 2 ) + 60;
		}
		
		if (GameScene.CURRENT_SCENE == 3 && GameScene.CURRENT_LEVEL == 4) {
			text2.text = "SON MUCHAS!!!";
			text2.x = (SCREEN_WIDTH - text2.width) / 2;
			text2.y = ((SCREEN_HEIGHT - text2.height) / 2 ) + 60;
		}
		
		//ESCENA 4
		if (GameScene.CURRENT_SCENE == 4 && GameScene.CURRENT_LEVEL == 1) {
			text2.text = "Frio Invierno";
			text2.x = (SCREEN_WIDTH - text2.width) / 2;
			text2.y = ((SCREEN_HEIGHT - text2.height) / 2 ) + 60;
		}
		
		if (GameScene.CURRENT_SCENE == 4 && GameScene.CURRENT_LEVEL == 2) {
			text2.text = "Salta y hacelo todo rapido";
			text2.x = (SCREEN_WIDTH - text2.width) / 2;
			text2.y = ((SCREEN_HEIGHT - text2.height) / 2 ) + 60;
		}
		
		if (GameScene.CURRENT_SCENE == 4 && GameScene.CURRENT_LEVEL == 3) {
			text2.text = "Esto no te lo esperas";
			text2.x = (SCREEN_WIDTH - text2.width) / 2;
			text2.y = ((SCREEN_HEIGHT - text2.height) / 2 ) + 60;
		}
		
		if (GameScene.CURRENT_SCENE == 4 && GameScene.CURRENT_LEVEL == 4) {
			text2.text = "TODO RAPIDO";
			text2.x = (SCREEN_WIDTH - text2.width) / 2;
			text2.y = ((SCREEN_HEIGHT - text2.height) / 2 ) + 60;
		}
		
		if (GameScene.CURRENT_SCENE == 4 && GameScene.CURRENT_LEVEL == 5) {
			text2.text = "PERSEVERA Y TRIUNFARAS";
			text2.x = (SCREEN_WIDTH - text2.width) / 2;
			text2.y = ((SCREEN_HEIGHT - text2.height) / 2 ) + 60;
		}
		addChild(text2);
		
		Actuate.tween(text2, 2, { alpha: 1 } ).onComplete(function() { text2.alpha = 0; } );
	}
		
	public function startLevel() {
		enJuego = true;
	}
	
	public function showScore() {
		// Setear fuente
		var tf = new TextFormat(openfl.Assets.getFont('fonts/JOINTBYPIZZADUDE.ttf').fontName);
		tf.size = 100*0.8;
		tf.color = 0x000000;
		//tf.bold = true;
		
		// Setear texto
		text=new TextField();
		text.selectable=false;
		text.height=100;
		text.text= "Nivel superado";
		text.setTextFormat(tf);
		text.x = (SCREEN_WIDTH - text.width) / 2;
		text.y = (SCREEN_HEIGHT - text.height) / 2;
		text.alpha = 0;
		
		addChild(text);
		Actuate.tween(text, 1, { alpha: 1 } ).delay(0).onComplete(hideScore);
	}
	
	public function hideScore() {
		Actuate.tween(text, 1, { alpha: 0 } ).delay(1).onComplete(game.loadLevel);
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