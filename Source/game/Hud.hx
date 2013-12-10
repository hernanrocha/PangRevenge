package game;

import flash.display.Bitmap;
import flash.display.GraphicsSolidFill;
import flash.display.InteractiveObject;
import flash.text.TextField;
import flash.text.TextFormat;
import engine.GameElement;
import haxe.ds.Vector.Vector;
import openfl.Assets;
import flash.display.Sprite;
import flash.display.Bitmap;
import scenes.GameScene;

/**
 * ...
 * @author CAIMMI, Brian
 */
class Hud extends GameElement
{
	//---Aca definir los elementos de la siguiente forma.
	public static var ESCUDO:Int = 0;
	public static var DOBLE_TIRO:Int = 1;
	public static var GANCHO:Int = 2;
	public static var SPEED:Int = 3;
	//
	
	private var score1:TextField;
	private var score2:TextField;
	private var p1Score:Int;
	private var p2Score:Int;
	private var escena:TextField;
	private var jug1:TextField;
	private var jug2:TextField;
	private var w : Int;
	private var h : Int;
	private var vidas1:Array<Bitmap>;
	private var vidas2:Array<Bitmap>;
	private var p1Lifes:Int;
	private var p2Lifes:Int;
	public static inline var MAX_VIDAS = 3;
	public static inline var VIDAS_INICIALES = 3;
	private var elementos1:Array<Bitmap>;
	private var elementos2:Array<Bitmap>;
	
	private var cantJugadores:Int;
	
	public function new(w:Int,h:Int,x:Float,y:Float) 
	{
		super();
		
		this.w = w;
		this.h = h;
		this.x = x;
		this.y = y;
		
		//Cuadrado
		this.graphics.beginFill(0xFF0000);
		this.graphics.drawRoundRect(0, 0, w, h, 10, 10);
		this.graphics.beginFill(0x000000);
		this.graphics.drawRoundRect(5, 5, w - 10, h - 10, 10, 10);
		this.graphics.lineStyle(3,0xFF0000);
		this.graphics.moveTo(3,h/2);
		this.graphics.lineTo(w - 3, h / 2);
		this.graphics.endFill();
		this.graphics.moveTo(w/2,h/2);
		this.graphics.lineTo(w/2,h - 3);
		this.graphics.endFill();
		
		//Text Format Score
		var tf=new TextFormat(openfl.Assets.getFont('fonts/menu.ttf').fontName);
		tf.size=50;
		tf.color=0xBBBBBB;
		tf.bold=true;
		tf.align=flash.text.TextFormatAlign.CENTER;
		
		//Score 1
		p1Score = 0;
		this.score1 = new TextField();
		this.score1.width=150;
		this.score1.selectable=false;
		this.score1.height=50;
		this.score1.text = "000000";
		this.score1.x = 10;
		this.score1.y = 3;
		this.score1.setTextFormat(tf);
		this.addChild(score1);
		
		//Score 2
		p2Score = 0;
		this.score2 = new TextField();
		this.score2.width=150;
		this.score2.selectable=false;
		this.score2.height=50;
		this.score2.text = "000000";
		this.score2.x = w - this.score2.width - 10;
		this.score2.y = 3;
		this.score2.setTextFormat(tf);
		this.addChild(score2);
		
		//Formato texto escena
		var tfe=new TextFormat(openfl.Assets.getFont('fonts/ARCADE.TTF').fontName);
		tfe.size=50;
		tfe.color=0x00FF00;
		tfe.bold=true;
		tfe.align = flash.text.TextFormatAlign.CENTER;
		
		//Escena
		this.escena = new TextField();
		this.escena.width=150;
		this.escena.selectable=false;
		this.escena.height=10;
		this.escena.text = "1-3";
		this.escena.x = (w / 2) - (this.escena.width / 2);
		this.escena.y = 0;
		this.escena.setTextFormat(tfe);
		this.addChild(escena);
		
		//Formato texto jugadores
		var tfj=new TextFormat(openfl.Assets.getFont('fonts/menu.ttf').fontName);
		tfj.size=40;
		tfj.color=0x002BFF;
		tfj.bold=true;
		tfj.align = flash.text.TextFormatAlign.CENTER;
		
		
		//Jug1
		this.jug1 = new TextField();
		this.jug1.width=150;
		this.jug1.selectable=false;
		this.jug1.height=10;
		this.jug1.text = "Hunter";
		this.jug1.x = this.score1.x + this.score1.width + 10;
		this.jug1.y = 5;
		this.jug1.setTextFormat(tfj);
		this.addChild(jug1);
		
		//Jug2
		this.jug2 = new TextField();
		this.jug2.width=150;
		this.jug2.selectable=false;
		this.jug2.height=10;
		this.jug2.text = "Codey";
		this.jug2.x = this.score2.x - this.jug2.width - 10;
		this.jug2.y = 5;
		this.jug2.setTextFormat(tfj);
		this.addChild(jug2);
	
		//Creo los corazones y los pongo invisibles
		p1Lifes = VIDAS_INICIALES;
		p2Lifes = VIDAS_INICIALES;
		
		vidas1 = new Array<Bitmap>();
		var pos1:Int = 14;
		for( i in 0...3 ) {
			var v:Bitmap = new Bitmap (Assets.getBitmapData("images/corazon.png"));
			vidas1.push(v);
			v.x = pos1;
			v.y = 58;
			v.scaleX = v.scaleY = 0.5;
			v.visible = false;
			this.addChild(v);
			pos1 = pos1 + 36;
		}
		vidas2 = new Array<Bitmap>();
		var pos2:Int = w - 46;
		for( i in 0...3 ) {
			var v:Bitmap = new Bitmap (Assets.getBitmapData("images/corazoninv.png"));
			vidas2.push(v);
			v.x = pos2;
			v.y = 58;
			v.scaleX = v.scaleY = 0.5;
			v.visible = false;
			this.addChild(v);
			pos2 = pos2 - 40;
		}
		
		//Creo los elementos PowerUps.
		pos1 += 10;
		pos2 -= 10;
		elementos1 = new Array<Bitmap>();
		elementos2 = new Array<Bitmap>();
		//este seria el escudo. CAMBIAR POR EL PNG DEL ESCUDO
		
		crear("powerups/shield.png", pos1, pos2);
		pos1 += 30;
		pos2 -= 30;
		crear("powerups/doble_tiro_up.png", pos1, pos2);
		pos1 += 30;
		pos2 -= 30;
		crear("powerups/hook.png", pos1, pos2);
		pos1 += 30;
		pos2 -= 30;
		crear("powerups/fast.png", pos1, pos2);
		
		//y asi crear los demas poweups!!
		
		//-------------------
		
		//Pruebas
		//addScore(1, 123);
		//addScore(2, 12548);
		//addScore(1, 5);
		setEscena(2, 4);
		setVidas1(3);
		setVidas2(3);
		/*unsetElemento(ESCUDO, 1);
		setElemento(DOBLE_TIRO, 1);
		setElemento(GANCHO,1);*/
	}
	
