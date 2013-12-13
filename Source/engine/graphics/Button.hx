package engine.graphics;

import engine.GameElement;
import openfl.Assets;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.display.Bitmap;
import flash.text.TextField;
import flash.text.TextFormat;


class Button extends GameElement{

	var boton:Bitmap;
	var text:TextField;
	
	public function new (dir:String , onClick:Dynamic, rot:Int=2) {
		super();
		
		boton = new Bitmap(Assets.getBitmapData(dir));
		boton.visible = true;
		this.addChild(boton);
		this.visible = true;
		
		boton.addEventListener(MouseEvent.CLICK, onClick);
		boton.addEventListener(MouseEvent.MOUSE_OVER, function(e) { useHandCursor = true; boton.rotation = rot; } );
		boton.addEventListener(MouseEvent.MOUSE_OUT, function(e) { useHandCursor = false; boton.rotation = 0; } );
	}	

}
