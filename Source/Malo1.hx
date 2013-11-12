package ;

import openfl.Assets;
import flash.display.Bitmap;

class Malo1 extends GameElement {
	
	var cuerpo:Animation;
	var velocidad:Float;
	
	public function new () {
		super();
		cuerpo=new Animation( Assets.getBitmapData("images/malo1.png"), 1, 5);
		this.addChild(cuerpo);
		this.hijos.push(cuerpo);
		init();	
	}
	
	public function init(){
		this.x=900;
		this.y=Math.random()*400+100;
		this.velocidad=Math.random()*40+50;
	}
	
	override function updateLogic(time:Float){
		super.updateLogic(time);
		this.x-=time*velocidad;
		if(this.x<-300) init();
	}

}
