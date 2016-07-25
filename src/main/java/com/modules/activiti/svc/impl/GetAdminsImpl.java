package com.modules.activiti.svc.impl;

import java.util.List;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.modules.sys.dao.SubscriberDao;
import com.modules.sys.orm.Subscriber;

/**
 * º‡Ã˝¿‡
 * @author Acer
 *
 */
@Component("taskListener")
public class GetAdminsImpl implements TaskListener {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private SubscriberDao dao;
	
	public void setDao(SubscriberDao dao) {
		this.dao = dao;
	}

	@Override
	public void notify(DelegateTask delegateTask) {
		List<Subscriber> candidateUsers = dao.queryByRoleNo("admin");
		if(candidateUsers.size()>0){
			for (Subscriber subscriber : candidateUsers) {
				delegateTask.addCandidateUser(subscriber.getId());
			}
		}
	}

}
