package engine;

import flash.display.Sprite;
import flash.geom.Rectangle;

class GameElement extends Sprite{
	
	var hijos:Array<GameElement>;
	var boundingBox:Rectangle;
	
	public function new () {
		super();
		this.boundingBox=null;
		hijos=new Array<GameElement>();
	}
	
	public function updateLogic(time:Float){
		var hijo:GameElement;
		for(hijo in hijos){
			hijo.updateLogic(time);
		}
	}
	
	public function collisionTest(ge:GameElement):Bool{
		if(this.boundingBox==null || ge.boundingBox==null) return false;
		if( this.x + this.boundingBox.x + this.boundingBox.width >= ge.x + ge.boundingBox.x &&
			this.x + this.boundingBox.x <= ge.x + ge.boundingBox.x + ge.boundingBox.width &&
			this.y + this.boundingBox.y + this.boundingBox.height >= ge.y + ge.boundingBox.y &&
			this.y + this.boundingBox.y <= ge.y + ge.boundingBox.y + ge.boundingBox.height )
		{
			return true;
		}
		return false;
	}
	
}
