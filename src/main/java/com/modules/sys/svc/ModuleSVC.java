package com.modules.sys.svc;

import java.util.List;

import com.modules.base.orm.Result;
import com.modules.base.orm.TreeNode;
import com.modules.sys.orm.Module;

public interface ModuleSVC {

	public Result saveModule(Module mod);
	
	public Result deleteModule(String id);
	
	public List<TreeNode> getMenuTrees();
}
