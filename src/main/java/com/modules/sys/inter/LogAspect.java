package com.modules.sys.inter;

import java.lang.reflect.Method;
import java.util.Date;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modules.sys.dao.LogDao;
import com.modules.sys.orm.Log;
import com.modules.sys.orm.Subscriber;

@Service
@Aspect
public class LogAspect {

	@Autowired
	private LogDao dao;
	
	public final static String SESSION_KEY = "SESSION_USER";
	
	/**
	 * 新增切入点
	 */
	@Pointcut("execution(* com.modules..svc.impl.*.save*(..))")
	public void saveCell(){}
	
	/**
	 * 更新切入点
	 */
	@Pointcut("execution(* com.modules..svc.impl.*.edit*(..))")
	public void editCell(){}
	
	/**
	 * 删除切入点
	 */
	@Pointcut("execution(* com.modules..svc.impl.*.delt*(..))")
	public void deltCell(){}
	
	/**
	 * 添加操作日志(后置通知)
	 * @param joinPoint
	 * @param rtv
	 * @throws Throwable
	 */
	@AfterReturning(value="saveCell()",argNames="rtv", returning="rtv")
	public void insertLog(JoinPoint joinPoint,Object rtv) throws Throwable{
		autoFinish(joinPoint,"新增操作");
	}
	
	/**
	 * 修改操作日志(后置通知) 
	 * @param joinPoint
	 * @param rtv
	 * @throws Throwable
	 */
    @AfterReturning(value="editCell()", argNames="rtv", returning="rtv")    
    public void updateLog(JoinPoint joinPoint, Object rtv) throws Throwable{    
    	autoFinish(joinPoint,"更新操作");
	}
	
    /**
     * 删除操作日志(后置通知) 
     * @param joinPoint
     * @param rtv
     * @throws Throwable
     */
    @AfterReturning(value="deltCell()",argNames="rtv", returning="rtv")  
    public void deleteLog(JoinPoint joinPoint, Object rtv) throws Throwable{  
    	autoFinish(joinPoint,"删除操作");
	}
	
    /** 
     * 使用Java反射来获取被拦截方法(insert、update)的参数值，  
     * 将参数值拼接为操作内容 
     * @param args 
     * @param mName 
     * @return 
     */  
    private String optionContent(Object[] args, String mName){  
        if(args == null){  
            return null;  
        }  
        StringBuffer rs = new StringBuffer();  
        rs.append(mName);  
        String className = null;  
        int index = 1;  
        //遍历参数对象   
        for(Object info : args){  
            //获取对象类型  
            className = info.getClass().getName();  
            className = className.substring(className.lastIndexOf(".") + 1);  
            rs.append("[参数"+index+"，类型:" + className + "，值:");  
            //获取对象的所有方法  
            Method[] methods = info.getClass().getDeclaredMethods();  
            // 遍历方法，判断get方法   
            for(Method method : methods){  
                String methodName = method.getName();  
                // 判断是不是get方法  
                if(methodName.indexOf("get") == -1){//不是get方法   
                    continue;//不处理  
                }  
                Object rsValue = null;  
                try{  
                    // 调用get方法，获取返回值  
                    rsValue = method.invoke(info);  
                }catch (Exception e) {  
                    continue;  
                }  
                //将值加入内容中  
                rs.append("(" + methodName+ ":" + rsValue + ")");  
            }  
            rs.append("]");  
            index ++;  
        }  
        return rs.toString();  
    }
    
    /**
     * 填充
     * @param log
     * @param sub
     * @return
     */
    private void autoFinish(JoinPoint joinPoint,String handle){
    	Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		Subscriber sub = (Subscriber) session.getAttribute(SESSION_KEY);
		if(sub.getId()==null || "".equals(sub.getId())){
			return ;
		}
		Log log = new Log();
		log.setUserid(sub.getId());
    	log.setUsername(sub.getUsername());
    	log.setCreatedate(new Date()); 
    	log.setIp(sub.getLoginorg());
    	log.setUrl(joinPoint.getSignature().toString());
		//获取方法名   
        String methodName = joinPoint.getSignature().getName();  
        //获取操作内容  
        String opContent = optionContent(joinPoint.getArgs(),methodName);
		log.setMethod(methodName);
		log.setParameter(opContent);
		log.setHandle(handle);
		dao.insert(log);
    }
}
