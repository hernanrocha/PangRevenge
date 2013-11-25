package engine;

import flash.display.Sprite;
import flash.display.Stage;

class SceneManager extends Sprite{
	
	private var scenes:Map<String,Scene>;
	private var currentScene:Scene;
	private var mainStage:Stage;
	
	public function new (mainStage:Stage) {
		super();
		this.mainStage=mainStage;
		currentScene=null;
		scenes=new Map<String,Scene>();		
	}
	
	public function switchScene(name:String){
		var s=scenes.get(name);
		if(this.currentScene!=null){
			this.currentScene.end(function(){setScene(s);});
			return;
		}
		setScene(s);
	}
	
	private function setScene(s:Scene){
		if(currentScene!=null) this.removeChild(currentScene);
		currentScene=s;
		this.addChild(s);
		currentScene.init();
		mainStage.focus=s;
	}
	
	public function suscribeScene(name:String,scene:Scene){
		scenes.set(name,scene);
	}
	
	public function updateLogic(time){
		if(this.currentScene!=null){
			this.currentScene.updateLogic(time);
		}
	}

}
