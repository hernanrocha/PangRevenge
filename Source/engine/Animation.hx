package engine;

import flash.display.Sprite;
import flash.display.BitmapData;
import openfl.display.Tilesheet;
import flash.geom.Rectangle;
import flash.geom.Point;

/**
 * ...
 * @author fbricker
 */
class Animation extends GameElement {
	var t:Tilesheet;
	var totalTime:Float;
	var cant:Int;
	
	var pos:Int = 0;
	
	public function new (img:BitmapData, cols:Int, rows:Int) {		
		super();
		var col:Int;
		var row:Int;
		var w:Int=Math.round(img.width/cols);
		var h:Int=Math.round(img.height/rows);

		t=new Tilesheet(img);
		for(col in 0 ... cols){
			for(row in 0 ... rows){
				t.addTileRect(new Rectangle(col * w, row * h, w, h));
			}
		}
		
		this.width=w;
		this.height=h;
		cant=cols*rows;
		trace("Cargar sprite de " + cant + " elementos.");
		t.drawTiles(graphics,[0,0,0]);
		totalTime=0;
	}
	
	override public function updateLogic(time:Float){
		graphics.clear();
		totalTime+=time;
		//var pos:Int=Math.round(totalTime*10)%cant;	
		//var pos = 1;
		//trace(totalTime);
		if (totalTime > 0.05) {
				//trace ("Cambiando");
				totalTime -= 0.05;
				pos = (pos + 1);
				
		}
		if (pos < cant) {
			t.drawTiles(graphics, [0, 0, pos]);						
		}else {
			visible = false;
		}
			
	}

	public function reinit() {
		pos = 0;
	}
}
