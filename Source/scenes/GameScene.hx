package scenes;

import engine.Scene;
import engine.SceneManager;
import engine.GameElement;
import engine.Button;
import engine.InputManager;
import flash.display.Sprite;
import flash.Lib;
import flash.display.Bitmap;
import game.Screen;
import openfl.Assets;
import flash.media.Sound;
import flash.events.Event;

class GameScene extends Scene {

	//private var avion:Avion;
	private var inmunidad:Int;
	//private var fondo:FondoAnimado;
	private var sound:flash.media.Sound;
	private var totalTime:Float;
	//public var obstaculos:Array<Malo1>;
	
	private var screen:Screen;

	public function new (sm:SceneManager) {
		super(sm);
		
		// Inicializar valores
		totalTime = 0;
		
		// Agrego la pantalla de juego
		screen = new Screen();
		screen.x = 20;
		screen.y = 20;
		addChild(screen);
		hijos.push(screen);
		
		
		// Agrego el boton de BACK
		var backButton:Button=new Button(100,30,0xFF0000,this.goBack,'BACK');
		backButton.x=680;
		backButton.y=20;
		this.addChild(backButton);
	}
	
	/*private function createObstaculo(){
 		var o=new Malo1();
 		obstaculos.push(o);
		this.addChild(o);
		this.hijos.push(o);
	}*/

	// Nuestro gameLoop (se ejecuta antes de cada cuadro).
	override public function updateLogic(time:Float){
		super.updateLogic(time);
		totalTime+=time;
       	
       	/*if(totalTime>5.0 && obstaculos.length<=5){
     		totalTime=0;
     		this.createObstaculo();
       	}*/
       	
       	if(InputManager.getInstance().keyPressed(String.fromCharCode(27))){
       		goBack();
       	}
	}
	
	private function goBack(){
		sm.switchScene('menu');
	}
	
	/*override public function init(){
		Score.getInstance().sessionBegin();
		engine.Stats.track('game','play','');
	}
	
	override public function end(onComplete:Dynamic){
		Score.getInstance().endSession();
		super.end(onComplete);
		engine.Stats.track('game','finish','',200);
	}*/

}
