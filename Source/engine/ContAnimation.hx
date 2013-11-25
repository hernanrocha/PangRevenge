package engine;

import flash.display.Sprite;
import flash.display.BitmapData;
import openfl.display.Tilesheet;
import flash.geom.Rectangle;
import flash.geom.Point;

class ContAnimation extends GameElement {
	var t:Tilesheet;
	var totalTime:Float;
	var cant:Int;
	var lastPos:Int;
	var loops:Int;
	public var lWidth(default,null):Float;
	public var lHeight(default,null):Float;
	
	public function new (img:BitmapData, cols:Int, rows:Int) {		
		super();
		loops=-1;
		var col:Int;
		var row:Int;
		lWidth=Math.round(img.width/cols);
		lHeight=Math.round(img.height/rows);

		t=new Tilesheet(img);
		for(col in 0 ... cols){
			for(row in 0 ... rows){
				t.addTileRect(new Rectangle(col*lWidth,row*lHeight,lWidth,lHeight));
			}
		}
		cant=cols*rows;
		t.drawTiles(graphics,[0,0,0]);
		totalTime=0;
		lastPos=-1;
	}
	
	public function beginLoops(loops:Int){
		this.loops=loops;
		this.setFrame(0);
	}
	
	public function looping():Bool{
		return loops!=0;
	}
	
	override public function updateLogic(time:Float){
		totalTime+=time;
		if(totalTime<0.1) return;
		totalTime-=0.1;
		setFrame(lastPos+1);
	}
	
	public function setFrame(f:Int){
		if(loops>0 && f==this.cant) loops--;
		if(loops==0) return;
		lastPos=f%this.cant;
		graphics.clear();
		t.drawTiles(graphics,[0,0,lastPos]);
	}
	
	public function getFrame():Int{
		return lastPos;
	}

}
