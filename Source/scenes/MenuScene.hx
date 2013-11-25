package scenes;

import engine.Scene;
import engine.SceneManager;
import engine.Button;
import motion.Actuate;
import flash.text.TextField;
import flash.text.TextFormat;

class MenuScene extends Scene {

	private var b1:Button;
	private var b2:Button;
	private var text:TextField;
	
	public function new (sm:SceneManager) {
		super(sm);
		this.graphics.beginFill(0x323232);
		this.graphics.drawRect(0,0,800,600);
		this.graphics.endFill();
		
		b1=new Button(400,100,0x00FF00,play,'PLAY');
		this.addChild(b1);

		#if desktop
		b2=new Button(400,100,0xFF0000,exit,'EXIT');		
		this.addChild(b2);
		#end
		
		this.text=new TextField();
		var tf=new TextFormat(openfl.Assets.getFont('fonts/AnglesOctagon.ttf').fontName);
		tf.size=20;
		tf.color=0xFFFFFF;
		tf.bold=true;
		tf.align=flash.text.TextFormatAlign.CENTER;
		this.text.width=200;
		this.text.selectable=false;
		this.text.height=100;
		//this.text.text='Score: '+Score.getInstance().bestScore;
		
		
		this.text.setTextFormat(tf);
		this.addChild(text);
		this.text.y=10;
		this.text.x=800-10-this.text.width;
		
	}
	
	public function play(){
		this.sm.switchScene('game');
	}
	
	public function exit(){
		flash.system.System.exit(0);
	}
	
	override public function init(){
		//engine.Stats.track('menu','main','');
		b1.x=400;
		b1.width=0;
		b1.height=0;
		this.alpha=0;
		b1.y=100;
		
		var tf=text.getTextFormat();
		//this.text.text='Score: '+Score.getInstance().bestScore;
		this.text.setTextFormat(tf);
		
		Actuate.tween(this,0.2,{alpha:1});
		Actuate.tween (b1, 1, { x: (800-400)/2, width:400, height:100} );
		
		if(b2!=null){
			b2.x=400;
			b2.width=0;
			b2.height=0;
			b2.y=300;		
			Actuate.tween (b2, 1, { x: (800-400)/2, width:400, height:100 } ).delay(0.15);
		}
	}
	
	override public function end(onComplete:Dynamic){
		this.alpha=1;
		Actuate.tween(this,1,{alpha:0}).onComplete(onComplete);
	}

}
