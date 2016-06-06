package com.modules.activiti.svc;

public interface FlowSVC {
	
	/**
	 * 启动流程，赋予
	 * @param id
	 */
	public void startProcessInstance(String id);
	
	/**
	 * 完成自己的任务
	 */
	public void completeMyPersonalTask(String id);
	
	/**
	 * 查看任务
	 */
	public void findMyPersonalTask(String id);
	

}
