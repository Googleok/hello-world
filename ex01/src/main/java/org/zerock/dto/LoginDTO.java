package org.zerock.dto;

public class LoginDTO {

	private String uid;
	private String upw;
	private Integer userCertification;
	private boolean useCookie;
	
	public LoginDTO() {
	}
	
	public LoginDTO(String uid, String upw, Integer userCertification, boolean useCookie) {
		super();
		this.uid = uid;
		this.upw = upw;
		this.userCertification = userCertification;
		this.useCookie = useCookie;
	}

	public Integer getUserCertification() {
		return userCertification;
	}

	public void setUserCertification(Integer userCertification) {
		this.userCertification = userCertification;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUpw() {
		return upw;
	}

	public void setUpw(String upw) {
		this.upw = upw;
	}

	public boolean isUseCookie() {
		return useCookie;
	}

	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}

	@Override
	public String toString() {
		return "LoginDTO [uid=" + uid + ", upw=" + upw + ", userCertification=" + userCertification + ", useCookie="
				+ useCookie + "]";
	}
	
}
