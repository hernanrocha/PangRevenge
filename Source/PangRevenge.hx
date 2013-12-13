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
		
		sm = new SceneManager(stage, audioManager);
		inputManager = new InputManager();
		audioManager = new AudioManager();		
		
		// Audio Manager		
		audioManager.addLibreria(Sonido.DISPARO);
		audioManager.addLibreria(Sonido.POWERUP);
		audioManager.addLibreria(Sonido.EXPLO1);
		audioManager.addLibreria(Sonido.GOLPE);
		audioManager.addLibreria(Sonido.VOLVER);
		audioManager.addLibreria(Sonido.MENU);		
		audioManager.addLibreria(Sonido.HELP);
		audioManager.addLibreria(Sonido.LEVEL1);
		
		// Cargar datos
		//Save.getInstance().sessionBegin();
		//GameScene.MAX_SCENE = Save.getInstance().lastLevel;
		//GameScene.MAX_SCENE = 3;
		
		// Scene Manager
		sm.suscribeScene('menu',new scenes.MenuScene(sm));
		sm.suscribeScene('game', new GameScene(sm));
		sm.suscribeScene("levelselect", new LevelSelect(sm));
		sm.suscribeScene('help', new HelpScene(sm));
		sm.suscribeScene('gameover', new GameOverScene(sm));
		sm.suscribeScene('winner', new WinScene(sm));
		
		sm.switchScene('menu');
		this.addChild(sm);
		
		inputManager.suscribe(stage);
		stage.addEventListener(flash.events.Event.ENTER_FRAME,gameLoop);
		stage.addEventListener(flash.events.Event.RESIZE,onResize);
		
		onResize(null);
		
		addBorders();
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
		//var borders1 = new Sprite();
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
