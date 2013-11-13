package;

import flash.display.Sprite;
import flash.Lib;
import flash.display.Bitmap;
import openfl.Assets;
import flash.media.Sound;
import flash.events.Event;
/**
 * ...
 * @author fbricker
 */
class PangRevenge extends Sprite {

	//private var avion:Avion;
	private var obstaculos:Array<GameElement>;
	private var inmunidad:Int;
	//private var fondo:FondoAnimado;
	private var sound:flash.media.Sound;
	private var totalTime:Float;
	
	
	private var fondo:Bitmap;
	private var b1:Ball;
	private var b2:Ball;
	private var b3:Ball;

	public function new () {
		super();
		//fondo=new FondoAnimado();
		//this.addChild(fondo);
		
		//Cargo los Assets		
		//obstaculos = new Array<GameElement>();
		//var o=new Malo1();
		//obstaculos.push(o);
		//this.addChild(o);
		
		//avion = new Avion(stage);
		//sound = Assets.getSound ("sound3");
		//
		// Inicializo algunas variables
		//inmunidad=0;
				//
		// Los coloco en Pantalla
		//this.addChild(avion);
		
		
		fondo = new Bitmap( Assets.getBitmapData ("images/fondo_verano.jpg"));
		addChild(fondo);
		fondo.height = 400;
		fondo.width = 600;
		
		totalTime = 0;
		
		
		b1 = new Ball(stage, 30, 5, 300);
		b2 = new Ball(stage, 0, 10, 150);
		b3 = new Ball(stage, 0, 5, 150);
		this.addChild(b1);
		this.addChild(b2);
		this.addChild(b3);
		
		
		// Agregar EventListener
		InputManager.getInstance().suscribe(stage);
		stage.addEventListener(flash.events.Event.ENTER_FRAME, gameLoop);
		stage.addEventListener(flash.events.Event.RESIZE, onResize);

		
	}
	
	function onResize(e:Event){
		//var scaleX:Float=stage.stageWidth/800;
		//var scaleY:Float=stage.stageHeight/600;
		//stage.scaleX=stage.scaleY=Math.min(scaleX,scaleY);
	}
	
	// Nuestro gameLoop (se ejecuta antes de cada cuadro).
	function gameLoop(e){
		var time=1/60;
		totalTime += time;
		
		// Actualizar fondo
		//fondo.updateLogic(time);
		
		// Actualizar avion
		//avion.updateLogic(time);
		
		// Actualizar obstaculos
		//for(obstaculo in obstaculos){
		//	obstaculo.updateLogic(time);
       	//}
       	
       	/*if(totalTime > 5.0 && obstaculos.length <= 5){
     		totalTime=0;
     		var o = new Malo1();
     		obstaculos.push(o);
			this.addChild(o);
       	}*/
       	
		b1.updateLogic(time);
		b2.updateLogic(time);
		b3.updateLogic(time);
       	
       	/*
       	// Colision contra asteroide e inmunidad post-colision
       	if(inmunidad>0){
       		inmunidad--;
       		//avion.visible=inmunidad%20<10;
       	}else{
	       	if(detectarColision(avion,obstaculo)){
	       		inmunidad=200;
	       		sound.play();
	       	}
       	}*/
	}


    // Detecta si obj1 y obj2 colisionan por el metodo mas simple de todos.
    private function detectarColision(obj1:GameElement,obj2:Bitmap):Bool{
		if(obj1.x+obj1.width>obj2.x && obj1.x<obj2.x+obj2.width){
		   	if(obj1.y+obj1.height>obj2.y && obj1.y<obj2.y+obj2.height){
		   		return true;
		   	}
		}
		return false;
    }
		
}