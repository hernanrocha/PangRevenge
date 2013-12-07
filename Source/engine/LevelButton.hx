package engine;
import flash.display.Sprite;
import flash.display.BitmapData;
import flash.display.Bitmap;
import flash.events.Event;
import openfl.Assets;

class LevelButton extends Sprite
{

	var bitmap:Bitmap;
	
	var enabled:Bool;
	var onClick:Dynamic;
	
	public function new(imagen:BitmapData, onClick:Dynamic, enabled:Bool=false) 
	{
		super();
		
		// Cargar bitmap
		bitmap = new Bitmap(imagen);
		this.addChild(bitmap);
		bitmap.width = 200;
		bitmap.height = 350;
		
		// Activar o desactivar
		setEnabled(enabled);
		
		// Copiar valores
		this.enabled = enabled;
		this.onClick = onClick;
		this.addEventListener(flash.events.MouseEvent.CLICK, clickAction);
	}
	
	public function clickAction(e:Event) {
		if (enabled) {
			onClick();
		}
	}
	
	public function setEnabled(enabled:Bool) {
		if (!enabled) {
			trace("Desactivar");
			this.visible = true;
			this.alpha = 0.5;
			this.enabled = false;
		}else {
			this.visible = true;
			this.alpha = 1.0;
			this.enabled = true;			
		}
	}
	
}