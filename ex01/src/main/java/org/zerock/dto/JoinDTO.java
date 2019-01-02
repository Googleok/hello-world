package org.zerock.dto;

public class JoinDTO {
	
	private String uid;
	private String upw;
	private String uname;
	private String uaddress1;
	private String uaddress2;
	private String uaddress3;
	private String uaddress4;
	private String uemail1;
	private String uemail2;
	private int uphone;
	private String uhometype;
	private String ustatus;
	
	public JoinDTO() {
		// TODO Auto-generated constructor stub
	}

	public JoinDTO(String uid, String upw, String uname, String uaddress1, String uaddress2, String uaddress3,
			String uaddress4, String uemail1, String uemail2, int uphone, String uhometype, String ustatus) {
		super();
		this.uid = uid;
		this.upw = upw;
		this.uname = uname;
		this.uaddress1 = uaddress1;
		this.uaddress2 = uaddress2;
		this.uaddress3 = uaddress3;
		this.uaddress4 = uaddress4;
		this.uemail1 = uemail1;
		this.uemail2 = uemail2;
		this.uphone = uphone;
		this.uhometype = uhometype;
		this.ustatus = ustatus;
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

	public String getUaddress1() {
		return uaddress1;
	}

	public void setUaddress1(String uaddress1) {
		this.uaddress1 = uaddress1;
	}

	public String getUaddress2() {
		return uaddress2;
	}

	public void setUaddress2(String uaddress2) {
		this.uaddress2 = uaddress2;
	}

	public String getUaddress3() {
		return uaddress3;
	}

	public void setUaddress3(String uaddress3) {
		this.uaddress3 = uaddress3;
	}

	public String getUaddress4() {
		return uaddress4;
	}

	public void setUaddress4(String uaddress4) {
		this.uaddress4 = uaddress4;
	}

	public String getUemail1() {
		return uemail1;
	}

	public void setUemail1(String uemail1) {
		this.uemail1 = uemail1;
	}

	public String getUemail2() {
		return uemail2;
	}

	public void setUemail2(String uemail2) {
		this.uemail2 = uemail2;
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

	public String getUstatus() {
		return ustatus;
	}

	public void setUstatus(String ustatus) {
		this.ustatus = ustatus;
	}

	@Override
	public String toString() {
		return "JoinDTO [uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", uaddress1=" + uaddress1 + ", uaddress2="
				+ uaddress2 + ", uaddress3=" + uaddress3 + ", uaddress4=" + uaddress4 + ", uemail1=" + uemail1
				+ ", uemail2=" + uemail2 + ", uphone=" + uphone + ", uhometype=" + uhometype + ", ustatus=" + ustatus
				+ "]";
	}

	

	
	
}
