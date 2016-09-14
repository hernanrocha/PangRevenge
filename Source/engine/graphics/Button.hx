package engine.graphics;

import openfl.Assets;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.display.Bitmap;
import flash.text.TextField;
import flash.text.TextFormat;


class Button extends Rotable{

	var boton:Bitmap;
	var text:TextField;
	
	public function new (dir:String , onClick:Dynamic, rot:Int = 10) {
		super();
		
		boton = new Bitmap(Assets.getBitmapData(dir));
		boton.visible = true;
		
		addChild(boton);
		
		addEventListener(MouseEvent.CLICK, onClick);
		addEventListener(MouseEvent.MOUSE_OVER, function(e) { useHandCursor = true; rotate(rot); } );
		addEventListener(MouseEvent.MOUSE_OUT, function(e) { useHandCursor = false; rotate(0); } );
	}	

}
