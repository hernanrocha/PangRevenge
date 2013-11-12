package ;

import flash.display.Bitmap;
import openfl.Assets;


class Avion extends GameElement{
	
	var volando:Bitmap;
	var propulsion:Animation;
	var propulsionPlus:Animation;
	var propulsionUp:Animation;
	var propulsionDown:Animation;
	var misiles:Array<Misil1>;
	var tiempoCanon:Float;
	//var explotando://;
	
	public function new () {
		super();
		misiles = new Array<Misil1>();
		for(i in 0 ... 5){
			var misil=new Misil1();
			stage.addChild(misil);
			this.misiles.push(misil);
			this.hijos.push(misil);
		}
		
		tiempoCanon=0.0;
		
		volando = new Bitmap( Assets.getBitmapData ("images/player_spaceship.png"));
		this.addChild(volando);
		this.x=50;
		this.y=300;
		propulsion = new Animation( Assets.getBitmapData("images/booster1.png"), 1, 7);
		propulsionPlus = new Animation( Assets.getBitmapData("images/booster2.png"), 1, 7);
		propulsionUp = new Animation( Assets.getBitmapData("images/boosterup.png"), 7, 1);
		propulsionDown  = new Animation( Assets.getBitmapData("images/boosterdown.png"), 7, 1);
		
		this.addChild(propulsion);
		this.addChild(propulsionPlus);
		this.addChild(propulsionUp);
		this.addChild(propulsionDown);
		
		hijos.push(propulsion);
		hijos.push(propulsionPlus);
		hijos.push(propulsionUp);
		hijos.push(propulsionDown);
		
		
		propulsion.x=-33;
		propulsion.y=6;
		propulsionPlus.y=6;
		propulsionPlus.x=-33;
		
		propulsionPlus.visible=false;
		propulsionDown.visible=false;
		propulsionUp.visible=false;
		
		propulsionUp.x=54;
		propulsionUp.y=24;
		propulsionDown.x=54;
		propulsionDown.y=-11;

	}	
	
	override public function updateLogic(time:Float){
		super.updateLogic(time);
		if(InputManager.getInstance().keyPressed('W')){
			this.y--;
			propulsionUp.visible=true;	
		}else{
			propulsionUp.visible=false;
		}
		
		if(InputManager.getInstance().keyPressed('S')){
			this.y++;
			propulsionDown.visible=true;
		}else{
			propulsionDown.visible=false;
		}
		if(InputManager.getInstance().keyPressed('A')){
			propulsion.alpha=0.5;
			x--;
		}else{
			propulsion.alpha=1;
		}
		
		propulsion.visible=true;
		if(InputManager.getInstance().keyPressed('D')){
			propulsionPlus.visible=true;
			propulsion.visible=false;
			x++;
		}else{
			propulsionPlus.visible=false;
		}

		if(tiempoCanon>0) tiempoCanon-=time;
		
		if(InputManager.getInstance().keyPressed('Q') && tiempoCanon<=0){
			var misil=this.getMisil();
			if(misil!=null) misil.init(this);
			this.tiempoCanon=0.2;
		}

	}
	
	function getMisil():Misil1{
		for(misil in misiles){
			if(misil.flying==false) return misil;
		}
		return null;
	}

}
