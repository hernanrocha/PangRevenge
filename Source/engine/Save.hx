package engine;

import flash.net.SharedObject;

class Save {
	
	public var lastLevel(default,null):Int;
	private static var instance:Save=null;
	private var so:SharedObject;
	
	public static function getInstance():Save{
		if(instance==null) instance=new Save();
		return instance;
	}
	
	private function new () {
		so=SharedObject.getLocal('lastLevel');
		if (so != null && so.data != null && so.data.lastLevel != null) {
			lastLevel = so.data.lastLevel;
		}else{
			lastLevel = 0;
		}
	}
	
	public function setLevel(p:Int) {
		this.lastLevel = p;
		try{
			so.data.lastLevel = this.lastLevel;
			so.flush();
		}catch(e:Dynamic){
		}
	}

}