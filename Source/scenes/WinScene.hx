package scenes;

import engine.Scene;
import engine.SceneManager;
import flash.events.Event;
import motion.Actuate;
import flash.text.TextField;
import flash.text.TextFormat;
import engine.Button;
import flash.events.Event;

import engine.AudioManager;
import engine.Sonido;

/**
 * ...
 * @author CAIMMI, Brian
 */
class WinScene extends Scene
{
	
	var text:TextField;
	private var backButton:Button;

	public function new(sm:SceneManager) 
	{
		super(sm);
		
		this.graphics.beginFill(0x000000);
		this.graphics.drawRect(0, 0, 800, 600);
		this.graphics.endFill();
		
		this.text=new TextField();
		var tf=new TextFormat(openfl.Assets.getFont('fonts/menu.ttf').fontName);
		tf.size= 150;
		tf.color=0xFF0000;
		tf.bold = true;
		tf.align=flash.text.TextFormatAlign.CENTER;
		this.text.width= 750;
		this.text.selectable=false;
		this.text.height=200;
		this.text.text =  "GANASTE";
		this.text.setTextFormat(tf);
		this.text.x=20;
		this.text.y=250;
		this.addChild(text);
		
		// Boton de Regreso
		backButton = new Button(this.goBack);
		backButton.x=500;
		backButton.y = 20;
		addChild(backButton);
		
	}
	
	override public function init() {
		super.init();
		
		this.alpha = 0;
		Actuate.tween(this, 1, { alpha:1 } );		
		
		backButton.alpha = 0;
		text.x = 1700;
		text.y = 1700;
		Actuate.tween (backButton, 1, { alpha : 1 } );
		Actuate.tween (text, 2, { x : 20 , y : 250 } );
	
	}
	
	override public function end(onComplete:Dynamic) {	
		Actuate.tween(this, 1, {alpha:0});
		onComplete();
	}
	
	public function goBack(ev:Event) {
		PangRevenge.audioManager.justPlay(Sonido.VOLVER);
		sm.switchScene('menu');
	}
	
}