package ;

import openfl.Assets;
import flash.display.Bitmap;

class Misil1 extends GameElement{
	
	var cuerpo:Animation;
	var velocidad:Float;
	public var flying(default,null):Bool;
	
	public function new () {
		super();
		cuerpo=new Animation( Assets.getBitmapData("images/player_missile.png"), 1, 6);
		this.addChild(cuerpo);
		this.hijos.push(cuerpo);
		this.flying=false;
		this.visible=false;
	}
	
	public function init(avion:Avion){
		trace("init misil");
		this.x=avion.x+50;
		this.y=avion.y+20;
		this.velocidad=220;
		this.flying=true;
		this.visible=true;
	}
	
	override function updateLogic(time:Float){
		super.updateLogic(time);
		//if(!this.flying) return;
		
		this.x+=time*this.velocidad;
		if(this.x>800) this.visible=this.flying=false;
	}	

}
