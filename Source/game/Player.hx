package game;
import engine.ContAnimation;
import engine.GameElement;
import flash.display.Bitmap;
import flash.geom.Rectangle;
import game.ball.Ball;
import motion.Actuate;
import openfl.Assets;
import engine.InputManager;
import engine.AudioManager;
import engine.Sonido;
import scenes.GameScene;

/**
 * ...
 * @author ...
 */
class Player extends GameElement
{
	// Constantes
	public static inline var DISPARO_COOLDONW:Int = 10;
	public static inline var MUNICION_INICIAL:Int = 1;
	public static inline var VX_INICIAL:Float = 0.7;
	public static inline var VX_SALTO_INICIAL:Float = 1.8;
	public static inline var VY_SALTO_INICIAL:Int = -40;	
	public static inline var POS_INICIAL:Int = 25;
	
	// Propiedades
	public var id(default, null):Int;
	
	private var velocidad_movimiento:Float;
	private var velocidad_saltoX:Float;
	private var velocidad_saltoY:Float;
	private var speed:Float;
	
	public var radio:Float = 20;
	
	private var municion_disp:Int;
	private var municion_max:Int;
	
	// Variables de estado
	private var disparando:Float = 0;
	private var disparado_antiRebote:Bool = false;
	
	private var saltando:Bool = false;
	private var saltandoDir:String;
	private var saltandoVy:Float = 0;
	
	private var pausa:Float = 0;
	
	public var alive(default, null):Bool = false;
	public var lives(default, null):Int = 3;
	
	// Public var... Hermoso :P
	public var sogas:Array<Soga>;
	
	// Dibujos
	private var playerDer:ContAnimation;
	private var playerIzq:ContAnimation;
	private var playerShield:ContAnimation;
	private var playerQuieto:Bitmap;
	private var playerDisparo:Bitmap;
	
	private var inmunidad:Int;
	public static inline var TIEMPO_INMUNIDAD:Int = 200;
	
	public static var BOUNCE_PLAYER:Rectangle =  new Rectangle(0, 0, 45, 75);	
	
	public function new(playerId:Int){
		super();
		
		this.id = playerId;
		
		sogas=new Array<Soga>();
		this.sogaIniciar();
		
		playerQuieto = new Bitmap ( this.getPlayerAsset("") );
		addChild(playerQuieto);
		playerQuieto.visible = true;
		
		playerDisparo = new Bitmap ( this.getPlayerAsset("disparo") );
		addChild(playerDisparo);
		playerDisparo.visible = false;
		
		this.playerDer = new ContAnimation( getPlayerAsset("der") , 4, 1);
		addChild(playerDer);
		playerDer.visible = false;
		
		this.playerIzq = new ContAnimation( getPlayerAsset("izq") , 4, 1);
		addChild(playerIzq);
		playerIzq.visible = false;
		
		this.playerShield = new ContAnimation( getPlayerAsset("shield") , 3, 1);
		addChild(playerShield);
		playerShield.visible = false;
		
		this.boundingBox = BOUNCE_PLAYER;
		
		this.reset();
	}
	
	public function init() {
		GameScene.screen.addChild(this);
		GameScene.screen.hijos.push(this);
		
		this.reset();
		setAlive(true);
	}
	public function end() {
		GameScene.screen.removeChild(this);
		GameScene.screen.hijos.remove(this);
		
		this.reset();
		setAlive(false);
	}
	
	// Segun la organizacion de los archivos: images/player1der.png = id + nom + .png
	private function getPlayerAsset(nom:String) {
		return Assets.getBitmapData("images/player" + id + nom + ".png");
	}
	
	public function getCentroX():Float {
		return x + boundingBox.width / 2;
	}
	
	public function getCentroY():Float {
		return y + boundingBox.height / 2;
	}
	
	public function reset() { // Season Reset!
		this.velocidad_movimiento = VX_INICIAL;
		this.velocidad_saltoX = VX_SALTO_INICIAL;
		this.velocidad_saltoY = VY_SALTO_INICIAL;
		
		this.resetSpeed();		
		this.setWeapon(0);
		this.setShield(false);
		
		this.lives = 3;
		GameScene.hud.mostrarVidas(this);
		
		resetLevel();
	}
	
