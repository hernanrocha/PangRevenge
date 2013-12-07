package engine;

import flash.display.Bitmap;
import flash.text.TextField;
import flash.text.TextFormat;
import openfl.Assets;
import motion.Actuate;


class BallButton extends GameElement{
	var text:TextField;
	var bitmap:Bitmap;
	
	public function new (w:Int,h:Int,onClick:Dynamic,labelText:String) {
		super();
		this.width = w;
		this.height = h;
		bitmap = new Bitmap (Assets.getBitmapData("images/bola1.png"));
		this.addChild(bitmap);
		bitmap.width = w;
		bitmap.height = h;
		bitmap.x = 0;
		bitmap.y = 0;
		this.addEventListener(flash.events.MouseEvent.CLICK, onClick);

		this.text=new TextField();
		var tf=new TextFormat(openfl.Assets.getFont('fonts/28 Days Later.ttf').fontName);
		tf.size=h*0.20;
		tf.color=0x000000;
		tf.bold=true;
		tf.align=flash.text.TextFormatAlign.CENTER;
		this.text.width=w;
		this.text.selectable=false;
		this.text.height=h;
		this.text.text=labelText;
		this.text.setTextFormat(tf);
		this.addChild(text);
		this.text.y = (h - text.textHeight)/2;
	}		
	
}
