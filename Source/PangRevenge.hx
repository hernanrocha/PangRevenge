package;

import engine.AudioManager;
import engine.Scene;
import engine.SceneManager;
import engine.InputManager;
import engine.GameElement;
import scenes.AutumnScene;
import scenes.GameOverScene;
import scenes.GameScene;
import scenes.HelpScene;
import scenes.LevelSelect;
import scenes.SpringScene;
import scenes.SummerScene;
import scenes.WinScene;
import scenes.WinterScene;

import flash.display.Sprite;
import flash.Lib;
import flash.display.Bitmap;
import openfl.Assets;
import engine.Sonido;
import flash.events.Event;
import engine.Save;


class PangRevenge extends Sprite {

	private var sm:SceneManager;
	private var audioManager : AudioManager;
	
	public function new () {
		super();
		
		//engine.Stats.init('UA-27265081-3','testing.sempaigames.com');
		
		// Audio Manager
		AudioManager.getInstance().addLibreria(Sonido.DISPARO);
		AudioManager.getInstance().addLibreria(Sonido.POWERUP);
		AudioManager.getInstance().addLibreria(Sonido.EXPLO1);
		AudioManager.getInstance().addLibreria(Sonido.GOLPE);
		AudioManager.getInstance().addLibreria(Sonido.VOLVER);
		AudioManager.getInstance().addLibreria(Sonido.MENU);		
		AudioManager.getInstance().addLibreria(Sonido.HELP);
		AudioManager.getInstance().addLibreria(Sonido.LEVEL1);
		
		// Cargar datos
		//Save.getInstance().sessionBegin();
		GameScene.MAX_SCENE = Save.getInstance().lastLevel;
		
		// Scene Manager
		sm=new SceneManager(stage,audioManager);
		sm.suscribeScene('menu',new scenes.MenuScene(sm));
		sm.suscribeScene("levelselect", new LevelSelect(sm));
		sm.suscribeScene('scene1', new SpringScene(sm)); 
		sm.suscribeScene('scene2', new SummerScene(sm));
		sm.suscribeScene('scene3', new AutumnScene(sm));		
		sm.suscribeScene('scene4', new WinterScene(sm));
		sm.suscribeScene('help', new HelpScene(sm));
		sm.suscribeScene('gameover', new GameOverScene(sm));
		sm.suscribeScene('winner', new WinScene(sm));
		
		sm.switchScene('menu');
		this.addChild(sm);
		
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
		
		InputManager.getInstance().suscribe(stage);
		stage.addEventListener(flash.events.Event.ENTER_FRAME,gameLoop);
		stage.addEventListener(flash.events.Event.RESIZE,onResize);
		
		onResize(null);
		
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

		
}