	public function resetLevel() {
		this.inmunidad = 0;
		this.alpha = 1;
		this.visible = true;
		this.pausa = 0;
		
		this.sogasUnset();
		this.resetMunicion();
		
		this.aterrizar(); // Por si estaba en el aire
		this.noAction(); // Por si se estaba moviendo
	}
	
	// Soga	
	private function sogaIniciar() {
		var soga: Soga;
		var i:Int;
		for ( i in 0...2 ) { // Max
			//trace(i);
			soga = new Soga(this);
			sogas.push(soga);
		}
	}
	
	public function sogasSetEstado(t:Int) { // acceso a cambiar el tipo: estacion hielo/fuego
		for ( soga in this.sogas )
			soga.setEstado(t);
	}
	
	public function sogasUnset() {
		for ( soga in this.sogas )
			soga.unset();
	}
	
	/*public function isDisparando():Bool {
		return false;
	}*/
	
	// Disparo 
	public function iniciarDisparo() {
		// Verificar que tenga municion
		
		if ( municion_disp < 1 )
			return;
		
		PangRevenge.audioManager.justPlay(Sonido.DISPARO);
		this.disparando = DISPARO_COOLDONW;
		municion_disp--;
		
		// Buscar soga disponible
		for ( soga in sogas) {
			if ( soga.disponible() ) {
				soga.disparar(x+16);
				return;
			}
		}
	}
	
	public function finalizarDisparo() {
		municion_disp++;
	}
	
	//
	private function getAction(action:String):Bool {
		return PangRevenge.inputManager.keyCodePressed(InputManager.config.get("P" + id + "_" + action));
	}
	
	// Salto
	public function isInAir():Bool {
		return this.saltando;
	}
	private function setSalto(dir:String) {
		this.saltandoDir = dir;
		this.saltandoVy = this.velocidad_saltoY; // Seteo la velocidad del salto.
		this.saltando = true;
	}
	private function aterrizar() {
		this.saltandoDir = "";
		this.saltando = false;
		this.saltandoVy = 0;
		y = Screen.SCREEN_HEIGHT-boundingBox.height;
		//trace(this);
	}
	
	// Acciones
	private function actionCaminar(dir:String , time:Float) {
		var v = time * 250 * velocidad_movimiento * speed;
		
		if ( dir == "L" ) {
			x -= v;
			playerIzq.visible = true;
			playerDer.visible = false;
			playerQuieto.visible = false;
			playerIzq.updateLogic(time);
		} else {
			x += v;
			playerDer.visible = true;
			playerIzq.visible = false;
			playerQuieto.visible = false;
			playerDer.updateLogic(time);
		}
	}
	
	private function actionSaltar(time:Float) {
		
		var Vx = time * velocidad_saltoX;
		if ( saltandoDir == "L" )
			this.actionCaminar("L",Vx);
		else if ( saltandoDir == "R" )
			this.actionCaminar("R",Vx);
		
		y = y + time * 15 * saltandoVy;
		saltandoVy += 3; // Gravedad
		
		if ( y > (Screen.SCREEN_HEIGHT-boundingBox.height) )
			this.aterrizar();
		
	}
	
	private function noAction() {
		playerQuieto.visible = true;
		playerDisparo.visible = false;
		playerDer.visible = false;
		playerIzq.visible = false;
	}
	
	private function actionDisparar() {		
		disparando--;
		playerDisparo.visible = true;
		playerQuieto.visible = false;
		playerDer.visible = false;
		playerIzq.visible = false;
	}
	
	private function actionDamage() {
		if ( lives > 0 ) {
			lives--;
			inmunidad = TIEMPO_INMUNIDAD;
			GameScene.hud.mostrarVidas(this);
			// Animación?
		} else {
			actionMuerte();
		}
	}
	
	public function actionMuerte() {
		// Animación de muerte
		
		//Callback le dice a Screen que murió.
	}
	
	public function colision(b:Ball) {
		if (inmunidad > 0) {
			
		}else if (this.playerShield.visible) {
			PangRevenge.audioManager.justPlay(Sonido.GOLPE);
			inmunidad = TIEMPO_INMUNIDAD;
			setShield(false);
			if (b != null)
				b.reventar();
		}else{
			PangRevenge.audioManager.justPlay(Sonido.GOLPE);
			if (b != null)
				b.reventar();			
			actionDamage();
		}		
	}
	
	public function setAlive(v:Bool) {
		alive = v;
	}
	
