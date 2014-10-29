package redishx;

/**
 * ...
 * 
 * @author amnz
 */
class RedisHXUtil {
	
	/**
	 * 
	 * @param	pool
	 * @param	target
	 * @param	method
	 * @param	args
	 * @return
	 */
	public static function invokeMethod(pool:RedishxPool, target:Dynamic, method:String, args:Array<Dynamic>):Dynamic {
		var redis:Redishx = pool.getResource();
		args.push(redis);
		
		var result:Dynamic = null;
		var ex:Dynamic = null;
		try {
			
			result = Reflect.callMethod(target, Reflect.field(target, method), args);
			
		}catch (exception:Dynamic) {
			ex = exception;
		}
		
		pool.returnResource(redis);
		
		if (ex != null) { throw ex; }
		return result;
	}

}