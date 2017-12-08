package com.aps.pojo;

public class PayInfo {
	//商家编号
	private String p1_MerId;
	//支付金额
	private String r3_Amt;
	//商品名称
	private String r5_Pid;
	//订单号
	private String r6_Order;
	//银行编号
	private String rb_BankId;
	//支付时间
	private String rp_PayDate;
	
	public PayInfo(String p1_MerId, String r3_Amt, String r5_Pid, String r6_Order,
			String rb_BankId, String rp_PayDate) {
		super();
		this.p1_MerId = p1_MerId;
		this.r3_Amt = r3_Amt;
		this.r5_Pid = r5_Pid;
		this.r6_Order = r6_Order;
		this.rb_BankId = rb_BankId;
		this.rp_PayDate = rp_PayDate;
	}
	public PayInfo(){}
	public String getP1_MerId() {
		return p1_MerId;
	}
	public void setP1_MerId(String p1MerId) {
		p1_MerId = p1MerId;
	}
	public String getR3_Amt() {
		return r3_Amt;
	}
	public void setR3_Amt(String r3Amt) {
		r3_Amt = r3Amt;
	}
	public String getR5_Pid() {
		return r5_Pid;
	}
	public void setR5_Pid(String r5Pid) {
		r5_Pid = r5Pid;
	}
	public String getR6_Order() {
		return r6_Order;
	}
	public void setR6_Order(String r6Order) {
		r6_Order = r6Order;
	}
	public String getRb_BankId() {
		return rb_BankId;
	}
	public void setRb_BankId(String rbBankId) {
		rb_BankId = rbBankId;
	}
	public String getRp_PayDate() {
		return rp_PayDate;
	}
	public void setRp_PayDate(String rpPayDate) {
		rp_PayDate = rpPayDate;
	}
	
	
}
