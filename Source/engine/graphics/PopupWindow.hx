package engine.graphics;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.MouseEvent;
import openfl.Assets;

import motion.Actuate;

class PopupWindow extends Sprite{
	
	private var background:Sprite = null;
	private var board:Sprite = null;
	private var cont:Sprite = null;
	private var padre:Dynamic;
	
	public function new(padre:Dynamic , w:Float, h:Float) {
		super();
		
		staticInit(w,h);
		this.padre = padre;
	}
	
	public function init(cont:Sprite = null) {
		if ( cont != null ) {
			this.cont = cont;
			addChild(cont); // Queda primero.
			cont.x = 55;
			cont.y = 135;
		}
		
		this.visible = true;
		this.alpha = 1;
		board.alpha = 0;
		padre.addChild(this);
		Actuate.tween(board, 1, { alpha:1 } );
	}
	
	public function end(e:Dynamic) {
		Actuate.tween(this, 1, { alpha:0 } ).onComplete(function() { 
			padre.removeChild(this);
			if ( cont != null ) {
				removeChild(cont);
			}
		});
	}
	
	private function staticInit(w:Float, h:Float) {
		if ( background == null ) {
			background = new Sprite();
			background.graphics.beginFill(0x000000, .5);
			background.graphics.drawRect(0, 0, w, h); // Tomar proporciones de algun lado
			background.graphics.endFill();
			addChild(background);
			
			board = new Sprite(); //573
			var board_btm:Bitmap = new Bitmap ( Assets.getBitmapData( "images/popup_board.png" ) );
			board.addChild(board_btm);
			board.x = ( 800 - board_btm.width ) / 2;
			board.y = ( 600 - board_btm.height);
			
			var closeButton:Sprite = new Sprite();
			closeButton.addChild(new Bitmap ( Assets.getBitmapData( "images/popup_close.png" ) ) );
			board.addChild(closeButton);
			closeButton.x = 573;
			closeButton.y = 100;
			
			closeButton.addEventListener( MouseEvent.CLICK , end );
			closeButton.useHandCursor = true;
			
			addChild(board);
			board.alpha = 0;
		}
	}
}