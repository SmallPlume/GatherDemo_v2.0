package com.modules.base.orm;


public class Result {

	/**
	 * 结果代码
	 */
	public int code;

	/**
	 * 结果信息
	 */
	public String msg;

	/**
	 * 结果数据
	 */
	public Object data;

	/**
	 * 错误信息
	 */
	public String error;

	/**
	 * 返回结果
	 * 
	 * @param code
	 * @param msg
	 */
	public Result(int code, String msg) {
		super();
		this.code = code;
		this.msg = msg;
	}

	/**
	 * 返回结果附带数据
	 * 
	 * @param code
	 * @param msg
	 * @param data
	 */
	public Result(int code, String msg, Object data) {
		super();
		this.code = code;
		this.msg = msg;
		this.data = data;
	}

	/**
	 * 返回成功
	 * 
	 * @return 结果对象
	 */
	public static Result ok() {
		return new Result(1, null);
	}

	/**
	 * 返回成功
	 * 
	 * @param msg
	 * @return 结果对象
	 */
	public static Result ok(String msg) {
		return new Result(1, msg);
	}

	/**
	 * 返回数据
	 * 
	 * @param data
	 * @return 结果对象
	 */
	public static Result data(Object data) {
		return new Result(data != null ? 1 : -1, null, data);
	}

	/**
	 * 返回错误
	 * 
	 * @param msg
	 * @return 结果对象
	 */
	public static Result error(String msg) {
		return new Result(-1, msg);
	}

	/**
	 * 返回异常
	 * 
	 * @param t
	 * @return 结果对象
	 */
	public static Result exception(Throwable t) {
		Result r = new Result(-1, t.getMessage());
		if (t instanceof GlobalException) {
			GlobalException e = (GlobalException) t;
			r.code = e.code;
			r.data = e.data;
		}
		r.error = t.getMessage();
		return r;
	}

	/**
	 * 返回异常附带错误信息
	 * 
	 * @param msg
	 * @param t
	 * @return 结果对象
	 */
	public static Result exception(String msg, Throwable t) {
		Result r = new Result(-1, msg);
		if (t instanceof GlobalException) {
			GlobalException e = (GlobalException) t;
			r.code = e.code;
			r.data = e.data;
		}
		r.error = t.getMessage();
		return r;
	}
	
}
