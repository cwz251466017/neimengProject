package com.fh.entity.app;

import java.util.List;

public class AppLoginUserVo {

	private AppUser user;
	private String token;
	private List<AppUserPermissions> permissions;
	private AppUserDetails details;
	public AppUser getUser() {
		return user;
	}
	public void setUser(AppUser user) {
		this.user = user;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public List<AppUserPermissions> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<AppUserPermissions> permissions) {
		this.permissions = permissions;
	}
	public AppUserDetails getDetails() {
		return details;
	}
	public void setDetails(AppUserDetails details) {
		this.details = details;
	}
	
	
}
