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
	
	var activada:Bool;
	var finalizada:Bool;
	
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
	
	public function activateAnimation() {
		activada = true;
	}
	
	public function finalizeAnimation() {
		finalizada = true;
		visible = false;	
	}
	
	public function finalizo() : Bool {
		return finalizada;
	}
	
	override public function updateLogic(time:Float){
		graphics.clear();
		
		if (!activada) {
			t.drawTiles(graphics, [0, 0, 0]);
		}else{		
			totalTime+=time;
			if (totalTime > 0.05) {
					totalTime -= 0.05;
					pos = (pos + 1);
			}
			
			if (pos < cant) {
				t.drawTiles(graphics, [0, 0, pos]);						
			}else {
				finalizeAnimation();
			}		
		}			
	}

	public function reinit() {
		pos = 0;
	}
}
