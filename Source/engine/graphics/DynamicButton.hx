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
	private var tileInts:Array<Tile>;
	private var tilemap:Tilemap;
	
	private static inline var DISABLED:Int = 0;
	private static inline var ENABLED:Int = 1;
	private static inline var MOUSEOVER:Int = 2;
	
	private var paused:Bool = false;
	
	public var isEnabled(default, null):Bool;
	public var imgw(default, null):Int;
	public var imgh(default, null):Int;
	
	var selected:Int;
	
	var sprite:Sprite;

	public function new(img:BitmapData , onClick:Dynamic ) {
		super();
		
		//tile = new Tilesheet(img);
		tile = new Tileset(img);
		//var tileData = new Array<Float>();
		
		imgw = img.width;
		imgh = Math.round(img.height / 3);
		
		tileInts = new Array<Tile>();
		for (i in 0...3) {
			var id:Int = tile.addRect(new Rectangle(0, i * imgh, imgw, imgh));
			trace("ID: " + id);
			tileInts.push(new Tile(id));
		}
		
		tilemap = new Tilemap(imgw, imgh, tile);
		addChild(tilemap);		

		addEventListener(MouseEvent.CLICK, onClick);
		addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
		addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		
		selected = 0;
	}
		
	private function draw(v:Int) {
		tilemap.removeTile(tileInts[selected]);
		tilemap.addTile(tileInts[v]);
		selected = v;
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