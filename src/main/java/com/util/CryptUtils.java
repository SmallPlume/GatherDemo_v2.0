package com.util;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;


/**
 * <p>
 * 加密工具类
 * </p>
 * 
 * @author 许德建【xudejian_dev@126.com，QQ:66018777】
 * 
 */
public class CryptUtils {
	
	/**
	 * <p>
	 * 加密密鈅
	 * </p>
	 */
	private static final String DES_CRYPT_KEY = "XuAndLuo";

	/**
	 * <p>
	 * 加密方式
	 * </p>
	 */
	private static final String ALGORITHM = "DES";

	/**
	 * 默认密码
	 */
	private static final String PASSWORD_DEFAULT = "88888888";

	// /**
	// * <p>
	// * 加密，若password为空则默认{@link #PASSWORD_DEFAULT}
	// * </p>
	// *
	// * @param password
	// * @return String
	// */
	// public static String cryptPswd(String password) {
	// if (password == null || password.isEmpty()) {
	// password = PASSWORD_DEFAULT;
	// }
	// try {
	// SecretKey deskey = new SecretKeySpec(DES_CRYPT_KEY.getBytes(),
	// ALGORITHM);
	// Cipher cipher = Cipher.getInstance(ALGORITHM);
	// cipher.init(Cipher.ENCRYPT_MODE, deskey, new
	// java.security.SecureRandom());
	// byte[] encPswd = cipher.doFinal(password.getBytes());
	// return new String(Base64.encode(encPswd));
	// } catch (Exception ex) {
	// ex.printStackTrace();
	// }
	// return password;
	// }
	//
	// /**
	// * <p>
	// * 解密，若为空则返回默认密码{@link #PASSWORD_DEFAULT}
	// * </p>
	// *
	// * @param password
	// * @return String
	// */
	// public static String decryptPswd(String password) {
	// if (password == null || password.isEmpty()) {
	// password = PASSWORD_DEFAULT;
	// }
	// try {
	// SecretKey deskey = new SecretKeySpec(DES_CRYPT_KEY.getBytes(),
	// ALGORITHM);
	// Cipher cipher = Cipher.getInstance(ALGORITHM);
	// cipher.init(Cipher.DECRYPT_MODE, deskey);
	// byte[] encPswd = cipher.doFinal(Base64.decode(password.toCharArray()));
	// return new String(encPswd).trim();
	// } catch (Exception ex) {
	// }
	// return password;
	// }

	/**
	 * 
	 * <p>
	 * 检验密码是否匹配
	 * </p>
	 * <p>
	 * author 许德建【Email：xudejian_dev@126.com；QQ：66018777】
	 * </p>
	 * 
	 * @param source
	 *            明码
	 * @param sign
	 *            密码
	 * @return boolean
	 */
	public static boolean match(String source, String sign) {
		if (source == null || sign == null) {
			return false;
		}
		return source.equals(decode(sign));
	}

	/**
	 * <p>
	 * 编码加密，若password为空则默认{@link #PASSWORD_DEFAULT}
	 * </p>
	 * 
	 * @param password
	 * @return String
	 */
	public static String encode(String password) {
		if (password == null || password.isEmpty()) {
			password = PASSWORD_DEFAULT;
		}
		try {
			byte[] key = DES_CRYPT_KEY.getBytes();
			Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
			DESKeySpec desKeySpec = new DESKeySpec(key);
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
			SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
			IvParameterSpec iv = new IvParameterSpec(key);
			cipher.init(Cipher.ENCRYPT_MODE, secretKey, iv);
			byte[] encPswd = cipher.doFinal(password.getBytes());
			return StringUtils.bytesToHex(encPswd);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return password;
	}

	/**
	 * <p>
	 * 解码解码
	 * </p>
	 * <p>
	 * author 许德建【xudejian_dev@126.com，QQ:66018777】
	 * </p>
	 * 
	 * @param password
	 * @return String
	 */
	public static String decode(String password) {
		if (password == null || password.isEmpty()) {
			password = PASSWORD_DEFAULT;
		}
		try {
			byte[] key = DES_CRYPT_KEY.getBytes();
			byte[] bytesrc = StringUtils.hexToBytes(password);
			Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
			DESKeySpec desKeySpec = new DESKeySpec(key);
			SecretKeyFactory keyFactory = SecretKeyFactory
					.getInstance(ALGORITHM);
			SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
			IvParameterSpec iv = new IvParameterSpec(key);
			cipher.init(Cipher.DECRYPT_MODE, secretKey, iv);
			byte[] retByte = cipher.doFinal(bytesrc);
			return new String(retByte).trim();
		} catch (Exception ex) {
		}
		return password;
	}

	public static void main(String[] args) {
		System.out.println(encode("123"));
	}

}
