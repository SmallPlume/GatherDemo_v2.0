package com.util;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;


/**
 * <p>
 * create: 2011-1-14 上午11:12:41
 * </p>
 * 
 * @author 许德建[xudejian@126.com]
 * @version 1.0
 */
public class NumberUtils {
	
	/**
	 * <p>
	 * 格式化数值
	 * </p>
	 * 
	 * @param num
	 * @return Integer
	 */
	public static Integer formatInt(Float num) {
		return Math.round(num.floatValue());
	}

	/**
	 * 格式化数值
	 * 
	 * @param num
	 * @return BigDecimal
	 */
	public static BigDecimal format(BigDecimal num) {
		return format(num, 2);
	}

	/**
	 * 格式化数值
	 * 
	 * @param num
	 * @param scale
	 * @return BigDecimal
	 */
	public static BigDecimal format(BigDecimal num, int scale) {
		if (num == null) {
			return null;
		}
		if (scale < 0) {
			scale = 0;
		}
		return num.setScale(scale, BigDecimal.ROUND_HALF_UP);
	}

	/**
	 * 格式化数值
	 * 
	 * @param num
	 * @return Double
	 */
	public static Double format(double num) {
		return format(new Double(num));
	}

	/**
	 * 格式化数值
	 * 
	 * @param num
	 * @param scale
	 * @return Double
	 */
	public static Double format(double num, int scale) {
		return format(new Double(num), scale);
	}

	/**
	 * 格式化数值
	 * 
	 * @param num
	 * @return Double
	 */
	public static Double format(Double num) {
		return format(num, 2);
	}

	/**
	 * 格式化数值
	 * 
	 * @param num
	 * @param scale
	 * @return Double
	 */
	public static Double format(Double num, int scale) {
		if (num == null) {
			return null;
		}
		return new BigDecimal(num.doubleValue()).setScale(scale,
				BigDecimal.ROUND_HALF_UP).doubleValue();
	}

	/**
	 * 格式化数值
	 * 
	 * @param num
	 * @param scale
	 * @return Integer
	 */
	public static Integer formatDouToInt(Double num, int scale) {
		if (num == null) {
			return null;
		}
		return new BigDecimal(num.doubleValue()).setScale(scale,
				BigDecimal.ROUND_HALF_UP).intValue();
	}

	/**
	 * 格式化数值
	 * 
	 * @param num
	 * @param scale
	 * @return Long
	 */
	public static Long formatDouToLong(Double num, int scale) {
		if (num == null) {
			return null;
		}
		return new BigDecimal(num.doubleValue()).setScale(scale,
				BigDecimal.ROUND_HALF_UP).longValue();
	}

	/**
	 * 格式化数值
	 * 
	 * @param num
	 * @param scale
	 * @return Float
	 */
	public static Float format(Float num, int scale) {
		if (num == null) {
			return null;
		}
		return new BigDecimal(num.doubleValue()).setScale(scale,
				BigDecimal.ROUND_HALF_UP).floatValue();
	}

	/**
	 * <p>
	 * 格式化数值
	 * </p>
	 * <div>格式化表达式：</div>
	 * <ul>
	 * <li>money：格式化成人民币表示方式</li>
	 * <li>rate：表示为折扣，数值为百分比值，如98则为9.8折</li>
	 * <li>%：表示为百分比，数值为小数，如0.92则为92%</li>
	 * <li>，：数值千位逗号分割，如12345.6则为12,345.6</li>
	 * <ul>
	 * 
	 * @param number
	 * @param format
	 * @return String
	 */
	public static String formatNumber(Number number, String format) {
		if (number == null) {
			return "";
		}
		if (format == null || (format = format.trim()).isEmpty()) {
			String numStr = number.toString();
			if (numStr.indexOf('.') != -1) {
				return numStr.replaceAll("(\\.|)0+$", "");
			}
			return numStr;
		}
		// 人民币大写
		if ("money".equals(format)) {
			return MoneyUtils.format(number);
		}
		// 折扣
		if ("rate".equals(format)) {
			return format(number.doubleValue() / 10, 1).toString().replace(
					"\\.0", "")
					+ "折";
		}
		int scale = -1;
		Boolean isPercent = false;
		Boolean isComma = false;
		BigDecimal num = null;
		if (format.indexOf('%') != -1) {
			num = new BigDecimal(number.doubleValue() * 100);
			format = format.replace("%", "");
			isPercent = true;
		}
		if (format.indexOf(',') != -1) {
			isComma = true;
			format = format.replace(",", "");
		}
		if (num == null) {
			num = new BigDecimal(number.doubleValue());
		}
		String value = null;
		try {
			scale = Integer.parseInt(format);
			value = num.setScale(scale, BigDecimal.ROUND_HALF_UP)
					.toPlainString();
		} catch (NumberFormatException ex) {
			value = num.toPlainString();
			if (value.indexOf('.') != -1) {
				value = value.replaceAll("(\\.|)0+$", "");
			}
		}
		if (isComma) {
			int dot = value.indexOf(".");
			String iv = dot != -1 ? value.substring(0, dot) : value.toString();
			String pv = dot != -1 ? value.substring(dot + 1) : null;
			int commas = iv.length() / 3;
			int f = iv.length() % 3;
			if (f == 0) {
				commas -= 1;
			}
			if (commas != 0) {
				StringBuilder commaValue = new StringBuilder();
				if (f == 0) {
					f = 3;
				}
				commaValue.append(iv.substring(0, f));
				int begin = f;
				for (int i = 0; i < commas; i++) {
					commaValue.append(",");
					commaValue.append(iv.substring(begin, begin + 3));
					begin += 3;
				}
				if (pv != null) {
					commaValue.append(".").append(pv);
				}
				value = commaValue.toString();
			}
		}
		if (isPercent) {
			return value + "%";
		}
		return value;
	}

