package engine.graphics;

import engine.GameElement;
import flash.display.DisplayObject;
import flash.display.Sprite;

/**
 * ...
 * @author juampi92
 */
class Rotable extends GameElement {
	
	private var spr:Sprite;
	
	override function addChild(child:DisplayObject):DisplayObject
	{
		spr = new Sprite();
		super.addChild(spr);
		
		spr.x = child.width / 2;
		spr.y = child.height / 2;
		
		spr.addChild(child);
		child.x = - child.width / 2;
		child.y = - child.height / 2;
		
		return this;
	}
	
	public function rotate(ang:Float) {
		spr.rotation = ang;
	}
	
}