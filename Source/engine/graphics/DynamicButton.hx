package engine.graphics;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import openfl.display.Tile;
import openfl.display.Tileset;
//import openfl.display.Tilesheet;
import openfl.display.Tilemap;
import flash.geom.Rectangle;
import flash.events.MouseEvent;

/**
 * Soporta imágenes en vertical todas del mismo alto
 * Formato:
	 * Disabled
	 * Enabled
	 * OnMouseOver
 * @author juampi92
 */
class DynamicButton extends Sprite{
	//private var tile:Tilesheet;
	private var tile:Tileset;
	private var tileInts:Array<Int>;
	private var tilemap:Tilemap;
	
	private static inline var DISABLED:Int = 0;
	private static inline var ENABLED:Int = 1;
	private static inline var MOUSEOVER:Int = 2;
	
	private var paused:Bool = false;
	
	public var isEnabled(default, null):Bool;
	public var w(default, null):Int;
	public var h(default, null):Int;
	
	var sprite:Sprite;

	public function new(img:BitmapData , onClick:Dynamic ) {
		super();
		
		//tile = new Tilesheet(img);
		tile = new Tileset(img);
		var tileData = new Array<Float>();
		
		w = img.width;
		h = Math.round(img.height / 3);
		
		tileInts = new Array<Int>();
		for (i in 0...3) {
			tileInts.push(tile.addRect(new Rectangle(0, i * h, w, h)));
		}
		
		tilemap = new Tilemap(800, 600, tile);
		addChild(tilemap);
		
		tilemap.addTile(new Tile(tileInts.pop()));
		
		sprite = new Sprite();
		sprite.width = width = w;
		sprite.height = height = h;
		
		sprite.graphics.drawRect(0,0,w,h);
		addChild(sprite);
		
		this.disable();
		
		sprite.addEventListener(MouseEvent.CLICK, onClick);
		sprite.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
		sprite.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
	}
		
	private function draw(v:Int) {
		graphics.clear();
		//tile.drawTiles(graphics, [0,0,v]);
	}
	
	public function disable() {
		isEnabled = false;
		draw(DynamicButton.DISABLED);
	}
	public function enable() {
		isEnabled = true;
		draw(DynamicButton.ENABLED);
	}
	
	public function pause(v:Bool) {
		paused = v;
		if ( paused ) {
			useHandCursor = false;
			if ( isEnabled )
				draw(DynamicButton.ENABLED);
			else
				draw(DynamicButton.DISABLED);
		}
	}
	
	private function onMouseOver(e) {
		if ( isEnabled && !paused ) {
			useHandCursor = true;
			draw(DynamicButton.MOUSEOVER);
		}
	}
	
	private function onMouseOut(e) {
		if ( isEnabled && !paused ) {
			useHandCursor = false;
			draw(DynamicButton.ENABLED);
		}
	}
	
	
}