package com.modules.activiti.orm;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;

public class Flow implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 流程键
	 */
	public String key;
	
	/**
	 * 流程名称
	 */
	public String name;
	
	/**
	 * 流程类型
	 */
	public String flowType;
	
	/**
	 * 发起时间
	 */
	public Date startTime;
	
	/**
	 * 发起人名称
	 */
	public String initiator;
	
	/**
	 * 用户ID
	 */
	public String userId;

	/**
	 * 用户名称
	 */
	public String userName;

	/**
	 * 附加变量
	 */
	public Map<String, Object> vars;

	/**
	 * 流程名称
	 */
	public String flowName;

	/**
	 * 返回的流程
	 */
	public ProcessInstance pi;

	/**
	 * 返回当前的流程任务
	 */
	public Task currTask;

	/**
	 * 返回当前的流程任务列表
	 */
	public List<Task> currTasks;
	
	public Flow() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Flow(String key, String name, String flowType, Date startTime,
			String initiator, String userId, String userName,
			Map<String, Object> vars, String flowName, ProcessInstance pi,
			Task currTask, List<Task> currTasks) {
		super();
		this.key = key;
		this.name = name;
		this.flowType = flowType;
		this.startTime = startTime;
		this.initiator = initiator;
		this.userId = userId;
		this.userName = userName;
		this.vars = vars;
		this.flowName = flowName;
		this.pi = pi;
		this.currTask = currTask;
		this.currTasks = currTasks;
	}


	@Override
	public String toString() {
		return "Flow [key=" + key + ", name=" + name + ", flowType=" + flowType
				+ ", startTime=" + startTime + ", initiator=" + initiator
				+ ", userId=" + userId + ", userName=" + userName + ", vars="
				+ vars + ", flowName=" + flowName + ", pi=" + pi
				+ ", currTask=" + currTask + ", currTasks=" + currTasks + "]";
	}


}
