package engine;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.display.Bitmap;
import openfl.Assets;
import flash.text.TextField;
import flash.text.TextFormat;


class Button extends Sprite{

	//var boton:Bitmap;
	var text:TextField;
	
	public function new (onClick:Dynamic) {
		super();
		/*
		boton = new Bitmap(Assets.getBitmapData("images/menu.png"));
		boton.visible = true;
		this.addChild(boton);
		this.x = 640; 
		this.y = 20;
		this.width = 140;
		this.height = 41;
		this.visible = true;
		boton.addEventListener(MouseEvent.CLICK, onClick);	*/
		
		this.graphics.beginFill(0xCCFF00);
		this.graphics.drawRect(0,0,300,46);
		this.graphics.endFill();
		this.addEventListener(flash.events.MouseEvent.CLICK,onClick);

		this.text=new TextField();
		var tf=new TextFormat(openfl.Assets.getFont('fonts/28 Days Later.ttf').fontName);
		tf.size= 40;
		tf.color=0x000000;
		tf.bold = true;
		tf.align=flash.text.TextFormatAlign.CENTER;
		this.text.width=300;
		this.text.selectable=false;
		this.text.height=40;
		this.text.text="Menu Principal";
		this.text.setTextFormat(tf);
		this.addChild(text);
		this.text.y=3;
	
		
	}		

}
