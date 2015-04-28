package com.hotel.service;

import java.util.List;

import com.hotel.entity.Customer;
import com.hotel.entity.Order;

public interface OrderService {
	public List<Order> findOrderByCustomerId(long customerId);
	public void saveOrder(Order order,String day);
	public void saveOrder(Customer customer,long roomId,long hotelId,int num,String days);
}
