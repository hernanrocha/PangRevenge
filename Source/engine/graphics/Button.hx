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
	
	public function new (onClick:Dynamic) {
		super();
		
		boton = new Bitmap(Assets.getBitmapData("images/back.png"));
		boton.visible = true;
		this.addChild(boton);
		this.width = 120;
		this.height = 33;
		this.visible = true;
		boton.addEventListener(MouseEvent.CLICK, onClick);
		
		/*this.graphics.beginFill(0xCCFF00);
		this.graphics.drawRect(0,0,80,30);
		this.graphics.endFill();
		this.addEventListener(flash.events.MouseEvent.CLICK,onClick);

		this.text=new TextField();
		var tf=new TextFormat(openfl.Assets.getFont('fonts/menu.ttf').fontName);
		tf.size= 30;
		tf.color=0x000000;
		tf.bold = true;
		tf.align=flash.text.TextFormatAlign.CENTER;
		this.text.width = 80;
		this.text.height = 30;
		this.text.selectable = false;
		this.text.text="Volver";
		this.text.setTextFormat(tf);
		this.addChild(text);
		this.text.y=0;*/		
	}		

}
