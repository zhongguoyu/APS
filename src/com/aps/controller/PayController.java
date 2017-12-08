package com.aps.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.aps.form.DonateForm;
import com.aps.pojo.Donate;
import com.aps.pojo.PayInfo;
import com.aps.service.DonateService;
import com.aps.util.PaymentUtil;

@Controller
public class PayController {
	
	private String keyValue="69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";
	
	@Autowired
	private DonateService donateService;
	
	@RequestMapping("pay")
	public String pay(HttpServletResponse response)throws IOException{
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//获取银行类型
		String pd_FrpId=request.getParameter("pd_FrpId");
		//获取交易金额
		String p3_Amt=request.getParameter("p3_Amt");
		//获取订单号,必须在商户中订单中是唯一
		String p2_Order=request.getParameter("p2_Order");
		
		String 	p0_Cmd="Buy",//业务类型 Buy为在线支付
		p1_MerId="10001126856", //商户编号，商户支付的唯一标示，需在易宝支付申请
		p4_Cur="CNY",//币种
		p5_Pid="",//用于显示商品信息
		p6_Pcat="",//商品种类
		p7_Pdesc="",//商品描述
		p8_Url="http://localhost:9090/APS/payBack.do",//支付成功后的回调地址
		p9_SAF="",//是否需要用户将送货地址留在易宝支付系统中 1表示保留，0表示不保留，默认为0
		pa_MP="",//商品扩展信息
		pr_NeedResponse="1";//支付成功的应答通知 固定为1
		//获取加密后的支付提交内容
		String hmac=PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, keyValue);
		//交易提交的URL
		StringBuffer url=new StringBuffer("https://www.yeepay.com/app-merchant-proxy/node?");
		url.append("&p0_Cmd="+p0_Cmd);
		url.append("&p1_MerId="+p1_MerId);
		url.append("&p2_Order="+p2_Order);
		url.append("&p3_Amt="+p3_Amt);
		url.append("&p4_Cur="+p4_Cur);
		url.append("&p5_Pid="+p5_Pid);
		url.append("&p6_Pcat="+p6_Pcat);
		url.append("&p7_Pdesc="+p7_Pdesc);
		url.append("&p8_Url="+p8_Url);
		url.append("&p9_SAF="+p9_SAF);
		url.append("&pa_MP="+pa_MP);
		url.append("&pd_FrpId="+pd_FrpId);
		url.append("&pr_NeedResponse="+pr_NeedResponse);
		url.append("&hmac="+hmac);
//		//重定向发送支付请求
//		response.sendRedirect(url.toString());
		return "redirect:"+url.toString();
	}
	
	@RequestMapping("payBack")
	public String payBack(HttpServletResponse response,DonateForm donateForm)throws ServletException, IOException{
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		request.setCharacterEncoding("utf-8");
		//获取支付结果 1表示支付成功
		String r1_Code=request.getParameter("r1_Code");
		String url = "";
		//支付状态编码 1表示支付成功
		if(r1_Code.equals("1")){
			//获取商家编号
			String p1_MerId = request.getParameter("p1_MerId");
			//获取支付金额
			String r3_Amt = request.getParameter("r3_Amt");
			//获取商品名称
			String r5_Pid = request.getParameter("r5_Pid");
			//获取订单号
			String r6_Order = request.getParameter("r6_Order");
			//获取交易银行
			String rb_BankId = request.getParameter("rb_BankId");
			//获取支付时间
			String rp_PayDate = request.getParameter("rp_PayDate");
			//封装交易数据
			PayInfo info = new PayInfo(p1_MerId, r3_Amt, r5_Pid, r6_Order, rb_BankId, rp_PayDate);
			request.setAttribute("payInfo", info);
			url = "page/success";
			Donate donate = new Donate();
			donate.setDonateMoney(Double.parseDouble(donateForm.getDonateMoney()));
			donate.setDonateName(donateForm.getDonateName());
			donate.setEmail(donateForm.getEmail());
			donate.setPhone(donateForm.getPhone());
			donate.setMessage(donateForm.getMessage());
			donateService.addDonate(donate);
		}
		else{
			request.setAttribute("error", "支付失败！");
			url = "page/failure";
		}
		return url;
	}
}