	override function updateLogic(time:Float) {
		super.updateLogic(time);
		
		// Mover jugador
		
		if ( isInAir() || ( getAction("JUMP") && pausa <= 0 ) )
		{
			// Está en el aire o a punto de saltar
			if ( ! isInAir() ) {
				var dirSalto:String;
				if ( getAction("LEFT") ) dirSalto = "L";
				else if ( getAction("RIGHT") ) dirSalto = "R";
				else dirSalto = "";
					
				this.setSalto(dirSalto);
			}
			this.actionSaltar(time);
		} else {
			
			// Está en el piso
			
			if ( pausa > 0 ) {
				// Está paralizado
				pausa -= time;
				return;
			}			
			
			if (PangRevenge.inputManager.keyCodePressed(InputManager.config.get("P" + id + "_FIRE"))) {
				
				if ( !disparado_antiRebote )
					iniciarDisparo();
					
				disparado_antiRebote = true;
			}else {
				disparado_antiRebote = false;
			}
			
			if ( disparando <= 0 ) {
				disparando = 0;
				playerDisparo.visible = false;
				
				// No está ni disparando ni saltando
				if ( getAction("LEFT") ) {
					this.actionCaminar("L",time);
				}else if ( getAction("RIGHT") ) {
					this.actionCaminar("R",time);
				}else {
					this.noAction();
				}
			
			}else {
				this.actionDisparar();				
			}
		
		}
		
		// Límites de pantalla
		if (x < 0) x = 0;
		else if (x + boundingBox.width > Screen.SCREEN_WIDTH) x = Screen.SCREEN_WIDTH - boundingBox.width;
		
		// Inmunidad
		if (inmunidad > 0) {
			
			// Hacer parpadeo
			this.inmunidad--;
			this.alpha = (20 - inmunidad % 20) / 20;
			
			if (inmunidad < 0) {				
				inmunidad = 0;
			}
		}

	}
	
// Efectos del Power UP

	// PowerUp/Down Municion
	public function incrementarMunicion(i:Int) {
		var r = municion_max + i;
		if ( r > 2 || r < 1 ) return;
		municion_max = r;
		municion_disp = municion_disp + i;
		
		if ( r == 2 )
			GameScene.hud.setElemento(Hud.DOBLE_TIRO , this.id);
		else
			GameScene.hud.unsetElemento(Hud.DOBLE_TIRO , this.id);
	}
	// Reset
	public function resetMunicion() {
		this.municion_disp = MUNICION_INICIAL;
		this.municion_max = MUNICION_INICIAL;
		GameScene.hud.unsetElemento(Hud.DOBLE_TIRO , this.id);
	}
	
	// PowerUp Escudo
	public function setShield(s:Bool) {
		if ( s ) {
			playerShield.visible = true;
			hijos.push(playerShield);
			GameScene.hud.setElemento(Hud.ESCUDO , this.id);
		} else {
			playerShield.visible = false;
			hijos.remove(playerShield);
			GameScene.hud.unsetElemento(Hud.ESCUDO , this.id);
		}
	}
	
	// PowerDown SetWeapon
	public function setWeapon(t:Int) { // 0 = Flecha - 1 = Gancho
		if ( t == 0 ) GameScene.hud.unsetElemento(Hud.GANCHO , this.id);
		else GameScene.hud.setElemento(Hud.GANCHO , this.id);
		
		for ( soga in this.sogas )
			soga.setType(t);
	}
	
	// PowerDown Pause
	public function setPausa(t:Float) {
		this.pausa = t;
	}
	
	// PowerUp/Down Speed
	public function incrementarSpeed(fast:Bool) {
		if ( fast ) {
			if ( this.speed == 1 || this.speed == 1.5 ) { // Maxima
				this.speed = 1.5;
				GameScene.hud.setElemento(Hud.SPEED , this.id);
				return;
			}
			else this.speed = 1;
		} else {
			if ( this.speed == 1 ) this.speed = 0.5; // Minima
			else if ( this.speed == 1.5 ) this.speed = 1;
		}
		//GameScene.hud.unsetElemento( Hud.SPEED , this.id);
	}
	// Reset
	public function resetSpeed() {
		speed = 1;
		GameScene.hud.unsetElemento(Hud.SPEED , this.id);
	}
	
	
	
	
}