package ;

import flash.display.Sprite;
import openfl.Assets;
import flash.display.Bitmap;

class FondoAnimado extends GameElement {
	
	var fondoLejano:Sprite;
	var fondoCercano:Sprite;
	var fondoMedio:Sprite;
	
	public function new () {
		super();
		
		fondoLejano=new Sprite();		
		fondoMedio=new Sprite();		
		fondoCercano=new Sprite();		
		
		var bitmap = new Bitmap( Assets.getBitmapData ("images/background1.png"));
		bitmap.width=800;
		bitmap.height=600;
		fondoLejano.addChild(bitmap);
		
		bitmap = new Bitmap( Assets.getBitmapData ("images/background1.png"));
		bitmap.width=800;
		bitmap.height=600;
		bitmap.x=800;
		fondoLejano.addChild(bitmap);
		
		bitmap = new Bitmap( Assets.getBitmapData ("images/background3.png"));
		bitmap.width=800;
		bitmap.height=600;
		fondoMedio.addChild(bitmap);
		
		bitmap = new Bitmap( Assets.getBitmapData ("images/background3.png"));
		bitmap.width=800;
		bitmap.height=600;
		bitmap.x=800;
		fondoMedio.addChild(bitmap);
		
		bitmap = new Bitmap( Assets.getBitmapData ("images/background5.png"));
		bitmap.width=800;
		bitmap.height=600;
		fondoCercano.addChild(bitmap);
		
		bitmap = new Bitmap( Assets.getBitmapData ("images/background5.png"));
		bitmap.width=800;
		bitmap.height=600;
		bitmap.x=800;
		fondoCercano.addChild(bitmap);
		
		this.addChild(fondoLejano);
		this.addChild(fondoMedio);
		this.addChild(fondoCercano);
		
	}
	
	override function updateLogic(time:Float){
		var desplazamiento:Float=time*20;
		fondoLejano.x-=desplazamiento;
		fondoMedio.x-=desplazamiento*4;
		fondoCercano.x-=desplazamiento*8;

		if(fondoLejano.x<=-800) fondoLejano.x+=800;
		if(fondoMedio.x<=-800) fondoMedio.x+=800;
		if(fondoCercano.x<=-800) fondoCercano.x+=800;
			
	}
	
}
