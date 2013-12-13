package scenes;

import engine.SceneManager;
import engine.Scene;
import engine.AudioManager;
import engine.Sonido;
import engine.graphics.Button;
import flash.display.Bitmap;
import flash.events.Event;
import flash.text.TextField;
import flash.text.TextFormat;
import motion.Actuate;
import openfl.Assets;


/**
 * ...
 * @author CAIMMI, Brian
 */

class HelpScene extends Scene
{
	var controls:Bitmap;
	var boton:Button;
	var text:TextField;
	
	public function new(sm:SceneManager) 
	{
		super(sm);
		
		//FONDO.
		this.graphics.beginFill(0xCC3300);
		this.graphics.drawRect(0, 0, 800, 600);
		this.graphics.endFill();
		
		//IMAGEN EXPLICATIVA.
		controls = new Bitmap(Assets.getBitmapData("images/keys.png"));
		controls.width = 800;
		controls.height = 500;
		controls.visible = true;
		controls.x = 0;
		controls.y = 100;
		this.addChild(controls);
		
		//TEXTO
		this.text=new TextField();
		var tf=new TextFormat(openfl.Assets.getFont('fonts/menu.ttf').fontName);
		tf.size=80;
		tf.color=0x000000;
		tf.bold=true;
		tf.align=flash.text.TextFormatAlign.CENTER;
		this.text.width=400;
		this.text.selectable=false;
		this.text.height=80;
		this.text.text="CONTROLES";
		this.text.setTextFormat(tf);
		this.text.x = 10;
		this.text.y = 20;
		this.addChild(text);
		
		//VOLVER
		boton = new Button("images/back.png" , volver);
		boton.x = 10;
		boton.y = 10;
		addChild(boton);		
	}
	
	override public function init() {
		PangRevenge.audioManager.setSound(Sonido.HELP,true);
		alpha = 0;
		Actuate.tween(this, 1, { alpha:1 } );
	}
	
	override public function end(onComplete:Dynamic){
		this.alpha=1;
		Actuate.tween(this,1,{alpha:0}).onComplete(onComplete);
	}
	
	public function volver(ev:Event) {
		PangRevenge.audioManager.justPlay(Sonido.VOLVER);
		sm.switchScene('menu'); 
	}
}