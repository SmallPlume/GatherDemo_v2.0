package com.modules.base.orm;

import java.util.List;
import java.util.Map;

public class Page<T> {
	
	public boolean notPage;

	/** 页码 */
	public int pageNumber;

	/** 页宽 **/
	public int pageSize;

	/** 总记录数 */
	public long total;

	/** 数据行 */
	public List<T> rows;

	/** 页脚行 */
	public List<Map<String, Object>> footer;

	/** 排序字段名 **/
	public String order;

	/** 排序方式 **/
	public String sort;

	public boolean isNotPage() {
		return notPage;
	}

	public void setNotPage(boolean notPage) {
		this.notPage = notPage;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	public List<Map<String, Object>> getFooter() {
		return footer;
	}

	public void setFooter(List<Map<String, Object>> footer) {
		this.footer = footer;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
	
}
