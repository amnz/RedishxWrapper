package redishx;

/**
 * ...
 * 
 * @author amnz
 */
@:native("redishx.RedisHXUtil")
extern class RedisHXUtil {

	public static function invokeMethod(pool:RedishxPool, target:Dynamic, method:String, args:Array<Dynamic>):Dynamic;

}
