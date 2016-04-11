package com.modules.base.orm;

import java.util.logging.Level;
import java.util.logging.Logger;

public class GlobalException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;

	private static final Logger logger = Logger.getLogger(GlobalException.class.getName());

	/** 异常代码 **/
	public int code;

	/** 异常数据 **/
	public Object data;

	public GlobalException(int code) {
		super();
		this.code = code;
	}

	public GlobalException(String message) {
		super(message);
		this.code = -1;
	}

	public GlobalException(Throwable cause) {
		super(cause);
		this.code = -1;
	}

	public GlobalException(int code, String message) {
		super(message);
		this.code = code;
	}

	public GlobalException(int code, Throwable cause) {
		super(cause);
		this.code = code;
	}

	public GlobalException(int code, String message, Throwable cause) {
		super(message, cause);
		this.code = code;
	}

	public GlobalException(Throwable cause, Object data) {
		super(cause);
		this.code = -1;
		this.data = data;
	}

	public GlobalException(int code, String message, Object data) {
		super(message);
		this.code = code;
		this.data = data;
	}

	/**
	 * 解析异常数据
	 * 
	 * @param t
	 * @return 异常数据
	 */
	public static Data parse(Throwable t) {
		Data data = new Data();
		data.code = -1;
		data.msg = t.getMessage();
		data.type = 0;
		if (t instanceof GlobalException) {
			GlobalException ex = (GlobalException) t;
			data.type = 3;
			data.code = ex.code;
			data.msg = ex.getMessage();
			return data;
		}
		logger.log(Level.INFO, "系统业务处理出错", t);
		if (t instanceof NullPointerException) {
			data.msg = "系统错误：存在空引用的数据。";
			return data;
		}
		data.msg = "系统出错，原因未知，请与管理员联系！";
		return data;
	}

	/**
	 * <p>
	 * 异常数据，错误类型分为4类：
	 * </p>
	 * <ul>
	 * <li>0-系统错误</li>
	 * <li>1-权限错误</li>
	 * <li>2-数据错误</li>
	 * <li>3-操作错误</li>
	 * </ul>
	 * <div>create time: 2013-3-14 下午11:05:53</div>
	 * 
	 * @author 许德建（xudejian@126.com）
	 */
	public static class Data {
		/**
		 * 错误代码
		 */
		public int code;

		/**
		 * 错误信息
		 */
		public String msg;

		/**
		 * 错误类型，0-系统错误；1-权限错误；2-数据错误；3-操作错误
		 */
		public int type;
	}

}
