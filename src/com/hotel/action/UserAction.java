package com.hotel.action;

import com.hotel.entity.Customer;
import com.hotel.exception.ServException;
import com.hotel.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends BaseAction{
	private UserService userService;
	private Customer customer;
	private String repassword;
	private String code;
	private String result;
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String login(){
		try {
			Customer loginCustomer = userService.login(customer);
			if(loginCustomer!=null){
				session.put("loginCustomer", loginCustomer);
				return "success";
			}else{
				return "login";
			}
		} catch (ServException e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String regist(){
		try {
			userService.regist(customer);
			setResult("注册成功");
			return "success";
		} catch (ServException e) {
			e.printStackTrace();
			return "regist";
		}
	}
	
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}
