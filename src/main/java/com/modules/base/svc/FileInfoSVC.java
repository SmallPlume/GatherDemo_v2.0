package com.modules.base.svc;

import com.modules.base.orm.FileInfo;
import com.modules.base.orm.Result;

public interface FileInfoSVC {
	
	public Result save(FileInfo file);
	
	public Result delete(String id);
	
	public FileInfo queryById(String id);

}
