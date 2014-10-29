package redishx ;

/**
 * ...
 * 
 * @author amnz
 */
interface Redishx {
	
	// string
	
	public function get(key:String):String;

	public function set(key:String, value:String):String;
	
	public function keys(pattern:String):Array<String>;
	
	public function del(key:String):Float;
	
	
	// hash
	
	public function hset(key:String, field:String, value:String):Float;
	
	public function hmset(key:String, hash:Map<String, String>):String;
	
	public function hget(key:String, field:String):String;
	
	public function hmget(key:String, fields:Array<String>):Array<String>;
	
	
	//zset
	
	public function zadd(key:String, score:Float, member:String):Float;
	
	public function zaddBatch(key:String, scoreMembers:Map<String, Float>):Float;
	
	public function zrem(key:String, members:Array<String>):Float;
	
	public function zcard(key:String):Float;
	
	public function zincrby(key:String, score:Float, member:String):Float;
	
	public function zcount(key:String, min:Float, max:Float):Float;
	
	public function zrank(key:String, member:String):Float;

	public function zscore(key:String, member:String):Float;
	
	public function zrange(key:String, start:Float, end:Float):Array<String>;

}
