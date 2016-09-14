package scenes;

import engine.GameState;
import engine.graphics.DynamicButton;
import engine.SceneManager;
import engine.AudioManager;
import engine.Sonido;
import engine.Scene;
import engine.graphics.Button;
import flash.events.Event;
import openfl.Assets;
import motion.Actuate;
import game.Screen;

class LevelSelect extends Scene
{

	// Botones de Escena
	private var levelSpring:DynamicButton;
	private var levelSummer:DynamicButton;
	private var levelAutumn:DynamicButton;
	private var levelWinter:DynamicButton;
	
	private var currentScene:Int;
	private var xPos:Float;
	
	public function new(sm:SceneManager){
		super(sm);
		
		// Cargar botones
		levelSpring = new DynamicButton(Assets.getBitmapData("images/LevelSpring.jpg"), playSpring);
		levelSummer = new DynamicButton(Assets.getBitmapData("images/LevelSummer.jpg"), playSummer);
		levelAutumn = new DynamicButton(Assets.getBitmapData("images/LevelAutumn.jpg"), playAutumn);
		levelWinter = new DynamicButton(Assets.getBitmapData("images/LevelWinter.jpg"), playWinter);
		
		// Agregar a pantalla
		addChild(levelSpring);
		addChild(levelSummer);
		addChild(levelAutumn);
		addChild(levelWinter);
		
		xPos = (Screen.SCREEN_WIDTH - 210 ) / 2;
		
		// Agregar boton de Regresar
		var backButton = new Button("images/back.png", goBack, 2);
		backButton.x=10;
		backButton.y=10;
		addChild(backButton);
	}
	
	override public function init() {
		super.init();
		
		trace("Mostrar escena");
		
		// Mostrar Escena
		this.alpha = 0;
		Actuate.tween(this, 1, { alpha:1 } );
		
		allPause(false);
		
		// Desactivar todos los botones excepto el primero
		levelSpring.alpha = levelSummer.alpha = levelAutumn.alpha = levelWinter.alpha = 1;
		levelSpring.visible = levelSummer.visible = levelAutumn.visible = levelWinter.visible = true;
		
		levelSpring.enable();
		levelSummer.disable();
		levelAutumn.disable();
		levelWinter.disable();
		
		// Obtener nivel actual
		var maxEstacion = GameState.fbGetSeason();
		
		// Activar botones correspondientes
		if (maxEstacion > 1)
			levelSummer.enable();
		
		if (maxEstacion > 2)
			levelAutumn.enable();
		
		if (maxEstacion > 3)
			levelWinter.enable();
			
		// Posicionar
		levelSpring.y = levelSummer.y = levelAutumn.y = levelWinter.y = 60;
		
		levelSpring.x = 38;
		levelSummer.x = levelSpring.x + levelSpring.w;
		levelAutumn.x = levelSummer.x + levelSummer.w;
		levelWinter.x = levelAutumn.x + levelAutumn.w;
	}
	
	override public function end(onComplete:Dynamic) {
		Actuate.tween(this, 1, { alpha:0 } );
		onComplete();
	}
	
	public function playSpring(e:Event) {
		//GameScene.level.setSeason(1);
		//allPause(true);
		Actuate.tween(levelSummer, 1, { alpha:0 } );
		Actuate.tween(levelAutumn, 1, { alpha:0 } ).delay(0.1);
		Actuate.tween(levelWinter, 1, { alpha:0 } ).delay(0.2);
		Actuate.tween(levelSpring, 2, { x:xPos } ).delay(0.5).onComplete(playScene);
	}
	
	public function playSummer(e:Event) {
		if ( ! levelSummer.isEnabled ) return;
		
		GameScene.level.setSeason(2);
		allPause(true);
		
		Actuate.tween(levelSpring, 1, { alpha:0 } );
		Actuate.tween(levelAutumn, 1, { alpha:0 } ).delay(0.1);
		Actuate.tween(levelWinter, 1, { alpha:0 } ).delay(0.2);
		Actuate.tween(levelSummer, 2, { x:xPos } ).delay(0.5).onComplete(playScene);
	}
	
	public function playAutumn(e:Event) {
		if ( ! levelAutumn.isEnabled ) return;
		
		GameScene.level.setSeason(3);
		allPause(true);
		
		Actuate.tween(levelSpring, 1, { alpha:0 } );
		Actuate.tween(levelSummer, 1, { alpha:0 } ).delay(0.1);
		Actuate.tween(levelWinter, 1, { alpha:0 } ).delay(0.2);
		Actuate.tween(levelAutumn, 2, { x:xPos } ).delay(0.5).onComplete(playScene);
	}
	
	public function playWinter(e:Event) {
		if ( ! levelWinter.isEnabled ) return;
		
		GameScene.level.setSeason(4);
		allPause(true);
		
		Actuate.tween(levelSpring, 1, { alpha:0 } );
		Actuate.tween(levelSummer, 1, { alpha:0 } ).delay(0.1);
		Actuate.tween(levelAutumn, 1, { alpha:0 } ).delay(0.2);
		Actuate.tween(levelWinter, 2, { x:xPos} ).delay(0.5).onComplete(playScene);
	}
	
	public function playScene() {
		sm.switchScene('game');
	}
	
	private function allPause(v:Bool) {
		levelSpring.pause(v);
		levelSummer.pause(v);
		levelAutumn.pause(v);
		levelWinter.pause(v);
	}
	
	private function goBack(){
		PangRevenge.audioManager.justPlay(Sonido.VOLVER);
		sm.switchScene('menu');
	}

}