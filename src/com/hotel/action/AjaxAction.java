package com.hotel.action;

import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;

import com.hotel.entity.Customer;
import com.hotel.exception.ServException;
import com.hotel.service.UserService;

public class AjaxAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private Customer customer;
	private UserService userService;
	private boolean isRememberd;
	private String result;
	public String login(){
		try {
			
			Customer loginCustomer = userService.login(customer);
			if(loginCustomer!=null){
				session.put("loginCustomer", loginCustomer);
				/*
				if(isRememberd){
					 Cookie cookie = new Cookie(name, value);
				     cookie.setMaxAge(60*60*24*365);
				     ServletActionContext.getResponse().addCookie(cookie);
				}
				*/
				setResult("success");
			}else{
				setResult("重新登录");
			}
			return "login";
		} catch (ServException e) {
			e.printStackTrace();
			return "login";
		}
		
	}
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}


	public boolean isRememberd() {
		return isRememberd;
	}

	public void setRememberd(boolean isRememberd) {
		this.isRememberd = isRememberd;
	}
}
