package redishx;

@:native("redishx.RedishxPool")
extern interface RedishxPool {

	public function getResource():Redishx;
	
	public function returnResource(resource:Redishx):Void;

}