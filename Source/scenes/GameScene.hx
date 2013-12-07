package scenes;

import engine.Scene;
import engine.SceneManager;
import engine.GameElement;
import engine.Button;
import engine.InputManager;
import flash.display.Sprite;
import flash.Lib;
import flash.display.Bitmap;
import flash.text.TextFormat;
import game.bosses.Boss;
import game.bosses.FireBoss;
import game.Hud;
import game.Screen;
import openfl.Assets;
import flash.media.Sound;
import flash.events.Event;
import game.ball.*;
import engine.AudioManager;
import engine.Sonido;
import engine.Save;

class GameScene extends Scene {

	// Boss
	private var bossLevel:Int=5;
	private var bossDead:Bool;
	var boss:Boss;	
	
	// Bordes
	var bordeIzq:Sprite;
	var bordeDer:Sprite;
	var bordeArriba:Sprite;
	var bordeAbajo:Sprite;
	
	private var inmunidad:Int;
	private var totalTime:Float;
	
	private var screen:Screen;
	public var hud:Hud;
	public var enPausa:Bool;
	private var btnPause:Bool;
	
	private var backButton:Button;
	
	public static var PLAYER_CANT:Int = 1;	
	public static var FIN_ETAPA:Int = 5;
	public static var CURRENT_SCENE:Int;
	public static var CURRENT_LEVEL:Int;
	public static var MAX_SCENE:Int;
	
	public function new (sm:SceneManager) {
		super(sm);
		
		// Crear HUD
		hud = new Hud(720,100);
		hud.x = 40;
		hud.y = 30 + Screen.SCREEN_HEIGHT;
		
		// Agrego la pantalla de juego
		screen = new Screen(this);
		screen.x = 20;
		screen.y = 20;
		hud.setScreen(screen);
		
		// Boton de Regreso
		backButton = new Button(this.goBack);
		backButton.x=500;
		backButton.y = 20;
		
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
				
		// Inicializar valores
		totalTime = 0;
		bossDead = false;
		
		// Agregar a pantalla
		addChild(screen);
		hijos.push(screen);
		addChild(backButton);
		addChild(bordeIzq);
		addChild(bordeDer);
		addChild(bordeArriba);
		addChild(bordeAbajo);
		addChild(hud);
		
		// Cargar cosas de Screen
		screen.init();
		hud.init();
		hud.resetScore();
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
	
	public function cargarPelotas(nivel:Int) {	}
	
	public function loadLevel() {
		screen.enJuego = false;
		screen.restablecerPosiciones();
		if (GameScene.CURRENT_LEVEL == FIN_ETAPA) {
			GameScene.MAX_SCENE = Std.int(Math.max(GameScene.MAX_SCENE, GameScene.CURRENT_SCENE));
			Save.getInstance().setLevel(GameScene.MAX_SCENE);
			// Cambiar de escena
			if (GameScene.CURRENT_SCENE == 4) {
				sm.switchScene('winner');
			}else{
				sm.switchScene('levelselect');
			}
		}else{
			// Cargar pelotas
			cargarPelotas(GameScene.CURRENT_LEVEL);
			screen.showLevelName("Nivel " + GameScene.CURRENT_LEVEL );
			screen.game.hud.setEscena(GameScene.CURRENT_SCENE, GameScene.CURRENT_LEVEL);
		}
	}
	
	public function finalizarNivel() {
		trace("Finalizar nivel");
		screen.enJuego = false;		
		screen.resetLevel();
		
		GameScene.CURRENT_LEVEL++;
		trace("Mostrar puntajes y cargar siguiente nivel");	
		screen.showScore();
	}
	
	// Nuestro gameLoop (se ejecuta antes de cada cuadro).
	override public function updateLogic(time:Float) {
		
		if (screen.enJuego && !enPausa ) {
			totalTime += time;
			super.updateLogic(time);
			
			// Detectar fin de nivel (No anima la ultima pelota)
			if ((screen.pelotasCantidad == 0 && GameScene.CURRENT_LEVEL != bossLevel) || bossDead || InputManager.getInstance().keyCodePressed(InputManager.config.get("DEBUG_END_LEVEL"))) {
				finalizarNivel();
			}
		}
		
       	if (InputManager.getInstance().keyCodePressed(InputManager.config.get("PAUSE")) ) {
			if (!btnPause) {
				btnPause = true;
				enPausa = !enPausa;				
			}
		}else {
			btnPause = false;	
		}
       	
       	if(InputManager.getInstance().keyPressed(String.fromCharCode(27))){
       		goBack();
       	}
	}
	
	private function goBack() {
		AudioManager.getInstance().justPlay(Sonido.VOLVER);
		sm.switchScene('menu');
	}
	
	public function killBoss () { 
		bossDead = true; 
		screen.removeChild(boss);
	}
	
	/*override public function end(onComplete:Dynamic){
		Score.getInstance().endSession();
		super.end(onComplete);
		engine.Stats.track('game','finish','',200);
	}*/
}
