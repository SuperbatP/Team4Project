/*
package com.PhoenixHospital.login.vo;
//이미 제공됐다.

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.ArrayList;
import java.util.List;

public class UserVO {
	private String userId;
	private String userName;
	private String userPass;
	private String userRole;

	// toString() 구현
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.MULTI_LINE_STYLE);
	}
	// 생성자
	public UserVO() {

	}

	// 생성자
	public UserVO(String userId, String userName, String userPass, String userRole) {
		this.userId = userId;
		this.userName = userName;
		this.userPass = userPass;
		this.userRole = userRole;
	}


	// 맴버필드의 get/set 메서드 생성

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public List<GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<>();

		// 권한 이름을 문자열로 변환하여 SimpleGrantedAuthority 객체로 만들고 리스트에 추가
		authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
		// 필요에 따라 다른 권한을 추가

		return authorities;
	}

}*/
