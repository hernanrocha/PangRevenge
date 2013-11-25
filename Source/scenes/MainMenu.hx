package scenes;

import engine.Scene;
import engine.Button;
import engine.SceneManager;
import motion.Actuate; 

class MainMenu extends Scene {

	private var b1:Button;
	private var b2:Button;
	
	public function new (sm:SceneManager) {
		super(sm);
		this.graphics.beginFill(0x323232);
		this.graphics.drawRect(0,0,800,600);
		this.graphics.endFill();
		
		b1=new Button(400,400,0x00FF00,play,'PLAY');
		b2=new Button(400,400,0xFF0000,help,'HELP');
		
		this.addChild(b1);
		this.addChild(b2);
	}
	
	public function play(){
		this.sm.switchScene('game');
	}
	
	public function help(){
		this.sm.switchScene('help');
	}
	
	override public function init(){
		b1.x=400;
		b1.width=0;
		b1.height=0;
		b2.x=400;
		b2.width=0;
		b2.height=0;
		this.alpha=0;
		b1.y=100;
		b2.y=300;
		
		Actuate.tween(this,0.2,{alpha:1});
		Actuate.tween (b1, 1, { x: (800-400)/2, width:400, height:100} );
		Actuate.tween (b2, 1, { x: (800-400)/2, width:400, height:100 } ).delay(0.15);
	}
	
	override public function end(onComplete:Dynamic){
		this.alpha=1;
		Actuate.tween(this,1,{alpha:0}).onComplete(onComplete);
	}

}
