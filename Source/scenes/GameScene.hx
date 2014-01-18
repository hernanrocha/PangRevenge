package scenes;

import engine.GameState;
import engine.Level;
import engine.LevelLoader;
import engine.Scene;
import engine.SceneManager;
import engine.GameElement;
import engine.InputManager;
import engine.AudioManager;
import engine.Sonido;
import engine.Save;
import engine.graphics.Button;
import game.bosses.Boss;
import game.bosses.FireBoss;
import game.Hud;
import game.PowerupManager;
import game.Screen;
import game.ball.*;
import flash.display.Sprite;
import flash.Lib;
import flash.display.Bitmap;
import flash.text.TextFormat;
import flash.media.Sound;
import flash.events.Event;
import openfl.Assets;

// única instancia

class GameScene extends Scene {
	
	public static var lvlLoader(default, null):LevelLoader;
	public static var screen(default, null):Screen;
	public static var hud(default, null):Hud;
	public static var level(default, null):Level;
	public static var powerupManager(default, null):PowerupManager;
	public static var inst(default, null):GameScene;
	
	// Boss
	private var bossLevel:Int=5;
	private var bossDead:Bool;
	var boss:Boss;	
	
	// Bordes
	var bordeIzq:Sprite;
	var bordeDer:Sprite;
	var bordeArriba:Sprite;
	var bordeAbajo:Sprite;
	
	private var endTime:Float;
	private var totalTime:Float;
	
	public static var enPausa:Bool;
	private var btnPause:Bool;
	
	private var backButton:Button;
	
	public static var PLAYER_CANT(default, null):Int;
	
	public static var Session_year:Int = 0;
	public static var SEASON_UNBLOCKED:Int = 1;
	
	// Constantes:
	public static inline var MAX_PLAYERS:Int = 2;
	public static inline var END_TIME:Float = 2;
	
	public function new (sm:SceneManager) {
		super(sm);
				
		inst = this;
		lvlLoader = new LevelLoader("lvls.json");
		hud = new Hud(720, 100, 40, 30+Screen.SCREEN_HEIGHT );
		screen = new Screen(20, 20);
		level = new Level();
		powerupManager = new PowerupManager();
		
		// Boton de Regreso
		backButton = new Button( "images/back.png" , this.goBack, 2);
		backButton.x = 10;
		backButton.y = 10;
		
		// Bordes (internos)
		bordeIzq = new Sprite();
		bordeIzq.graphics.beginFill(0x000000);
		bordeIzq.graphics.drawRect(0, 0, 20, 800);
		bordeIzq.graphics.endFill();
		
		bordeDer = new Sprite();
		bordeDer.graphics.beginFill(0x000000);
		bordeDer.graphics.drawRect(0, 0, 20, 800);
		bordeDer.x = Screen.SCREEN_WIDTH + 20;
		bordeDer.graphics.endFill();
		
		bordeArriba = new Sprite();
		bordeArriba.graphics.beginFill(0x000000);
		bordeArriba.graphics.drawRect(0, 0, 800, 20);
		bordeArriba.graphics.endFill();
		
		bordeAbajo = new Sprite();
		bordeAbajo.graphics.beginFill(0x000000);
		bordeAbajo.graphics.drawRect(0, 0, 800, 400);
		bordeAbajo.y = Screen.SCREEN_HEIGHT + 20;
		bordeAbajo.graphics.endFill();
		
	}
	
	override function init() {
		super.init();
		
		lvlLoader.setLevel(0); // Comenzar por el primer nivel de la estacion
		lvlLoader.loadSound(); // Cargar sonido de la estacion
		lvlLoader.setBackground(); // Cargar fondo de la estacion
		
		// Inicializar valores
		totalTime = 0;
		
		// Agregar a pantalla
		addChild(screen);
		hijos.push(screen);
		addChild(bordeIzq);
		addChild(bordeDer);
		addChild(bordeArriba);
		addChild(bordeAbajo);
		addChild(backButton); // Visible fuera de los bordes
		addChild(hud); // Visible sobre los bordes
		
		// Cargar cosas de Screen
		screen.init();
		hud.init();
		hud.resetScore();
		
		endTime = END_TIME;
		iniciarNivel();
	}
	
	override public function end(onComplete:Dynamic) {
		screen.end();
		
		// Quitar elementos
		removeChild(screen);
		hijos.remove(screen);
		removeChild(backButton);
		removeChild(bordeIzq);
		removeChild(bordeDer);
		removeChild(bordeArriba);
		removeChild(bordeAbajo);
		removeChild(hud);
		
		onComplete();
	}
	
	public function iniciarNivel() {
		
		screen.enJuego = false;
		
		// Verificar que haya siguiente nivel
		if ( ! level.nextLevel() ) { // No hay mas niveles
			if ( ! level.nextSeason() ) { // No hay mas temporadas
				// Soporte para multiples años if ( ! level.nextYear() ) // No hay mas años
				PangRevenge.sm.switchScene('wingame'); // El jugador gano
				return;
			} else {
				GameState.fbSetSeason(Std.int(Math.max(GameState.fbGetSeason(), level.season)));
				PangRevenge.sm.switchScene('levelselect'); // Volver a seleccion de escena
				return;
			}
		}
		
		// Cargar Nivel
		level.load();
	}
	
	public function finalizarNivel() {
		screen.enJuego = false;		
		screen.resetLevel();
		
		screen.showScore(iniciarNivel);
	}
	
	public static function setTwoPlayers(b:Bool) {
		if ( b )
			PLAYER_CANT = 2;
		else
			PLAYER_CANT = 1;
	}
	
	private function pasaNivel():Bool {
		var ret = ( level.ballCount == 0 && !level.lvl_boss ) || 
			(level.lvl_boss && level.boss_dead ) || 
			InputManager.keyActionPressed("DEBUG_END_LEVEL");
		
		return ret;
	}
	
	// Nuestro gameLoop (se ejecuta antes de cada cuadro).
	override public function updateLogic(time:Float) {
		
		// Boton de escape
		if(InputManager.keyPressed(String.fromCharCode(27))){
       		goBack();
			return;
       	}
		
		// Boton de pausa
		if (InputManager.keyActionPressed("PAUSE")){
			if (!btnPause) { // Anti-rebote
				btnPause = true;
				enPausa = !enPausa;
			}
		}else{
			btnPause = false;
		}
		
		// Procesar juego
		if ( screen.enJuego && !enPausa ) {
			totalTime += time;
			super.updateLogic(time);
			
			// Detectar fin de nivel (No anima la ultima pelota)
			if (pasaNivel()) {
				if ( endTime < 0 )
					finalizarNivel();
				else
					endTime -= time;
			}
		}       	
	}
	
	private function goBack() {
		PangRevenge.audioManager.justPlay(Sonido.VOLVER);
		sm.switchScene('menu');
	}
	
	/*override public function end(onComplete:Dynamic){
		Score.getInstance().endSession();
		super.end(onComplete);
		engine.Stats.track('game','finish','',200);
	}*/
	
	//public static function setSeason(season:Int) {
	//	Session_season = season;
	//}
}
