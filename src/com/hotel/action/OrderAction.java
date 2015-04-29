package com.hotel.action;

import java.util.List;

import com.hotel.entity.Customer;
import com.hotel.entity.Order;
import com.hotel.service.HotelService;
import com.hotel.service.OrderService;
import com.hotel.util.HotelUtil;


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
	private List<String> dayList;
	private String hotelName;
	private HotelService hotelService;
	private List<Order> orders;
	
	public HotelService getHotelService() {
		return hotelService;
	}

	public void setHotelService(HotelService hotelService) {
		this.hotelService = hotelService;
	}

	public String toOrder(){
		Customer customer = (Customer) session.get("loginCustomer");
		orderService.saveOrder(customer, roomId, hotelId, num, days);
		//返回days list 
		dayList = HotelUtil.formatFLday(days);
		//返回hotelName
		hotelName = hotelService.findHotelById(hotelId).getName();
		return "success";
	}
	
	public String checkOrder(){
		Customer customer = (Customer) session.get("loginCustomer");
		orderService.findOrderByCustomerId(customer.getId());
		return "checkOrder";
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

	public List<String> getDayList() {
		return dayList;
	}

	public void setDayList(List<String> dayList) {
		this.dayList = dayList;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}



}
