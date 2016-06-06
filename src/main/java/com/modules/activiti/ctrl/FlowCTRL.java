package com.modules.activiti.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.modules.activiti.orm.Flow;
import com.modules.activiti.svc.RegisterFlowSVC;
import com.modules.base.orm.Page;
import com.modules.base.orm.User;

@Controller
@RequestMapping("/flow/")
public class FlowCTRL {

	@Autowired
	private RegisterFlowSVC flowSVC;
	
	/**
	 * 跳转到工作流页面
	 * @return
	 */
	@RequestMapping(value="index",method = RequestMethod.GET)
	public String flowIndex(){
		return "/activiti/FlowIndex";
	}
	
	/**
	 * 获取工作流列表
	 * @param flow
	 * @param page
	 * @param rows
	 * @param user
	 * @return
	 */
	@RequestMapping(value="queryList",method = RequestMethod.POST)
	public @ResponseBody Page<Flow> flowList(Flow flow,int page,int rows,User user){
		Page<Flow> list = flowSVC.findMyPersonalTask(user.getId(),page,rows);
		return list;
	}
	
}
