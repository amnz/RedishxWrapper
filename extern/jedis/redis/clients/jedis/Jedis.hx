package redis.clients.jedis ;
import java.NativeArray;

/**
 * ...
 * 
 * @author amnz
 */
@:native("redis.clients.jedis.Jedis")
extern class Jedis {
	
	// expires
	
	public function persist(key:String):Null<java.lang.Long>;
	
	public function ttl(key:String):Null<java.lang.Long>;
	
	public function expire(key:String, seconds:Int):Null<java.lang.Long>;
	
	public function expireAt(key:String, unixTime:java.lang.Long):Null<java.lang.Long>;
	
	public function pttl(key:String):Null<java.lang.Long>;
	
	public function pexpire(key:String, milliseconds:java.lang.Long):Null<java.lang.Long>;
	
	public function pexpireAt(key:String, millisecondsTimestamp:java.lang.Long):Null<java.lang.Long>;
	
	// string
	
	public function get(key:String):String;

	public function set(key:String, value:String):String;
	
	public function keys(pattern:String):java.util.Set<String>;
	
	public function del(key:String):Null<java.lang.Long>;
	
	
	// hash
	
	public function hset(key:String, field:String, value:String):Null<java.lang.Long>;
	
	public function hmset(key:String, hash:java.util.Map<String, String>):String;
	
	public function hget(key:String, field:String):String;
	
	public function hmget(key:String, fields:NativeArray<String>):java.util.List<String>;
	
	
	//zset
	
	@:overload(function(key:String, scoreMembers:java.util.Map<String, java.lang.Double>):Null<Float>{})
	public function zadd(key:String, score:Float, member:String):Null<Float>;
	
	public function zrem(key:String, members:NativeArray<String>):Null<Float>;
	
	public function zcard(key:String):Null<java.lang.Long>;
	
	public function zincrby(key:String, score:Float, member:String):Null<Float>;
	
	public function zcount(key:String, min:Float, max:Float):Null<java.lang.Long>;
	
	public function zrank(key:String, member:String):Null<java.lang.Long>;

	public function zscore(key:String, member:String):Null<Float>;
	
	public function zrange(key:String, start:java.lang.Long, end:java.lang.Long):java.util.Set<String>;

}