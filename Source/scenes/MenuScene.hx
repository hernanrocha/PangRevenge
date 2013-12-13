package scenes;

import engine.Scene;
import engine.SceneManager;
import engine.AudioManager;
import engine.Sonido;
import engine.graphics.BallButton;
import flash.display.Bitmap;
import flash.events.Event;
import motion.Actuate;
import flash.text.TextField;
import flash.text.TextFormat;
import motion.MotionPath;
import openfl.Assets;
import motion.easing.*;


class MenuScene extends Scene {

	private var b1:BallButton;
	private var b2:BallButton;
	private var b3:BallButton;
	private var text:TextField;
	private var fondo:Bitmap;
	private var revenge:Bitmap;
	
	public function new (sm:SceneManager) {
		super(sm);
		 
		fondo = new Bitmap(Assets.getBitmapData("images/PangLogo.png"));
		fondo.width = 800;
		fondo.height = 300;
		fondo.visible = true;
		this.addChild(fondo);
				
		revenge = new Bitmap(Assets.getBitmapData("images/revenge.png"));
		this.addChild(revenge);
		
		b1 = new BallButton(225, 200, play1, '1 Jugador');
		b2 = new BallButton(225, 200, play2, '2 Jugadores');
		b3 = new BallButton(225, 200, help, 'Ayuda');
		b1.x=25;
		b2.x=287;
		b3.x = 550;
		b1.y = - 400;
		b2.y = - 400;
		b3.y = - 400;
		b1.visible = false;
		b2.visible = false;
		b3.visible = false;
		
		this.addChild(b1);
		this.addChild(b2);
		this.addChild(b3);
	}
	
	public function play1(event:Event) {
		PangRevenge.audioManager.justPlay(Sonido.EXPLO1);
		GameScene.setTwoPlayers(false);
		this.sm.switchScene('levelselect');
	}
	
	public function play2(event:Event) {
		PangRevenge.audioManager.justPlay(Sonido.EXPLO1);
		GameScene.setTwoPlayers(true);
		this.sm.switchScene('levelselect');
	}
	
	public function help(event:Event) {	
		PangRevenge.audioManager.justPlay(Sonido.EXPLO1);
		this.sm.switchScene('help');
	}
	
	
	public function exit(){
		flash.system.System.exit(0);
	}
	
	override public function init(){
		b1.y = - 400;
		b2.y = - 400;
		b3.y = - 400;		
		
		//SONIDO
		PangRevenge.audioManager.setSound(Sonido.MENU,true);
		
		//TARDANZA AL ENTRAR
		Actuate.tween(this, 0.2, { alpha:1 } );
		
		//REVENGE
		revenge.width = 80000;
		revenge.height = 60000;
		revenge.alpha = 0;
		
		//ANIMACION
		Actuate.tween(revenge, 1.5, { alpha : 1, width : 600, height : 200, x: 100, y: 100 } ).delay(1).onComplete(function(){
		
		//Bola 1
		b1.visible = true;
		Actuate.tween (b1, 4, {  y: 350 } ).ease(Bounce.easeOut);
		
		//Bola 2
		b2.visible = true;	
		Actuate.tween (b2, 4, {  y: 350 } ).ease(Bounce.easeOut).delay(0.2);
			
		//Bola 3
		b3.visible = true;	
		Actuate.tween (b3, 4, {  y: 350 } ).ease(Bounce.easeOut).delay(0.3);
		
		});		
		
		
	}
	
	override public function end(onComplete:Dynamic){
		b1.y = - 400;
		b2.y = - 400;
		b3.y = - 400;
		this.alpha=1;
		Actuate.tween(this,1,{alpha:0}).onComplete(onComplete);
	}

}
