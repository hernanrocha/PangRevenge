package engine;

/**
 * ...
 * @author fbricker
 */
class Scene extends GameElement {
	
	public var sm:SceneManager;
	
	public function new (sm:SceneManager) {
		super();
		this.sm = sm;
	}
	
	public function init(){
	}
	
	public function end(onComplete:Dynamic){
		onComplete();
	}

}
