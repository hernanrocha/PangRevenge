package engine;

import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;

class Button extends Sprite{
	var text:TextField;

	public function new (w:Int,h:Int,color:Int,onClick:Dynamic,labelText:String) {
		super();
		this.graphics.beginFill(color);
		this.graphics.drawRect(0,0,w,h);
		this.graphics.endFill();
		this.addEventListener(flash.events.MouseEvent.CLICK,onClick);

		this.text=new TextField();
		var tf=new TextFormat(openfl.Assets.getFont('fonts/AnglesOctagon.ttf').fontName);
		tf.size=h*0.8;
		tf.color=0xFFFFFF;
		tf.bold=true;
		tf.align=flash.text.TextFormatAlign.CENTER;
		this.text.width=w;
		this.text.selectable=false;
		this.text.height=h;
		this.text.text=labelText;
		this.text.setTextFormat(tf);
		this.addChild(text);
		this.text.y=(h-text.textHeight);
	}		

}
