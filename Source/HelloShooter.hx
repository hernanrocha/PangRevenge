package;

import engine.Scene;
import engine.SceneManager;
import engine.InputManager;
import engine.GameElement;

import flash.display.Sprite;
import flash.Lib;
import flash.display.Bitmap;
import openfl.Assets;
import flash.media.Sound;
import flash.events.Event;

class HelloShooter extends Sprite {

	private var sm:SceneManager;
	
	public function new () {
		super();
		
		//engine.Stats.init('UA-27265081-3','testing.sempaigames.com');
		
		sm=new SceneManager(stage);
		sm.suscribeScene('menu',new scenes.MenuScene(sm));
		sm.suscribeScene('game',new scenes.GameScene(sm));
		sm.switchScene('menu');
		this.addChild(sm);
		InputManager.getInstance().suscribe(stage);
		stage.addEventListener(flash.events.Event.ENTER_FRAME,gameLoop);
		stage.addEventListener(flash.events.Event.RESIZE,onResize);
		/*
		var s=new Sprite();
		s.graphics.beginFill(0);
		s.graphics.drawRect(0,0,800,600);
		s.graphics.endFill();
		*/
		/*var borders=new Sprite();
		borders.graphics.beginFill(0xFF00FF);
		borders.graphics.drawRect(-500,0,500,600);
		borders.graphics.drawRect(800,0,500,600);
		borders.graphics.drawRect(0,-500,800,500);
		borders.graphics.drawRect(0,600,800,500);
		borders.graphics.endFill();
		this.addChild(borders);
		borders.x=0;
		borders.y=0;*/
		
	}
	
	function onResize(e:Event){
		var scaleX:Float=stage.stageWidth/800;
		var scaleY:Float=stage.stageHeight/600;
		this.scaleX=this.scaleY=Math.min(scaleX,scaleY);
		this.x=(stage.stageWidth-(800*this.scaleX))/2;
		this.y=(stage.stageHeight-(600*this.scaleY))/2;
	}
	
	// Nuestro gameLoop (se ejecuta antes de cada cuadro).
	function gameLoop(e){
		var time=1/60;
		sm.updateLogic(time);
	}

		
}
