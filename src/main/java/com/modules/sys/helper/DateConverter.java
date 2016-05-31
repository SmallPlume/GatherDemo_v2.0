package com.modules.sys.helper;

import java.text.SimpleDateFormat;
import java.util.Date;  

import org.apache.commons.lang3.StringUtils;  
import org.springframework.core.convert.converter.Converter; 

/**
 * 自定义字符串转换符
 * 将前端传过来的字符串与对应的date类型进行转换
 * @author Acer
 *
 */
public class DateConverter implements Converter<String, Date> {

	public DateConverter() {  
        System.out.println("转换器:String——>Date");  
    }  
  
    @Override  
    public Date convert(String source) {  
        if(StringUtils.isBlank(source)) {  
            return null;  
        }  
         
        Date date = null;  
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
        try {  
            date = format.parse(source.trim());  
        } catch (Exception e) {  
            try {  
                format = new SimpleDateFormat("yyyyMMddHHmmss");  
                date = format.parse(source.trim());  
            } catch (Exception e1) {  
                try {  
                    format = new SimpleDateFormat("yyyy-MM-dd");  
                    date = format.parse(source.trim());  
                } catch (Exception e2) {  
                }  
            }  
        }  
        return date;  
    } 
}
