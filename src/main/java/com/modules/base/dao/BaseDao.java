package com.modules.base.dao;

import tk.mybatis.mapper.common.base.BaseDeleteMapper;
import tk.mybatis.mapper.common.base.BaseInsertMapper;
import tk.mybatis.mapper.common.base.BaseSelectMapper;
import tk.mybatis.mapper.common.base.BaseUpdateMapper;

public interface BaseDao<T> extends
							BaseSelectMapper<T>,
							BaseInsertMapper<T>,
							BaseUpdateMapper<T>,
							BaseDeleteMapper<T> {

}