package com.hotel.action;

import java.util.List;

import com.hotel.entity.Customer;
import com.hotel.entity.Order;
import com.hotel.service.OrderService;

public class CheckOrderAction extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Order> orders;
	private OrderService orderService;
	private long orderId;
	private int startTime;
	private int endTime;
	private int orderStatus;
	
	public String checkOrder(){
		Customer customer = (Customer) session.get("loginCustomer");
		if(customer==null){
			//没登录
		}else{
			if(orderId!=0){
				orders = orderService.findOrderByOrderId(customer.getId(), orderId);
			}else{
				orders = orderService.findOrder(customer.getId(), startTime, endTime, orderStatus);
			}
		}
		return "checkOrder";
	}
	
	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public long getOrderId() {
		return orderId;
	}

	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}

	public int getStartTime() {
		return startTime;
	}

	public void setStartTime(int startTime) {
		this.startTime = startTime;
	}

	public int getEndTime() {
		return endTime;
	}

	public void setEndTime(int endTime) {
		this.endTime = endTime;
	}

	public int getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

	
	
}
