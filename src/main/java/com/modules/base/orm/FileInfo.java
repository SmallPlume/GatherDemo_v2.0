package com.modules.base.orm;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="app_files")
public class FileInfo {
	
	/** id **/
	@Id
	@GeneratedValue(generator = "UUID",strategy = GenerationType.IDENTITY)
	private String id;
	
	/** 文件名称 **/
	private String name;
	
	/** 文件大小 **/
	private long length;

	/** 文件类型 **/
	private String contentType;
	
	/** 文件拓展名 **/
	private String extName;
	
	/** 文件路径 **/
	private String path;
	
	/** 状态 **/
	private String status;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getLength() {
		return length;
	}

	public void setLength(long length) {
		this.length = length;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getExtName() {
		return extName;
	}

	public void setExtName(String extName) {
		this.extName = extName;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