	/**
	 * <p>
	 * 求和，若元素为null则认为0来计算
	 * </p>
	 * 
	 * @param values
	 * @return double
	 */
	public static int sum(Integer... values) {
		if (values == null || values.length == 0) {
			return 0;
		}
		int sum = 0;
		for (Integer value : values) {
			if (value != null) {
				sum += value;
			}
		}
		return sum;
	}

	/**
	 * <p>
	 * 求和，若元素为null则认为0来计算
	 * </p>
	 * 
	 * @param values
	 * @return double
	 */
	public static long sum(Long... values) {
		if (values == null || values.length == 0) {
			return 0;
		}
		long sum = 0;
		for (Long value : values) {
			if (value != null) {
				sum += value;
			}
		}
		return sum;
	}

	/**
	 * <p>
	 * 求和，若元素为null则认为0来计算
	 * </p>
	 * 
	 * @param values
	 * @return double
	 */
	public static double sum(Double... values) {
		if (values == null || values.length == 0) {
			return 0.0;
		}
		double sum = 0.0;
		for (Double value : values) {
			if (value != null) {
				sum += value;
			}
		}
		return sum;
	}

	/**
	 * <p>
	 * 求平均值，若元素为null则认为0来计算
	 * </p>
	 * 
	 * @param values
	 * @return double
	 */
	public static double avg(Double... values) {
		if (values == null || values.length == 0) {
			return 0.0;
		}
		double sum = 0.0;
		for (Double value : values) {
			if (value != null) {
				sum += value;
			}
		}
		return sum / values.length;
	}

	/**
	 * <p>
	 * 求平均值，若元素为null则不计运算
	 * </p>
	 * 
	 * @param values
	 * @return double
	 */
	public static double avgNotNull(Double... values) {
		if (values == null || values.length == 0) {
			return 0.0;
		}
		double sum = 0.0;
		int length = 0;
		for (Double value : values) {
			if (value != null) {
				sum += value;
				length++;
			}
		}
		if (length == 0) {
			return 0.0;
		}
		return sum / length;
	}

	/**
	 * <p>
	 * 求平均值，若元素为null或者0则不计运算
	 * </p>
	 * 
	 * @param values
	 * @return double
	 */
	public static double avgNotZero(Double... values) {
		if (values == null || values.length == 0) {
			return 0.0;
		}
		double sum = 0.0;
		int length = 0;
		for (Double value : values) {
			if (value != null && value != 0) {
				sum += value;
				length++;
			}
		}
		if (length == 0) {
			return 0.0;
		}
		return sum / length;
	}

	/**
	 * <p>
	 * 解析对象成Double
	 * </p>
	 * 
	 * @param number
	 * @return Double
	 */
	public static Double parseDouble(Object number) {
		if (number == null) {
			return null;
		}
		if (number instanceof String) {
			try {
				number = Double.valueOf((String) number);
			} catch (NumberFormatException e) {
			}
		}
		if (!(number instanceof Number)) {
			return null;
		}
		return ((Number) number).doubleValue();
	}

