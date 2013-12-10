package scenes;
import engine.SceneManager;
import flash.events.Event;
import game.Screen;
import openfl.Assets;
import engine.LevelButton;
import engine.Scene;
import motion.Actuate;
import engine.Button;
import engine.AudioManager;
import engine.Sonido;


class LevelSelect extends Scene
{

	// Botones de Escena
	var levelSpring:LevelButton;
	var levelSummer:LevelButton;
	var levelAutumn:LevelButton;
	var levelWinter:LevelButton;
	
	
	var currentScene:Int;
	var xPos:Float;
	
	public function new(sm:SceneManager) 
	{
		super(sm);
		
		// Cargar botones
		levelSpring = new LevelButton(Assets.getBitmapData("images/springMenu.png"), playSpring, true);
		levelSummer = new LevelButton(Assets.getBitmapData("images/summerMenu.png"), playSummer);
		levelAutumn = new LevelButton(Assets.getBitmapData("images/autumnMenu.png"), playAutumn);
		levelWinter = new LevelButton(Assets.getBitmapData("images/winterMenu.png"), playWinter);
		
		levelSpring.width = levelSummer.width = levelAutumn.width = levelWinter.width = 200;
		levelSpring.height = levelSummer.height = levelAutumn.height = levelWinter.height = 350;
		
		// Agregar a pantalla
		this.addChild(levelSpring);
		this.addChild(levelSummer);
		this.addChild(levelAutumn);
		this.addChild(levelWinter);
		
		xPos = (Screen.SCREEN_WIDTH - 210 ) / 2;
		
		// Agregar boton de Regresar
		var backButton:Button=new Button(goBack);
		backButton.x=500;
		backButton.y=20;
		this.addChild(backButton);
	}
	
	
	public function playSpring(e:Event) {
		GameScene.level.setSeason(1);
		Actuate.tween(levelSummer, 1, { alpha:0 } );
		Actuate.tween(levelAutumn, 1, { alpha:0 } ).delay(0.1);
		Actuate.tween(levelWinter, 1, { alpha:0 } ).delay(0.2);
		Actuate.tween(levelSpring, 2, { x:xPos, y:100 } ).delay(0.5).onComplete(playScene);
	}
	
	public function playSummer(e:Event) {
		GameScene.level.setSeason(2);
		Actuate.tween(levelSpring, 1, { alpha:0 } );
		Actuate.tween(levelAutumn, 1, { alpha:0 } ).delay(0.1);
		Actuate.tween(levelWinter, 1, { alpha:0 } ).delay(0.2);
		Actuate.tween(levelSummer, 2, { x:xPos, y:100 } ).delay(0.5).onComplete(playScene);
	}
	
	public function playAutumn(e:Event) {
		GameScene.level.setSeason(3);
		Actuate.tween(levelSpring, 1, { alpha:0 } );
		Actuate.tween(levelSummer, 1, { alpha:0 } ).delay(0.1);
		Actuate.tween(levelWinter, 1, { alpha:0 } ).delay(0.2);
		Actuate.tween(levelAutumn, 2, { x:xPos, y:100 } ).delay(0.5).onComplete(playScene);
	}
	
	public function playWinter(e:Event) {
		GameScene.level.setSeason(4);
		Actuate.tween(levelSpring, 1, { alpha:0 } );
		Actuate.tween(levelSummer, 1, { alpha:0 } ).delay(0.1);
		Actuate.tween(levelAutumn, 1, { alpha:0 } ).delay(0.2);
		Actuate.tween(levelWinter, 2, { x:xPos, y:100 } ).delay(0.5).onComplete(playScene);
	}
	
	public function playScene() {
		sm.switchScene('game');
	}
	
	override public function init() {
		super.init();
		
		// Mostrar escena
		this.alpha = 0;		
		Actuate.tween(this, 1, { alpha:1 } );
		
		// Desactivar todos los botones excepto el primero
		levelSpring.alpha = levelSummer.alpha = levelAutumn.alpha = levelWinter.alpha = 1;
		levelSpring.setEnabled(true);
		levelSummer.setEnabled(false);
		levelAutumn.setEnabled(false);
		levelWinter.setEnabled(false);
		
		// Activar botones correspondientes
		if (GameScene.Session_season > 1)
			levelSummer.setEnabled(true);
		if (GameScene.Session_season > 2)
			levelAutumn.setEnabled(true);
		if (GameScene.Session_season > 3)
			levelWinter.setEnabled(true);
		
		// Mostrar Escena Primavera
		levelSpring.x = -200;
		levelSpring.y = 100;		
		Actuate.tween(levelSpring, 2, { x:0, y:100 } );
		
		// Mostrar Escena Verano
		levelSummer.x = 200;
		levelSummer.y = -300;		
		Actuate.tween(levelSummer, 2, { x:200, y:100 } ).delay(0.15);
		
		// Mostrar Escena Otonio
		levelAutumn.x = 400;
		levelAutumn.y = 650;		
		Actuate.tween(levelAutumn, 2, { x:400, y:100 } ).delay(0.30);
		
		// Mostrar Escena Invierno
		levelWinter.x = 850;
		levelWinter.y = 100;
		Actuate.tween(levelWinter, 2, { x:600, y:100 } ).delay(0.45);
	}
	
	override public function end(onComplete:Dynamic) {
		Actuate.tween(this, 1, {alpha:0});
		onComplete();
	}
	
	private function goBack(){
		PangRevenge.audioManager.justPlay(Sonido.VOLVER);
		sm.switchScene('menu');
	}
	
}