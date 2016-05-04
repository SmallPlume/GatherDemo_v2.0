package com.modules.sys.svc;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.modules.base.orm.Result;
import com.modules.sys.orm.Subscriber;

public interface SubscriberSVC {
	
	public Subscriber getUserByName(String userName);
	
	public Set<String> getRoles(String userName);
	
	public Set<String> getPermissions(String userName);
	
	public Result save(Subscriber sub);
	
	public Subscriber findOne(String id);
	
	public List<Subscriber> queryList(Subscriber sub);
	
	public List<Subscriber> queryListByXml(Map<String,String> map);
	
	public void delete(String id);
	
	public void update(Subscriber sub);
	
	public Result editActivity(String id,String ifactivate,String ifspeak);
	
}
