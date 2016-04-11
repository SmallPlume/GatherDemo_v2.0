package com.util;

import java.text.NumberFormat;
import java.util.HashMap;

/**
 * <p>
 * 货币转大写
 * </p>
 * <p>
 * create: 2011-7-5 下午05:29:29
 * </p>
 * 
 * @author 张良[jimsonhappy@126.com]
 * @version 1.0
 */
public class MoneyUtils {
	
	private static HashMap<String, String> NUMBER_MAP = new HashMap<String, String>();

	private static HashMap<String, String> MONEY_MAP = new HashMap<String, String>();

	private static NumberFormat FORMAT = NumberFormat.getInstance();

	static {
		FORMAT.setMaximumFractionDigits(4);
		FORMAT.setMinimumFractionDigits(2);
		FORMAT.setGroupingUsed(false);
		NUMBER_MAP.put("0", "零");
		NUMBER_MAP.put("1", "壹");
		NUMBER_MAP.put("2", "贰");
		NUMBER_MAP.put("3", "叁");
		NUMBER_MAP.put("4", "肆");
		NUMBER_MAP.put("5", "伍");
		NUMBER_MAP.put("6", "陆");
		NUMBER_MAP.put("7", "柒");
		NUMBER_MAP.put("8", "捌");
		NUMBER_MAP.put("9", "玖");
		NUMBER_MAP.put(".", ".");
		MONEY_MAP.put("1", "拾");
		MONEY_MAP.put("2", "佰");
		MONEY_MAP.put("3", "仟");
		MONEY_MAP.put("4", "万");
		MONEY_MAP.put("5", "拾");
		MONEY_MAP.put("6", "佰");
		MONEY_MAP.put("7", "仟");
		MONEY_MAP.put("8", "亿");
	}

	public static String format(String number) {
		checkPrecision(number);
		String result = convertToChineseNumber(number);
		result = addUnitsToChineseMoneyString(result);
		return result;
	}

	public static String format(double number) {
		return format(FORMAT.format(number));
	}

	public static String format(int number) {
		return format(FORMAT.format(number));
	}

	public static String format(long number) {
		return format(FORMAT.format(number));
	}

	public static String format(Number number) {
		return format(FORMAT.format(number));
	}

	private static String convertToChineseNumber(String number) {
		if (number == null) {
			return "";
		}
		String result;
		StringBuffer cMoneyStringBuffer = new StringBuffer();
		for (int i = 0; i < number.length(); i++) {
			cMoneyStringBuffer
					.append(NUMBER_MAP.get(number.substring(i, i + 1)));
		}
		// 拾佰仟万亿等都是汉字里面才有的单位，加上它们
		int indexOfDot = cMoneyStringBuffer.indexOf(".");
		int moneyPatternCursor = 1;
		for (int i = indexOfDot - 1; i > 0; i--) {
			cMoneyStringBuffer
					.insert(i, MONEY_MAP.get("" + moneyPatternCursor));
			moneyPatternCursor = moneyPatternCursor == 8 ? 1
					: moneyPatternCursor + 1;
		}
		String fractionPart = cMoneyStringBuffer.substring(cMoneyStringBuffer
				.indexOf("."));
		cMoneyStringBuffer.delete(cMoneyStringBuffer.indexOf("."),
				cMoneyStringBuffer.length());
		while (cMoneyStringBuffer.indexOf("零拾") != -1) {
			cMoneyStringBuffer.replace(cMoneyStringBuffer.indexOf("零拾"),
					cMoneyStringBuffer.indexOf("零拾") + 2, "零");
		}
		while (cMoneyStringBuffer.indexOf("零佰") != -1) {
			cMoneyStringBuffer.replace(cMoneyStringBuffer.indexOf("零佰"),
					cMoneyStringBuffer.indexOf("零佰") + 2, "零");
		}
		while (cMoneyStringBuffer.indexOf("零仟") != -1) {
			cMoneyStringBuffer.replace(cMoneyStringBuffer.indexOf("零仟"),
					cMoneyStringBuffer.indexOf("零仟") + 2, "零");
		}
		while (cMoneyStringBuffer.indexOf("零万") != -1) {
			cMoneyStringBuffer.replace(cMoneyStringBuffer.indexOf("零万"),
					cMoneyStringBuffer.indexOf("零万") + 2, "万");
		}
		while (cMoneyStringBuffer.indexOf("零亿") != -1) {
			cMoneyStringBuffer.replace(cMoneyStringBuffer.indexOf("零亿"),
					cMoneyStringBuffer.indexOf("零亿") + 2, "亿");
		}
		while (cMoneyStringBuffer.indexOf("零零") != -1) {
			cMoneyStringBuffer.replace(cMoneyStringBuffer.indexOf("零零"),
					cMoneyStringBuffer.indexOf("零零") + 2, "零");
		}
		if (cMoneyStringBuffer.lastIndexOf("零") == cMoneyStringBuffer.length() - 1)
			cMoneyStringBuffer.delete(cMoneyStringBuffer.length() - 1,
					cMoneyStringBuffer.length());
		cMoneyStringBuffer.append(fractionPart);
		result = cMoneyStringBuffer.toString();
		return result;
	}

	private static String addUnitsToChineseMoneyString(String number) {
		String result;
		StringBuffer cMoneyStringBuffer = new StringBuffer(number);
		int indexOfDot = cMoneyStringBuffer.indexOf(".");
		cMoneyStringBuffer.replace(indexOfDot, indexOfDot + 1, "元");
		cMoneyStringBuffer.insert(cMoneyStringBuffer.length() - 1, "角");
		cMoneyStringBuffer.insert(cMoneyStringBuffer.length(), "分");
		if (cMoneyStringBuffer.indexOf("零角零分") != -1) // 没有零头，加整
			cMoneyStringBuffer.replace(cMoneyStringBuffer.indexOf("零角零分"),
					cMoneyStringBuffer.length(), "整");
		else if (cMoneyStringBuffer.indexOf("零分") != -1) // 没有零分，加整
			cMoneyStringBuffer.replace(cMoneyStringBuffer.indexOf("零分"),
					cMoneyStringBuffer.length(), "整");
		else {
			if (cMoneyStringBuffer.indexOf("零角") != -1)
				cMoneyStringBuffer.delete(cMoneyStringBuffer.indexOf("零角"),
						cMoneyStringBuffer.indexOf("零角") + 2);
			// tmpBuffer.append("整");
		}
		result = cMoneyStringBuffer.toString();
		return result;
	}

	private static void checkPrecision(String moneyStr) {
		int fractionDigits = moneyStr.length() - moneyStr.indexOf(".") - 1;
		if (fractionDigits > 2) {
			throw new RuntimeException("金额" + moneyStr + "的小数位多于两位。"); // 精度不能比分低
		}
	}

}