	/**
	 * <p>
	 * 解析数值字符串为整数，去掉前缀字符，如N0123则为123，若不能转换则返回0
	 * </p>
	 * 
	 * @param value
	 * @return int
	 */
	public static int parseInt(String value) {
		if (value == null) {
			return 0;
		}
		value = value.replaceAll("^(\\D|0)+", "");
		try {
			return Integer.parseInt(value);
		} catch (NumberFormatException e) {
			return 0;
		}
	}

	/**
	 * <p>
	 * 解析百分比字符串为浮点数，如23.5%为23.5
	 * </p>
	 * 
	 * @param percent
	 * @return Float
	 */
	public static Float parsePercent(String percent) {
		if (percent == null || percent.indexOf('%') == -1) {
			return null;
		}
		try {
			return Float.valueOf(percent.replace("%", ""));
		} catch (NumberFormatException e) {
		}
		return null;
	}

	/**
	 * <p>
	 * 拆分字符串并转换成整数数组
	 * </p>
	 * 
	 * @param value
	 * @param serp
	 * @return int[]
	 */
	public static int[] parseInt(String value, String serp) {
		if (value == null || serp == null || serp.isEmpty())
			return null;
		String[] values = value.split(serp);
		List<Integer> ints = new ArrayList<Integer>();
		for (String val : values) {
			try {
				ints.add(Integer.valueOf(val));
			} catch (NumberFormatException e) {
			}
		}
		int[] is = new int[ints.size()];
		int index = 0;
		for (Integer i : ints) {
			is[index++] = i;
		}
		return is;
	}

	/**
	 * <p>
	 * 拆分字符串并转换成整数数组，数值拆分符，数值范围连接符
	 * </p>
	 * 
	 * @param value
	 * @param serp
	 * @return List
	 */
	public static List<Integer> parseInt(String value, String serp,
			String fromto) {
		List<Integer> ints = new ArrayList<Integer>();
		String[] props = value.split(serp);
		for (String prop : props) {
			try {
				ints.add(Integer.valueOf(prop.trim()));
			} catch (NumberFormatException e) {
				String[] vals = prop.split(fromto);
				if (vals.length != 2) {
					try {
						int start = Integer.parseInt(vals[0].trim());
						int end = Integer.parseInt(vals[1].trim());
						for (int i = start; i <= end; i++) {
							ints.add(i);
						}
					} catch (NumberFormatException e1) {
					}
				}
			}
		}
		return ints;
	}

	/**
	 * 获取指定数值的随机序列,从小到大排序
	 * 
	 * @param begin
	 * @param end
	 * @param count
	 * @return int[]
	 */
	public static int[] fetchRandom(int begin, int end, int count) {
		int len = end - begin;
		if (len <= 0) {
			return new int[] { begin };
		}
		int index = 0;
		if (len < count) {
			int[] ints = new int[len + 1];
			index = 0;
			for (int i = begin; i <= end; i++) {
				ints[index++] = i;
			}
			return ints;
		}
		Random random = new Random();
		int[] rints = new int[count];
		for (int i = 0; i < count; i++) {
			rints[i] = random.nextInt(len);
		}
		Arrays.sort(rints);
		int curr = rints[0];
		for (int i = 1; i < count; i++) {
			if (curr >= rints[i]) {
				curr = rints[i] = curr < end ? curr + 1 : curr;
			} else {
				curr = rints[i];
			}
		}
		curr = rints[count - 1];
		for (int i = count - 2; i >= 0; i--) {
			if (curr <= rints[i]) {
				curr = rints[i] = curr > 0 ? curr - 1 : 0;
			} else {
				curr = rints[i];
			}
		}
		return rints;
	}

	/**
	 * 或计算值数值
	 * 
	 * @param values
	 * @return int
	 */
	public static int orValue(int[] values) {
		if (values == null || values.length == 0) {
			return 0;
		}
		int value = 0;
		for (int val : values) {
			value |= val;
		}
		return value;
	}

	/**
	 * 解析带有单位的整数
	 * 
	 * @param str
	 * @return long
	 */
	public static long parseLong(String str) {
		long unit = 1;
		if (str.matches(".*(k|K).*")) {
			unit = 1024;
		} else if (str.matches(".*(m|M).*")) {
			unit = 1024 * 1024;
		} else if (str.matches(".*(g|G).*")) {
			unit = 1024 * 1024 * 1024;
		}
		double size = Double.parseDouble(str.replaceAll("[^(\\d|\\.)]", ""));
		return (long) (size * unit);
	}

}
