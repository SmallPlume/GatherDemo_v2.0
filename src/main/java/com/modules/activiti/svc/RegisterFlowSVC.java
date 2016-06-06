package com.modules.activiti.svc;

import java.util.List;

import org.activiti.engine.task.Task;

import com.modules.activiti.orm.Flow;
import com.modules.base.orm.Page;


/**
 * 用户注册审核流程
 * @author Acer
 *
 */
public interface RegisterFlowSVC {
	
	/**
	 * 启动流程，赋予
	 * @param id
	 */
	public void startProcessInstance(String id,String key);
	
	/**
	 * 完成自己的任务
	 */
	public void completeMyPersonalTask(String taskId);
	
	/**
	 * 查看任务
	 */
	public Page<Flow> findMyPersonalTask(String id,int page,int rows);
	
}
