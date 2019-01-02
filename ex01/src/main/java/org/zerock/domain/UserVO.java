package org.zerock.domain;

public class UserVO {
	
	private String uid;
	private String upw;
	private String uname;
	private String uaddress;
	private String uemail;
	private int uphone;
	private String uhometype;
	private String status;
	private String userCertification;
	private int upoint;
	
	
	
	public String getUserCertification() {
		return userCertification;
	}
	public void setUserCertification(String userCertification) {
		this.userCertification = userCertification;
	}
	public String getUaddress() {
		return uaddress;
	}
	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public int getUphone() {
		return uphone;
	}
	public void setUphone(int uphone) {
		this.uphone = uphone;
	}
	public String getUhometype() {
		return uhometype;
	}
	public void setUhometype(String uhometype) {
		this.uhometype = uhometype;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getUpoint() {
		return upoint;
	}
	public void setUpoint(int upoint) {
		this.upoint = upoint;
	}
	@Override
	public String toString() {
		return "UserVO [uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", uaddress=" + uaddress + ", uemail="
				+ uemail + ", uphone=" + uphone + ", uhometype=" + uhometype + ", status=" + status + ", userCertification="
				+ userCertification + ", upoint=" + upoint + "]";
	}
	
	
	
}