	public function addScore(jugador:Int, puntos:Int) {
		// Agregar puntos
		var total = 0;
		if (jugador == 1) {
			p1Score += puntos;
			total = p1Score;
		}else if (jugador == 2) {
			p2Score += puntos;
			total = p2Score;
		}
		
		// Setear texto
		var cantCeros:Int = 6 - cantDigitos(total);
		var s : String="";
		while(cantCeros!=0){             //mientras a n le queden dígitos
            s += "0";
			cantCeros--;          //sumamos 1 al contador de dígitos
        }
		
		if (jugador == 1) {
			this.score1.text = s + total;
		}else if (jugador == 2) {			
			this.score2.text = s + total;
		}
	}
	
	public function resetScore() {
		addScore(1, -p1Score);
		addScore(2, -p2Score);
	}
	
	public function setEscena(estacion:Int, level:Int) {
		escena.text = "" + estacion + "-" + level;
	}
	
	public function cantDigitos(n:Float):Int {
		var digitos:Int =  0;    //esta variable es el contador de dígitos
            while(n > 0.99){             //mientras a n le queden dígitos
                   n = n / 10;         //le quitamos el último dígito
                   digitos++;          //sumamos 1 al contador de dígitos
            }
			return digitos;
	}
	
	public function restarVida(jugador:Int) {
		if (jugador == 1) {
			if (p1Lifes == 0) {
				cantJugadores--;
				GameScene.screen.unload1();
			}else {				
				p1Lifes--;
				setVidas1(p1Lifes);
			}
		}else if (jugador == 2) {
			if (p2Lifes == 0) {
				cantJugadores--;
				GameScene.screen.unload2();
			}else {				
				p2Lifes--;
				setVidas2(p2Lifes);
			}
		}
		
		//Me fijo si llamar o no al GameOver
		if ( cantJugadores == 0 ) {
			trace("llamando al gameOver");
			GameScene.screen.gameOver();
		}
	}
	
	public function setVidas1(n:Int) {
		for ( v in vidas1 ) {
			v.visible = false;
		}
		
		p1Lifes = n;
		for ( i in 0...p1Lifes ) {
			vidas1[i].visible = true;
		}
		
	}
	
	public function setVidas2(n:Int) {
		for ( v in vidas2 ) {
			v.visible = false;
		}
		
		p2Lifes = n;
		for ( i in 0...p2Lifes ) {
			vidas2[i].visible = true;
		}
		
	}
	
	public function sumarVida(jugador:Int) {
		if (jugador == 1) {
			if (p1Lifes < MAX_VIDAS) {
				p1Lifes++;
				setVidas1(p1Lifes);
			}
		}else if (jugador == 2) {
			if (p2Lifes < MAX_VIDAS) {
				p2Lifes++;
				setVidas2(p2Lifes);
			}
		}
	}
	
	public function crear(dir:String, pos1:Int, pos2:Int ) {
		var pw11:Bitmap = new Bitmap(Assets.getBitmapData("images/" + dir));
		var pw12:Bitmap = new Bitmap(Assets.getBitmapData("images/" + dir));
		pw11.x = pos1;
		pw11.y = 58;
		pw12.x = pos2;
		pw12.y = 58;
		//Esto te les pone un alfa ALTERNATIVA 2.
		pw11.alpha = 0.3;
		pw12.alpha = 0.3;
		elementos1.push(pw11);
		elementos2.push(pw12);
		this.addChild(pw11);
		this.addChild(pw12);
	}
	
	public function setElemento(el:Int,jug:Int) {
		if (jug == 1)
			elementos1[el].alpha = 1;	
		else
			elementos2[el].alpha = 1;
	}
	
	public function unsetElemento(el:Int,jug:Int) {
		if (jug == 1)
			elementos1[el].alpha = 0.3;			
		else
			elementos2[el].alpha = 0.3;
	}
	
	public function init() {	
		//Cantidad de Jugadores
		cantJugadores = GameScene.PLAYER_CANT;
		trace ("cantidad de jugares macho ! " + cantJugadores);
		
		setVidas1(3);
		setVidas2(3);
		
		for ( i in 0...3 ) {
			unsetElemento(i, 1);
			unsetElemento(i, 2);
		}
	}
	
}