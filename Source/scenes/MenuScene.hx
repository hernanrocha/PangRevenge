package scenes;

import engine.graphics.BackgroundSidescroller;
import engine.graphics.Button;
import engine.graphics.ContAnimation;
import engine.graphics.PopupWindow;
import engine.graphics.Transitioner;
import engine.Scene;
import engine.SceneManager;
import engine.AudioManager;
import engine.Sonido;
import engine.graphics.BallButton;
import flash.display.Sprite;

import flash.display.Bitmap;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFormat;
import openfl.Assets;

import game.Screen;
import motion.Actuate;
import motion.MotionPath;
import motion.easing.*;


class MenuScene extends Scene {

	private var logo:Bitmap;
	private var revenge:Bitmap;
	private var transitioner:Transitioner;
	
	public function new (sm:SceneManager) {
		super(sm);
		
		transitioner = new Transitioner();
		
		transitioner.push( new Bitmap( Assets.getBitmapData("images/fondos/BackSpring.jpg") ) );
		transitioner.push( new Bitmap( Assets.getBitmapData("images/fondos/BackSummer.jpg") ) );
		transitioner.push( new Bitmap( Assets.getBitmapData("images/fondos/BackAutumn.jpg") ) );
		transitioner.push( new Bitmap( Assets.getBitmapData("images/fondos/BackWinter.jpg") ) );
		
		transitioner.onEvent = true;
		transitioner.tiempo_trans = 6;
		
		
		
		transitioner.init(2);
		transitioner.x = (800 - transitioner.width) / 2;
		transitioner.y = (600 - transitioner.height);
		
		addChild(transitioner);
		hijos.push(transitioner);		
		
		var sidescroll:BackgroundSidescroller = new BackgroundSidescroller(800);
		sidescroll.push( new Bitmap( Assets.getBitmapData("images/fondos/scroll_spring.png") ) );
		sidescroll.push( new Bitmap( Assets.getBitmapData("images/fondos/scroll_summer.png") ) );
		sidescroll.push( new Bitmap( Assets.getBitmapData("images/fondos/scroll_autumn.png") ) );
		sidescroll.push( new Bitmap( Assets.getBitmapData("images/fondos/scroll_winter.png") ) );
		sidescroll.merge = 50;
		
		sidescroll.init(2);
		sidescroll.x = 0;
		sidescroll.y = (600 - sidescroll.height); // 600 - 400 : Fondo de página
		
		sidescroll.subscribe(transitioner.onChange);
		
		addChild(sidescroll);
		hijos.push(sidescroll);		
		 
		logo = new Bitmap(Assets.getBitmapData("images/PangLogo.png"));
		logo.x = (800 - logo.width);// / 2;
		logo.visible = true;
		addChild(logo);
		
		var popup:PopupWindow = new PopupWindow(this, 800, 600);
		
		var sprOpciones:Sprite = this.showOptions();
		var sprAyuda:Sprite = this.showHelp();
		var sprCreditos:Sprite = this.showCredits();		
		
		var stick:Bitmap = new Bitmap ( Assets.getBitmapData("images/menu_stick.png") );
		var btn_opciones:Button = new Button("images/menu_opciones.png", function() { popup.init(sprOpciones); }, 2);
		var btn_ayuda:Button = new Button("images/menu_ayuda.png", function() { popup.init(sprAyuda); }, -2);
		var btn_creditos:Button = new Button("images/menu_creditos.png", function() { popup.init(sprCreditos); }, 2);
		
		stick.x = 676; stick.y = 605 - stick.height;
		btn_opciones.x = stick.x - 76; btn_opciones.y = stick.y + 13;
		btn_ayuda.x = stick.x - 81; btn_ayuda.y = stick.y + 61;
		btn_creditos.x = stick.x - 51; btn_creditos.y = stick.y + 113;
		
		this.addChild(stick);
		this.addChild(btn_opciones);
		this.addChild(btn_ayuda);
		this.addChild(btn_creditos);
		
		// Experimento botones
		
		var players:Bitmap = new Bitmap ( Assets.getBitmapData("images/menu_players.png") );
		addChild(players);
		players.x = 28;
		players.y = -players.height; //50
		
		var link1p:Bitmap = new Bitmap ( Assets.getBitmapData("images/menu_players_boton.png") );
		var link2p:Bitmap = new Bitmap ( Assets.getBitmapData("images/menu_players_boton.png") );
		
		link1p.addEventListener( MouseEvent.CLICK , play1 );
		link2p.addEventListener( MouseEvent.CLICK , play2 );
		
		link1p.addEventListener( MouseEvent.MOUSE_OVER , function(e) { useHandCursor = true; } );
		link2p.addEventListener( MouseEvent.MOUSE_OVER , function(e) { useHandCursor = true; } );
		
		link1p.addEventListener( MouseEvent.MOUSE_OUT , function(e){ useHandCursor = false; } );
		link2p.addEventListener( MouseEvent.MOUSE_OUT , function(e) { useHandCursor = false; } );
				
		Actuate.tween(players, 2, { y:0 } ).onComplete(function() {
			addChild(link1p);
			addChild(link2p);
			
			link1p.x = link2p.x = players.x + 8;
			link1p.y = players.y + 197; link2p.y = players.y + 340;
		});
	}
	
	override public function init(){
		//SONIDO
		PangRevenge.audioManager.setSound(Sonido.MENU,true);
		
		//TARDANZA AL ENTRAR
		this.alpha = 0;
		Actuate.tween(this, 0.2, { alpha:1 } );
	}
	
	override public function end(onComplete:Dynamic){
		Actuate.tween(this, 1, { alpha:0 } ).onComplete(onComplete);
	}
	
	/*override public function updateLogic(time:Float) {
		super.updateLogic(time);		
	}*/
	
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
	
	private function showOptions():Sprite {	
		return new Sprite();
	}
	private function showHelp():Sprite {	
		return new Sprite();
	}
	private function showCredits():Sprite {	
		return new Sprite();
	}	
	
	public function exit(){
		flash.system.System.exit(0);
	}

}
