package com.hotel.action;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.hotel.entity.Customer;
import com.hotel.entity.Hotel;
import com.hotel.entity.Order;
import com.hotel.entity.Room;
import com.hotel.service.OrderService;

public class TestAction {
	private OrderService orderService;
	
	public String execute(){
		
		Customer customer = new Customer();
		Order order = new Order();
		Hotel hotel = new Hotel();
		Room room = new Room();
		room.setType("单间");
		Room room2 = new Room();
		room2.setType("标间");
		
		Set<Room> rooms = new HashSet<Room>();
		rooms.add(room);
		rooms.add(room2);
		
		customer.setName("kk");
		hotel.setName("酒店");
		hotel.setRooms(rooms);
		
		order.setRoom(room2);
		order.setCustomer(customer);
		//orderService.saveOrder(order);
//		List<Order>orders = orderService.findOrderByCustomerId(12);
		
		return "success";
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
}
