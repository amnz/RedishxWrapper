package redishx.impl ;

import java.NativeArray;
import java.lang.Long;
import redis.clients.jedis.Jedis;

/**
 * ...
 * 
 * @author amnz
 */
class JedisWrapper implements Redishx {

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 * ...
	 *
	 */
	public function new(jedis:Jedis) {
		this.jedis = jedis;
	}

	// 内部フィールド定義 ///////////////////////////////////////////////////////////////
	//                                                                          Fields //
	/////////////////////////////////////////////////////////////////////////////////////

	public var jedis(default, null):Jedis;

	// インスタンスメソッド /////////////////////////////////////////////////////////////
	//                                                                Instance Methods //
	/////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * 
	 * @param	key
	 * @return
	 */
	public function persist(key:String):Float {
		return cast(jedis.persist(key));
	}
	
	/**
	 * 
	 * @param	key
	 * @return
	 */
	public function ttl(key:String):Float {
		return cast(jedis.ttl(key));
	}
	
	/**
	 * 
	 * @param	key
	 * @param	seconds
	 * @return
	 */
	public function expire(key:String, seconds:Int):Float {
		return cast(jedis.expire(key, seconds));
	}
	
	/**
	 * 
	 * @param	key
	 * @param	unixTime
	 * @return
	 */
	public function expireAt(key:String, unixTime:Float):Float {
		return cast(jedis.expireAt(key, cast(Long.valueOf("" + unixTime))));
	}
	
	/**
	 * 
	 * @param	key
	 * @return
	 */
	public function pttl(key:String):Float {
		return cast(jedis.pttl(key));
	}
	
	/**
	 * 
	 * @param	key
	 * @param	milliseconds
	 * @return
	 */
	public function pexpire(key:String, milliseconds:Float):Float {
		return cast(jedis.pexpire(key, cast(Long.valueOf("" + milliseconds))));
	}
	
	/**
	 * 
	 * @param	key
	 * @param	millisecondsTimestamp
	 * @return
	 */
	public function pexpireAt(key:String, millisecondsTimestamp:Float):Float {
		return cast(jedis.pexpireAt(key, cast(Long.valueOf("" + millisecondsTimestamp))));
	}

	// インスタンスメソッド /////////////////////////////////////////////////////////////
	//                                                                Instance Methods //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 * 
	 * @param	key
	 * @return
	 */
	public function get(key:String):String {
		return jedis.get(key);
	}

	/**
	 * 
	 * @param	key
	 * @param	value
	 * @return
	 */
	public function set(key:String, value:String):String {
		return jedis.set(key, value);
	}
	
	/**
	 * 
	 * @param	pattern
	 * @return
	 */
	public function keys(pattern:String):Array<String> {
		var keys:java.util.Set<String> = jedis.keys(pattern);
		var result:Array<String> = new Array<String>();
		for (key in keys) {
			result.push(key);
		}
		
		return result;
	}
	
	/**
	 * 
	 * @param	key
	 * @return
	 */
	public function del(key:String):Float {
		return cast(jedis.del(key));
	}

	// インスタンスメソッド /////////////////////////////////////////////////////////////
	//                                                                Instance Methods //
	/////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * 
	 * @param	key
	 * @param	field
	 * @param	value
	 * @return
	 */
	public function hset(key:String, field:String, value:String):Float {
		return cast(jedis.hset(key, field, value));
	}
	
	/**
	 * 
	 * @param	key
	 * @param	hash
	 * @param	String>
	 * @return
	 */
	public function hmset(key:String, hash:Map<String, String>):String {
		var keys = hash.keys();
		var jMap = new java.util.HashMap<String, String>();
		
		for (k in keys) { jMap.put(k, hash.get(k)); }
		return jedis.hmset(key, jMap);
	}
	
	/**
	 * 
	 * @param	key
	 * @param	field
	 * @return
	 */
	public function hget(key:String, field:String):String {
		return jedis.hget(key, field);
	}
	
	/**
	 * 
	 * @param	key
	 * @param	fields
	 * @return
	 */
	public function hmget(key:String, fields:Array<String>):Array<String> {
		var ff = new NativeArray<String>(fields.length);
		for (i in 0...fields.length) { ff[i] = fields[i]; }
		var values:java.util.List<String> = jedis.hmget(key, ff);
		
		var result = new Array<String>();
		for (i in 0...values.size()) { result[i] = values.get(i); }
		
		return result;
	}

	// インスタンスメソッド /////////////////////////////////////////////////////////////
	//                                                                Instance Methods //
	/////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * 
	 * @param	key
	 * @param	score
	 * @param	member
	 * @return
	 */
	public function zadd(key:String, score:Float, member:String):Float {
		return jedis.zadd(key, score, member);
	}
	
	/**
	 * 
	 * @param	key
	 * @param	scoreMembers
	 * @return
	 */
	public function zaddBatch(key:String, scoreMembers:Map<String, Float>):Float {
		var keys = scoreMembers.keys();
		var jMap = new java.util.HashMap<String, java.lang.Double>();
		
		for (k in keys) { jMap.put(k, cast(scoreMembers.get(k), java.lang.Double)); }
		return cast(jedis.zadd(key, jMap));
	}
	
	/**
	 * 
	 * @param	key
	 * @param	members
	 * @return
	 */
	public function zrem(key:String, members:Array<String>):Float {
		var m = new NativeArray<String>(members.length);
		for (i in 0...members.length) { m[i] = members[i]; }
		
		return jedis.zrem(key, m);
	}
	
	/**
	 * 
	 * @param	key
	 * @return
	 */
	public function zcard(key:String):Float {
		return cast(jedis.zcard(key));
	}
	
	/**
	 * 
	 * @param	key
	 * @param	score
	 * @param	member
	 * @return
	 */
	public function zincrby(key:String, score:Float, member:String):Float {
		return cast(jedis.zincrby(key, score, member));
	}
	
	/**
	 * 
	 * @param	String key
	 * @param	min
	 * @param	max
	 * @return
	 */
	public function zcount(key:String, min:Float, max:Float):Float {
		return cast(jedis.zcount(key, min, max));
	}
	
	/**
	 * 
	 * @param	key
	 * @param	member
	 * @return
	 */
	public function zrank(key:String, member:String):Float {
		return cast(jedis.zrank(key, member));
	}

	/**
	 * 
	 * @param	key
	 * @param	member
	 * @return
	 */
	public function zscore(key:String, member:String):Float {
		return cast(jedis.zscore(key, member));
	}
	
	/**
	 * 
	 * @param	key
	 * @param	start
	 * @param	end
	 * @return
	 */
	public function zrange(key:String, start:Float, end:Float):Array<String> {
		var range:java.util.Set<String> = jedis.zrange(key, cast(Long.valueOf("" + start)), cast(Long.valueOf("" + end)));
		var result:Array<String> = new Array<String>();
		for (key in range) {
			result.push(key);
		}
		
		return result;
	}

}