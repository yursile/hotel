package com.hotel.action;

import com.hotel.entity.Customer;
import com.hotel.service.OrderService;


public class OrderAction extends BaseAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private long roomId;
	private long hotelId;
	private int num;
	private String days;
	private OrderService orderService;
	
	public String toOrder(){
		Customer customer = (Customer) session.get("loginCustomer");
		orderService.saveOrder(customer, roomId, hotelId, num, days);
		return "success";
	}
	
	public long getRoomId() {
		return roomId;
	}

	public void setRoomId(long roomId) {
		this.roomId = roomId;
	}

	public long getHotelId() {
		return hotelId;
	}

	public void setHotelId(long hotelId) {
		this.hotelId = hotelId;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}



}
