package engine.graphics;

import engine.GameElement;
import openfl.display.Bitmap;
import openfl.Assets;

class SpriteBitmap extends GameElement
{
	var bitmap:Bitmap;
	
	public function new (bitmapName:String) {
		super();
		
		this.bitmap = new Bitmap ( Assets.getBitmapData(bitmapName) );
		this.addChild(bitmap);
	}
	
}