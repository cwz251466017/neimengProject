package com.fh.entity.app;

import java.util.List;

public class AppContactUserVo {

	private String tag;
	private List<AppUserDetails> contacts;
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public List<AppUserDetails> getContacts() {
		return contacts;
	}
	public void setContacts(List<AppUserDetails> contacts) {
		this.contacts = contacts;
	}
	
}
