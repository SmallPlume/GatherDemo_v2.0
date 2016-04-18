package com.modules.base.orm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 树形节点
 * @author Acer
 *
 */
public class TreeNode {

	/**
	 * <p>
	 * 是否节点
	 * </p>
	 * 
	 * @return 是否为节点
	 */
	public boolean isNode() {
		return attributes == null || attributes.get("isNode") == null || (Boolean) attributes.get("isNode");
	}
	
	/**
	 * ID
	 */
	public String id;
	
	/**
	 * 上级ID
	 */
	public String pid;
	
	/**
	 * 节点名称
	 */
	public String name;
	
	/**
	 * 节点图标
	 */
	public String iconCls;
	
	/**
	 * 节点状态，‘open’或‘closed’
	 */
	public String open;
	
	/**
	 * 节点是否选中
	 */
	public Boolean checked;
	
	/**
	 * 节点附加属性
	 */
	public Map<String,Object> attributes;
	
	/**
	 * 子节点
	 */
	public List<TreeNode> children;
	
	/**
	 * 操作节点
	 */
	public List<TreeNode> wings;
	
	/**
	 * 添加一个操作节点
	 * 
	 * @param node
	 * @return 返回本节点的实例
	 */
	public TreeNode addWing(TreeNode node) {
		if (wings == null) {
			wings = new ArrayList<TreeNode>();
		}
		wings.add(node);
		return this;
	}

	/**
	 * 设置一个键值对
	 * 
	 * @param key
	 * @param value
	 * @return 返回本节点的实例
	 */
	public TreeNode putAttr(String key, Object value) {
		if (attributes == null) {
			attributes = new HashMap<String, Object>();
		}
		attributes.put(key, value);
		return this;
	}
}
