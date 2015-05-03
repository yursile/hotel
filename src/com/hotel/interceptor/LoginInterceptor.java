package com.hotel.interceptor;

import com.hotel.action.BaseAction;
import com.hotel.entity.Customer;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Customer customer = (Customer) ActionContext.getContext().getSession().get("loginCustomer");
		if(customer!=null){
			return invocation.invoke();
		}
		BaseAction baseAction = (BaseAction) invocation.getAction();
		baseAction.setResult("请先登录");
		return "notLogin";
	}

}
