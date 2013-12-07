package engine;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.display.Bitmap;
import openfl.Assets;
import flash.text.TextField;
import flash.text.TextFormat;


/**
 * ...
 * @author CAIMMI, Brian
 */
class BackToLevelSelectButton extends Sprite
{
	var text : TextField;
	
	public function new (onClick:Dynamic) {
		super();
		
		this.graphics.beginFill(0xCCFF00);
		this.graphics.drawRect(0,0,300,46);
		this.graphics.endFill();
		this.addEventListener(flash.events.MouseEvent.CLICK,onClick);

		this.text=new TextField();
		var tf=new TextFormat(openfl.Assets.getFont('fonts/menu.ttf').fontName);
		tf.size= 40;
		tf.color=0x000000;
		tf.bold = true;
		tf.align=flash.text.TextFormatAlign.CENTER;
		this.text.width=300;
		this.text.selectable=false;
		this.text.height=40;
		this.text.text="Volver a Escenas";
		this.text.setTextFormat(tf);
		this.text.y=3;
		this.addChild(text);
		
	
		
	}		
	
	
	
}