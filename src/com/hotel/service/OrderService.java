package com.hotel.service;

import java.util.List;

import com.hotel.entity.Customer;
import com.hotel.entity.Order;

public interface OrderService {
	public List<Order> findOrderByCustomerId(long customerId);
	public List<Order> findOrder(long customerId,int startTime,int endTime,int orderStatus);
	public List<Order> findOrderByOrderId(long customerId,long orderId);
	public List<Order> findOrderByHotel(long customerId,long hotelId);
	public void saveOrder(Order order,String day);
	public String saveOrder(Customer customer,long roomId,long hotelId,int num,String days);
}
