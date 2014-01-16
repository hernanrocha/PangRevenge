package;

import engine.AudioManager;
import engine.LevelLoader;
import engine.Scene;
import engine.SceneManager;
import engine.InputManager;
import engine.GameElement;
import scenes.GameOverScene;
import scenes.GameScene;
import scenes.HelpScene;
import scenes.LevelSelect;
import scenes.MenuScene;
import scenes.WinScene;

import flash.display.Sprite;
import flash.Lib;
import flash.display.Bitmap;
import openfl.Assets;
import engine.Sonido;
import flash.events.Event;
import engine.Save;


class PangRevenge extends Sprite {

	public static var sm(default, null):SceneManager;
	public static var inputManager(default,null):InputManager;
	public static var audioManager(default,null):AudioManager;
	
	public function new () {
		super();
		
		// Input Manager
		inputManager = new InputManager();
		
		// Audio Manager
		audioManager = new AudioManager();			
		
		// Cargar datos
		//Save.getInstance().sessionBegin();
		//GameScene.MAX_SCENE = Save.getInstance().lastLevel;
		//GameScene.MAX_SCENE = 3;
		
		// Scene Manager
		sm = new SceneManager(stage, audioManager);
		sm.suscribeScene('game', new GameScene(sm));
		sm.suscribeScene("levelselect", new LevelSelect(sm));
		sm.suscribeScene('menu',new MenuScene(sm));
		sm.suscribeScene('help', new HelpScene(sm));
		sm.suscribeScene('gameover', new GameOverScene(sm));
		sm.suscribeScene('winner', new WinScene(sm));
		// Agregar Pantalla Principal
		this.addChild(sm);
		
		// Ajustar tamaño de pantalla y agregar bordes
		addBorders();
		onResize(null);
		
		// Agregar listeners
		inputManager.suscribe(stage);
		stage.addEventListener(flash.events.Event.ENTER_FRAME,gameLoop);
		stage.addEventListener(flash.events.Event.RESIZE,onResize);
		
		// Mostrar menu en pantalla
		sm.switchScene('menu');		
	}
	
	function onResize(e:Event){
		var scaleX:Float=stage.stageWidth/800;
		var scaleY:Float=stage.stageHeight/600;
		this.scaleX=this.scaleY=Math.min(scaleX,scaleY);
		this.x=(stage.stageWidth-(800*this.scaleX))/2;
		this.y=(stage.stageHeight-(600*this.scaleY))/2;
	}
	
	// Nuestro gameLoop (se ejecuta antes de cada cuadro).
	function gameLoop(e) {
		var time=1/60;
		sm.updateLogic(time);
	}

	private function addBorders() {
		var borders1 = new Bitmap(Assets.getBitmapData("images/bordeVertical.jpg"));
		borders1.x = -500;		
		addChild(borders1);
		
		var borders2 = new Bitmap(Assets.getBitmapData("images/bordeVertical.jpg"));
		borders2.x = 800;		
		addChild(borders2);
		
		var borders3 = new Bitmap(Assets.getBitmapData("images/bordeHorizontal.jpg"));
		borders3.y = -500;		
		addChild(borders3);
		
		var borders4 = new Bitmap(Assets.getBitmapData("images/bordeHorizontal.jpg"));
		borders4.y = 600;		
		addChild(borders4);
	}
}