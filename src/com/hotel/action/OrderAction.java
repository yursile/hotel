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
	private String customerName;
	private String customerPhone;
	private long orderId;
	private String result;
	
	
	public HotelService getHotelService() {
		return hotelService;
	}

	public void setHotelService(HotelService hotelService) {
		this.hotelService = hotelService;
	}

	public String toOrder(){
		Customer customer = (Customer) session.get("loginCustomer");
		//String saveResult = orderService.saveOrder(customer, roomId, hotelId, num, days);
		String saveResult = orderService.saveOrder(customer, roomId, hotelId, num, days,customerName,customerPhone);
		//返回days list 
		dayList = HotelUtil.formatFLday(days);
		//返回hotelName
		hotelName = hotelService.findHotelById(hotelId).getName();
		//返回orderId
		orderId = orderService.findOrderByHotel(customer.getId(), hotelId).get(0).getId();
		return "success";
	}
	
	public String editOrder(){
		Customer customer = (Customer) session.get("loginCustomer");
		result = orderService.editOrder(customer, orderId, customerName, customerPhone);
		orders = orderService.findOrderByOrderId(customer.getId(), orderId);
		return "editOrder";
	}
	
	public String cancelOrder(){
		Customer customer = (Customer) session.get("loginCustomer");
		orders = orderService.findOrderByOrderId(customer.getId(), orderId);
		if(orders.get(0).getStatus()==2){
			result = "操作失败，您已经取消订单了";
		}else{
			result = orderService.cancelOrder(customer, orderId);
		}
		return "cancelOrder";
	}
	
	public String deleteOrder(){
		Customer customer = (Customer) session.get("loginCustomer");
		result = orderService.deleteOrder(customer, orderId);
		orders = orderService.findOrderByCustomerId(customer.getId());
		return "deleteOrder";
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

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public long getOrderId() {
		return orderId;
	}

	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}



}
