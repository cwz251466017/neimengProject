package com.fh.entity.app;

import java.util.List;

public class AppContactVo {

	private String groupId;
	private String groupName;
	private String level;
	private List<AppContactVo> children;
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public List<AppContactVo> getChildren() {
		return children;
	}
	public void setChildren(List<AppContactVo> children) {
		this.children = children;
	}
	
}
